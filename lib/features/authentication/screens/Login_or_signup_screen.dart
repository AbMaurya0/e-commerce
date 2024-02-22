import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/features/authentication/forms/Signupform.dart';
import 'package:shop/features/authentication/forms/loginform.dart';
import 'package:shop/features/authentication/forms/phoneloginform.dart';

import '../Common_widgets/login_screen_footer.dart';
import '../Common_widgets/loginscreenheader.dart';
import '../controllers/login_signup_screen_controller.dart';

class LoginSignupScreen extends StatelessWidget {
  LoginSignupScreen({super.key});
  static const String routeName = '/LoginSignupScreen';
  final lscontrol = Get.put(LoginSignupScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Obx(
        () => Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const LoginScreenHeader(),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: lscontrol.isLogin.value
                ? Row(
                    children: [
                      TextButton(
                          onPressed: lscontrol.toggle1Form,
                          child: Text((lscontrol.isEmail.value
                              ? 'Use Number Instead'
                              : 'Use Email Instead'))),
                    ],
                  )
                : const SizedBox.shrink(),
          ),
          lscontrol.isLogin.value
              ? (lscontrol.isEmail.value ? Loginform() : Phoneform())
              : (lscontrol.isLogin.value ? Loginform() : SignupForm()),
          TextButton(
            onPressed: lscontrol.toggleForm,
            child: lscontrol.isEmail.value
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        lscontrol.isLogin.value
                            ? 'Don\'t have an account?'
                            : 'Already have an account? ',
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(lscontrol.isLogin.value ? 'Signup' : 'Login'),
                    ],
                  )
                : const SizedBox.shrink(),
          ),
          const LoginFooter(),
        ]),
      ),
    ));
  }
}
