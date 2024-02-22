import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '/features/authentication/model_provider/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createuser(UserModel user) async {
    await _db
        .collection("Users")
        .add(user.toJson())
        .whenComplete(() => Get.snackbar("Success", "The user has been created",
            snackPosition: SnackPosition.BOTTOM))
        // ignore: body_might_complete_normally_catch_error
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong",
          snackPosition: SnackPosition.BOTTOM);
    });
  }

  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("Users").where("Email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<UserModel> getUserDetailsphone(String phone) async {
    final snapshot =
        await _db.collection("Users").where("Phone", isEqualTo: phone).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<void> updateUser(UserModel user) async {
    await _db.collection("Users").doc(user.id).update(user.toJson());
  }
}
