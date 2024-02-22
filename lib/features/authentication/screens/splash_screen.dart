
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shop/features/authentication/controllers/splash_screen_controller.dart';


class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splashScreenController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    splashScreenController.startAnimation();
    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: 300,
          left: 100,
          child: Image.asset(
            'assets/images/img.png',
            height: 200,
            width: 200,
          ),
        )
      ]),
    );
  }
}
