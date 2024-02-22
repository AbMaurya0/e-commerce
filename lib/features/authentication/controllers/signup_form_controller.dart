import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/Screens/product_overview_screen.dart';
import 'package:shop/features/authentication/Apis/Apidata.dart';
import 'package:shop/features/authentication/authentication_repository/authentication_repository.dart';
import 'package:http/http.dart' as http;
import 'package:shop/features/authentication/storage_service/storage_service.dart';

class SignupController extends GetxController {
  static SignupController get find => Get.find();
  final emailfocusnode = FocusNode();
  final passfocusnode = FocusNode();
  final confirmfocusnode = FocusNode();
  final phonefocusnode = FocusNode();
  final emailcontroller = TextEditingController();

  final passwordcontroller = TextEditingController();

  final phonenocontroller = TextEditingController();

  TextEditingController? confirmpasswordcontroller;

  final namecontroller = TextEditingController();
  Map<String, dynamic> res = {};

  RxBool obscureText = false.obs;
  RxBool isLoading = false.obs;

  showtext() {
    obscureText.value = !obscureText.value;
  }

//registeruser method is for register using firebase
  void registeruser(String email, String password) {
    AuthenticationRepo.instance.createUserWithEmailandPassword(email, password);
  }

  @override
  void onClose() {
    confirmfocusnode.dispose();
    passfocusnode.dispose();
    emailfocusnode.dispose();
    phonefocusnode.dispose();

    super.onClose();
  }

// This below method is to register user using api
  Future<void> register(String email, password, name) async {
    isLoading.value = true;
    final response = await http.post(
      Uri.parse(Apidata.register_api),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: {
        'email': email,
        'password': password,
        'name': name,
      },
    );

    isLoading.value = false;

    if (response.statusCode == 200) {
      isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : Get.offAll(() => const ProductOverviewScreen());
      res = (json.decode(response.body));
      String token = res['access_token'];
      StorageService.instance.saveToken(token);
      print(res);
    } else {
      Get.snackbar('Error', 'Failed to register user');
    }
  }
}
