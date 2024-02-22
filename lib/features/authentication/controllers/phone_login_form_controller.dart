import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shop/Screens/product_overview_screen.dart';
import 'package:shop/features/authentication/authentication_repository/authentication_repository.dart';

class PhoneLoginFormController extends GetxController {
  static PhoneLoginFormController get phone => Get.find();
  final phonecontroller = TextEditingController();
  final otpcontroller = TextEditingController();

  // ignore: non_constant_identifier_names
  void Phonelogin(phoneNo) {
    AuthenticationRepo.instance.loginPhoneno(phoneNo);
  }

  void verifyOtp(String otp) async {
    var isverified = await AuthenticationRepo.instance.verifyOtp(otp);
    isverified ? Get.offAll(const ProductOverviewScreen()) : Get.back();
  }

  @override
  void onClose() {
    phonecontroller.dispose();
  }
}
