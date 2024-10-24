import 'dart:developer';

import 'package:country_code_picker_plus/country_code_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zigzek_user/constants/color_palettes.dart';
import 'package:zigzek_user/constants/project_strings.dart';
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
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // Image
                          const Image(
                            image: AssetImage('assets/images/img_userphone1.png'),
                            height: 275,
                            width: 250,
                          ),
                          // Title
                          Text(
                            ProjectStrings.lsTitle,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          // SubTitle
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              ProjectStrings.lsSubTitle,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: ColorPalettes.secondaryTextColor),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0).copyWith(top: 30.0, bottom: 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Country Code Dropdown
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
                                          color: ColorPalettes.backgroundColor,
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
                                // Mobile TextField
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: CustomTextField(
                                      controller: mobileController,
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.fromLTRB(8.0, 13.7, 2.0, 13.7),
                                        child: Text(
                                          prefixCode,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(color: ColorPalettes.secondaryTextColor),
                                        ),
                                      ),
                                      inputType: 'phone',
                                      keyBoardInput: TextInputType.phone,
                                      textInputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                      enableField: true,
                                      required: true,
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Get Code Button
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
                            btnStyle:
                                Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorPalettes.labelBgColor),
                            btnWidth: MediaQuery.of(context).size.width * 0.77,
                            btnHeight: MediaQuery.of(context).size.height * 0.05,
                            buttonTitle: ProjectStrings.lsCodeButton,
                          ),
                          // Whatsapp Update Switch
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
                                Padding(
                                  padding: const EdgeInsets.only(left: 6.0, right: 5.0),
                                  child: Text(
                                    ProjectStrings.lsWhatsappUpdate,
                                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                        color: isWAUpdates
                                            ? ColorPalettes.primaryTextColor
                                            : ColorPalettes.secondaryTextColor),
                                  ),
                                ),
                                Flexible(
                                  child: Image.asset(
                                    'assets/images/img_whatsapp.png',
                                    height: 16,
                                    width: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Terms and Conditions
                  SizedBox(
                    height: screenHeight * 0.05,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            ProjectStrings.lsTermsText1,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: ColorPalettes.secondaryTextColor),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () {},
                                borderRadius: const BorderRadius.all(Radius.circular(24)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                                  child: Text(
                                    ProjectStrings.lsTermsText2,
                                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                          color: ColorPalettes.blueColor,
                                          decoration: TextDecoration.underline,
                                          decorationColor: ColorPalettes.blueColor,
                                        ),
                                  ),
                                ),
                              ),
                              Text(
                                '&',
                                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: ColorPalettes.blueColor,
                                      decoration: TextDecoration.underline,
                                      decorationColor: ColorPalettes.blueColor,
                                    ),
                              ),
                              InkWell(
                                onTap: () {},
                                borderRadius: const BorderRadius.all(Radius.circular(24)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                                  child: Text(
                                    ProjectStrings.lsTermsText3,
                                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                          color: ColorPalettes.blueColor,
                                          decoration: TextDecoration.underline,
                                          decorationColor: ColorPalettes.blueColor,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
