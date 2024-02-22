import 'package:flutter/material.dart';
import 'package:shop/features/authentication/authentication_repository/authentication_repository.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(children: [
        const Text(
          'OR',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 30,
        ),
        OutlinedButton(
          onPressed: () async {
            await AuthenticationRepo.instance.signInWithGoogle();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/googleLogo.png',
                  height: 30,
                  width: 30,
                ),
                Text(
                  'Login with Google'.toUpperCase(),
                  style: const TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        OutlinedButton(
          onPressed: () {
            //  AuthenticationRepo.instance.signInWithFacebook();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/Facebook_Logo.png',
                  height: 30,
                  width: 30,
                ),
                Text(
                  'Login with facebook'.toUpperCase(),
                  style: const TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ]),
    );
  }
}
