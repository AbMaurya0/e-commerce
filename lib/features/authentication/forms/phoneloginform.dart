import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:intl_phone_field_with_validator/intl_phone_field.dart';
import 'package:shop/features/authentication/controllers/phone_login_form_controller.dart';

// ignore: must_be_immutable
class Phoneform extends StatelessWidget {
  Phoneform({super.key});

  final phonecontrol = Get.put(PhoneLoginFormController());
  // ignore: non_constant_identifier_names
  String? PhoneNo;
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IntlPhoneField(
              autovalidateMode: AutovalidateMode.disabled,
              controller: phonecontrol.phonecontroller,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                    borderSide: BorderSide(),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              initialCountryCode: 'IN',
              onChanged: (phone) {
                print(phone.completeNumber);
                PhoneNo = phone.completeNumber;
              },
              validator: (value) {
                if (value == null) {
                  return 'Please enter your phone no';
                }
                if (!RegExp(r"^[789]\d{9}$").hasMatch(value as String)) {
                  return 'Please enter a valid phone no';
                }
                return null;
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    phonecontrol.Phonelogin(PhoneNo);
                  },
                  child: const Text('Send OTP')),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          PinCodeTextField(
            appContext: context,
            controller: controller,
            length: 6,
            obscureText: false,
            animationType: AnimationType.fade,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.circle,
              borderRadius: BorderRadius.circular(10),
              fieldHeight: 50,
              fieldWidth: 40,
              activeFillColor: Colors.white,
            ),
            onChanged: (value) {},
          ),
          const Padding(padding: EdgeInsets.only(top: 30)),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    phonecontrol.verifyOtp(controller.text.trim());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Submit'.toUpperCase(),
                      style: const TextStyle(fontSize: 15),
                    ),
                  ))),
        ],
      ),
    ));
  }
}
