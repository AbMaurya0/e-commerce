import 'package:flutter/material.dart';
import 'package:shop/features/authentication/Common_widgets/loginscreenheader.dart';
import 'package:shop/features/authentication/forms/Signupform.dart';

class CreateUserScreen extends StatelessWidget {
  const CreateUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [const LoginScreenHeader(), SignupForm()],
        ),
      ),
    );
  }
}
