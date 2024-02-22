import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/features/authentication/authentication_repository/authentication_repository.dart';
import 'package:shop/features/authentication/controllers/signup_form_controller.dart';
import 'package:shop/features/authentication/model_provider/user_model.dart';

class SignupForm extends StatelessWidget {
  SignupForm({super.key});

  final signControl = Get.put(SignupController());
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFormField(
                  controller: signControl.namecontroller,
                  onFieldSubmitted: (_) => FocusScope.of(context)
                      .requestFocus(signControl.phonefocusnode),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Name',
                    hintText: 'Enter your Name',
                    prefixIcon: const Icon(Icons.person),
                  ),
                  keyboardType: TextInputType.name,
                ),
                const Padding(padding: EdgeInsets.only(top: 30)),
                TextFormField(
                  focusNode: signControl.phonefocusnode,
                  controller: signControl.phonenocontroller,
                  onFieldSubmitted: (_) => FocusScope.of(context)
                      .requestFocus(signControl.emailfocusnode),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Phone no.',
                    hintText: 'Enter your Phone no.',
                    prefixIcon: const Icon(Icons.person),
                  ),
                  keyboardType: TextInputType.name,
                ),
                const Padding(padding: EdgeInsets.only(top: 30)),
                TextFormField(
                  focusNode: signControl.emailfocusnode,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: signControl.emailcontroller,
                  onFieldSubmitted: (_) => FocusScope.of(context)
                      .requestFocus(signControl.passfocusnode),
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
                ),
                const Padding(padding: EdgeInsets.only(top: 30)),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: signControl.passwordcontroller,
                  focusNode: signControl.passfocusnode,
                  obscureText: signControl.obscureText.value,
                  onFieldSubmitted: (value) => FocusScope.of(context)
                      .requestFocus(signControl.confirmfocusnode),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(signControl.obscureText.value
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: signControl.showtext,
                    ),
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
                const Padding(padding: EdgeInsets.only(top: 30)),
                TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: signControl.confirmpasswordcontroller,
                    obscureText: signControl.obscureText.value,
                    focusNode: signControl.confirmfocusnode,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      hintText: 'Re-Enter your password',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(signControl.obscureText.value
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: signControl.showtext,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value != signControl.passwordcontroller.text) {
                        return 'Password does not match';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      // do something with the password va
                    }),
                const Padding(padding: EdgeInsets.only(top: 30)),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            final user = UserModel(
                                name: signControl.namecontroller.text.trim(),
                                email: signControl.emailcontroller.text.trim(),
                                password:
                                    signControl.passwordcontroller.text.trim(),
                                phone:
                                    signControl.phonenocontroller.text.trim());
                            AuthenticationRepo.instance.createUser(user);
                            signControl.registeruser(
                              signControl.emailcontroller.text.trim(),
                              signControl.passwordcontroller.text.trim(),
                            );
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Sign up'.toUpperCase(),
                            style: const TextStyle(fontSize: 15),
                          ),
                        ))),
              ],
            ),
          )),
    );
  }
}
