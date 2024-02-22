import 'package:get/get.dart';

class LoginSignupScreenController extends GetxController {
  static LoginSignupScreenController get find => Get.find();
  RxBool isLogin = true.obs;
  toggleForm() {
    isLogin.value = !isLogin.value;
  }

  RxBool isEmail = true.obs;
  toggle1Form() {
    isEmail.value = !isEmail.value;
  }
}
