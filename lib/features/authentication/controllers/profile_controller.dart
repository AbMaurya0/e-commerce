import 'package:get/get.dart';
import 'package:shop/features/authentication/authentication_repository/authentication_repository.dart';
import 'package:shop/features/authentication/model_provider/user_model.dart';
import 'package:shop/features/authentication/user_repository/user_repository.dart';

// ignore: camel_case_types
class profileController extends GetxController {
  static profileController get instance => Get.find();
  final _authrepo = Get.put(AuthenticationRepo());
  final _userRepo = Get.put(UserRepository());

  getUserdata() {
    final email = _authrepo.firebaseUser.value!.email;
    final phone = _authrepo.firebaseUser.value!.phoneNumber;
    if (phone != null) {
      return _userRepo.getUserDetailsphone(phone);
    }
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      //  Get.snackbar('Error', 'Failed to login');
    }
  }

  updateUser(UserModel user) async {
    await _userRepo.updateUser(user);
  }
}
