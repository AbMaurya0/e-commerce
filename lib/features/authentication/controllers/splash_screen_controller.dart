import 'package:get/get.dart';
import 'package:shop/Screens/product_overview_screen.dart';
import 'package:shop/features/authentication/authentication_repository/authentication_repository.dart';
import 'package:shop/features/authentication/storage_service/storage_service.dart';

import '../screens/Login_or_signup_screen.dart';

class SplashScreenController extends GetxController {
  final service = Get.put(StorageService());
  final auth = Get.put(AuthenticationRepo());
  static SplashScreenController get find => Get.find();
  Future startAnimation() async {
    await Future.delayed(const Duration(seconds: 3));
    // ignore: unnecessary_null_comparison
    auth.firebaseUser == null
        ? Get.off(LoginSignupScreen())
        : Get.offAll(const ProductOverviewScreen());

    String? token = service.getToken();
    token == null
        ? Get.off(() => LoginSignupScreen())
        : Get.offAll(const ProductOverviewScreen());
  }
}
