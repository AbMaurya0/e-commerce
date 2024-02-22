import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop/Screens/product_overview_screen.dart';
import 'package:shop/features/authentication/model_provider/user_model.dart';
import 'package:shop/features/authentication/screens/splash_screen.dart';
import 'package:shop/features/authentication/storage_service/storage_service.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:shop/features/authentication/user_repository/user_repository.dart';

import '../Exceptions/SignupwithEmailPassfailure.dart';

class AuthenticationRepo extends GetxController {
  static AuthenticationRepo get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  late final Rx<User?> firebaseUser;
  final userrepo = Get.put(UserRepository());

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());

    firebaseUser.value != null
        ? Get.offAll(() => const ProductOverviewScreen())
        : Get.off(() => SplashScreen());

    super.onReady();
  }

  Future<void> createUserWithEmailandPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const ProductOverviewScreen())
          : Get.to(() => SplashScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignupWithEmailPassFail.code(e.code);
      print('FIREBASE AUTH EXCEPTION-${ex.message}');
      throw ex;
    } catch (_) {
      final ex = SignupWithEmailPassFail();
      print('Exception - ${ex.message}');
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const ProductOverviewScreen())
          : Get.to(() => SplashScreen());
    } on FirebaseAuthException {
      Get.snackbar('Error!', 'User doesnt exist');
    }
  }

  RxString id = "".obs;
  Future<void> loginPhoneno(String phoneNo) async {
    await _auth.verifyPhoneNumber(
        verificationCompleted: (credentials) async {
          await _auth.signInWithCredential(credentials);
        },
        verificationFailed: (e) {
          if (e.code == 'invalid-phone-number') {
            Get.snackbar('Error', 'The Phone no is invalid');
          } else {
            Get.snackbar('Error', 'Someting went wrong');
          }
        },
        codeSent: (verifyid, token) {
          id.value = verifyid;
        },
        codeAutoRetrievalTimeout: (id) {
          this.id.value = id;
        },
        phoneNumber: phoneNo);
  }

  Future<bool> verifyOtp(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(verificationId: id.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
      //await FacebookAuth.instance.signOut();
      firebaseUser.value != null
          ? Get.offAll(() => const ProductOverviewScreen())
          : Get.to(() => SplashScreen());
      StorageService.instance.removeToken();
    } catch (e) {
      print(e);
    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount == null) {
        // The user cancelled sign-in, so return without doing anything
        return null;
      } else {
        final GoogleSignInAuthentication googleAuth =
            await googleSignInAccount.authentication;

        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential authResult =
            await _auth.signInWithCredential(credential);
      }
    } on PlatformException catch (error) {
      print(error);
      Get.snackbar('ERROR', 'Something went wrong');
    }

    firebaseUser.value != null
        ? Get.offAll(() => const ProductOverviewScreen())
        : Get.to(() => SplashScreen());
    return null;
  }

  Future<void> createUser(UserModel user) async {
    await userrepo.createuser(user);
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
