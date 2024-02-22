import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shop/Screens/product_overview_screen.dart';
import 'package:shop/features/authentication/Apis/Apidata.dart';
import 'package:shop/features/authentication/authentication_repository/authentication_repository.dart';
import 'package:shop/features/authentication/storage_service/storage_service.dart';

class LoginFormController extends GetxController {
  static LoginFormController get find => Get.find();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  final passfocusnode = FocusNode();
  RxBool obscureText = true.obs;

  RxBool isloading = false.obs;

  showtext() {
    obscureText.value = !obscureText.value;
  }

  void loginUser(String emailcontroller, String passwordcontroller) {
    isloading.value = true;
    AuthenticationRepo.instance.login(emailcontroller, passwordcontroller);
    isloading.value = false;
  }

  @override
  void onClose() {
    passfocusnode.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();

    super.onClose();
  }

  Future<void> login(String email, String password) async {
    isloading.value = true;
    final response = await http.post(Uri.parse(Apidata.login_api), headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    }, body: {
      'email': email,
      'password': password,
    });
    isloading.value = false;

    if (response.statusCode == 200) {
      Get.offAll(() => const ProductOverviewScreen());
      Map<String, dynamic> res = json.decode(response.body);
      String token = res['access_token'];
      StorageService.instance.saveToken(token);
    } else {
      Get.snackbar('Error', 'Unable to login');
    }
  }
}
