import 'dart:developer';

import 'package:country_code_picker_plus/country_code_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:zigzek_user/color_palettes.dart';
import 'package:zigzek_user/customs/custom_button.dart';
import 'package:zigzek_user/customs/custom_textfield.dart';
import 'package:zigzek_user/screens/screen_otp.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController mobileController = TextEditingController();
  String prefixCode = '';
  bool isWAUpdates = false;

  @override
  void initState() {
    super.initState();
    prefixCode = '+91';
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: screenHeight * 0.86,
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
                          padding: const EdgeInsets.all(8.0).copyWith(top: 30.0, bottom: 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.fromLTRB(8.0, 13.7, 2.0, 13.7),
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
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OTPScreen()));
                            } else {
                              log('Invalid credentials.');
                            }
                          },
                          fgColor: ColorPalettes.labelBgColor,
                          bgColor: ColorPalettes.primaryTextColor,
                          btnWidth: MediaQuery.of(context).size.width * 0.77,
                          btnHeight: MediaQuery.of(context).size.height * 0.05,
                          buttonTitle: 'Get Code',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Switch(
                                value: isWAUpdates,
                                onChanged: (value) {
                                  setState(() {
                                    isWAUpdates = value;
                                  });
                                },
                                trackOutlineWidth: WidgetStateProperty.all(double.nan),
                                activeColor: ColorPalettes.primaryTextColor,
                                activeTrackColor: ColorPalettes.greenColor,
                                inactiveThumbColor: ColorPalettes.secondaryTextColor,
                                inactiveTrackColor: ColorPalettes.disabledLabelBgColor,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 6.0, right: 5.0),
                                child: Text(
                                  'Get updates on whatsapp',
                                  style: TextStyle(fontSize: 10, color: ColorPalettes.secondaryTextColor),
                                ),
                              ),
                              Flexible(
                                child: Image.asset(
                                  'assets/images/img_whatsapp.png',
                                  height: 14,
                                  width: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                    child: Column(
                      children: [
                        const Text(
                          'By proceeding, I agree to',
                          style: TextStyle(fontSize: 10, color: ColorPalettes.secondaryTextColor),
                        ),
                        InkWell(
                          onTap: () {},
                          borderRadius: const BorderRadius.all(Radius.circular(24)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                            child: Text(
                              'Terms and Conditions & Privacy policy',
                              style: TextStyle(
                                fontSize: 10,
                                color: ColorPalettes.blueColor,
                                decoration: TextDecoration.underline,
                                decorationColor: ColorPalettes.blueColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
