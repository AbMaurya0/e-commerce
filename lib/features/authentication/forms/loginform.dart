import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_form_controller.dart';

class Loginform extends StatelessWidget {
  Loginform({super.key});

  final loginControl = Get.put(LoginFormController());

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: loginControl.emailcontroller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              labelText: 'Email',
              hintText: 'Enter your email',
              prefixIcon: const Icon(Icons.mail),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email address';
              }
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                  .hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
            onSaved: (value) {},
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(loginControl.passfocusnode);
            },
          ),
          const Padding(padding: EdgeInsets.only(top: 30)),
          Obx(
            () => TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: loginControl.passwordcontroller,
              obscureText: loginControl.obscureText.value,
              focusNode: loginControl.passfocusnode,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                    icon: Icon(loginControl.obscureText.value
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: loginControl.showtext),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty || value.length < 6) {
                  return 'Please enter a password with at least 6 characters';
                }
                return null;
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Forget Password?'),
              ),
            ],
          ),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  loginControl.loginUser(
                      loginControl.emailcontroller.text.trim(),
                      loginControl.passwordcontroller.text.trim());
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Obx(
                    () => loginControl.isloading.value
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            'Login'.toUpperCase(),
                            style: const TextStyle(fontSize: 15),
                          ),
                  ),
                ),
              )),
        ],
      ),
    ));
  }
}
