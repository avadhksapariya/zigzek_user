import 'dart:developer';

import 'package:country_code_picker_plus/country_code_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:zigzek_user/color_palettes.dart';
import 'package:zigzek_user/customs/custom_button.dart';
import 'package:zigzek_user/customs/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController mobileController = TextEditingController();
  String prefixCode = '';

  @override
  void initState() {
    super.initState();
    prefixCode = '+91';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Image(
                    image: AssetImage('assets/images/img_userphone1.png'),
                    height: 275,
                    width: 250,
                  ),
                  const Text(
                    'Enter your mobile number',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      'We will send you a confirmation code',
                      style: TextStyle(fontSize: 12, color: ColorPalettes.secondaryTextColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0).copyWith(top: 30.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorPalettes.borderColor,
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(24)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0, top: 2.5, bottom: 2.5),
                              child: CountryCodePicker(
                                mode: CountryCodePickerMode.dialog,
                                boxDecoration: const BoxDecoration(
                                  color: ColorPalettes.appBlackColor,
                                ),
                                onChanged: (country) {
                                  log('Country code selected: ${country.code}');
                                  prefixCode = country.dialCode;
                                },
                                flagWidth: 24.0,
                                initialSelection: 'IN',
                                favorite: const ['IN'],
                                showFlag: true,
                                hideMainText: true,
                                showDropDownButton: true,
                                icon: const Icon(Icons.keyboard_arrow_down, color: ColorPalettes.borderColor),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: CustomTextField(
                              controller: mobileController,
                              prefix: Padding(
                                padding: const EdgeInsets.only(right: 2.0),
                                child: Text(
                                  prefixCode,
                                  style: const TextStyle(color: ColorPalettes.borderColor),
                                ),
                              ),
                              inputType: 'phone',
                              enableField: true,
                              required: true,
                              isTypeNumber: true,
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomButton(
                    onPressed: () {
                      formKey.currentState!.save();
                      if (formKey.currentState!.validate()) {
                        log('Go ahead, valid credentials.');
                      } else {
                        log('Invalid credentials.');
                      }
                    },
                    fgColor: ColorPalettes.labelBackgroundColor,
                    bgColor: ColorPalettes.primaryTextColor,
                    btnWidth: MediaQuery.of(context).size.width * 0.77,
                    btnHeight: MediaQuery.of(context).size.height * 0.05,
                    buttonTitle: 'Get Code',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
