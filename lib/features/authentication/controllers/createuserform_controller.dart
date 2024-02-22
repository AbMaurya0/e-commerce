import 'package:flutter/material.dart';
import 'package:get/get.dart';

class createuserformController extends GetxController {
  static createuserformController get instance => Get.find();
  final emailfocusnode = FocusNode();
  final passfocusnode = FocusNode();
  final confirmfocusnode = FocusNode();
  final phonefocusnode = FocusNode();
  final emailcontroller = TextEditingController();

  final passwordcontroller = TextEditingController();

  final phonenocontroller = TextEditingController();

  TextEditingController? confirmpasswordcontroller;

  final namecontroller = TextEditingController();
  RxBool obscureText = false.obs;
  showtext() {
    obscureText.value = !obscureText.value;
  }

  @override
  void onClose() {
    confirmfocusnode.dispose();
    passfocusnode.dispose();
    emailfocusnode.dispose();
    phonefocusnode.dispose();

    super.onClose();
  }
}
