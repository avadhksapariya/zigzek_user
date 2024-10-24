import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:zigzek_user/constants/color_palettes.dart';
import 'package:zigzek_user/constants/project_strings.dart';
import 'package:zigzek_user/customs/custom_button.dart';
import 'package:zigzek_user/screens/screen_personal_info.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String otpCode = '';
  int remainingTime = 60;
  Timer? countdownTimer;
  bool isOTPError = false;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  @override
  void dispose() {
    countdownTimer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
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
          padding: const EdgeInsets.only(bottom: 8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: screenHeight * 0.85,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Image
                        const Image(
                          image: AssetImage('assets/images/img_userphone1.png'),
                          height: 275,
                          width: 250,
                        ),
                        // OTP
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: OtpTextField(
                            mainAxisAlignment: MainAxisAlignment.center,
                            onCodeChanged: (value) {
                              isOTPError = false;
                            },
                            onSubmit: (value) {
                              otpCode = value;
                              log('Code: $otpCode');
                            },
                            numberOfFields: 6,
                            showFieldAsBox: true,
                            borderRadius: BorderRadius.circular(6),
                            contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                            margin: const EdgeInsets.only(right: 12.8),
                            cursorColor: ColorPalettes.secondaryTextColor,
                            keyboardType: TextInputType.number,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            textStyle: Theme.of(context).textTheme.titleSmall,
                            borderWidth: 0.8,
                            filled: true,
                            fillColor: ColorPalettes.labelBgColor,
                            borderColor: ColorPalettes.secondaryTextColor,
                            enabledBorderColor: ColorPalettes.secondaryTextColor,
                            focusedBorderColor: ColorPalettes.secondaryTextColor,
                          ),
                        ),
                        if (isOTPError)
                          Padding(
                            padding: const EdgeInsets.only(left: 27.0, top: 2.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                ProjectStrings.otpError,
                                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: ColorPalettes.errorColor),
                              ),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text.rich(
                            TextSpan(
                              text: ProjectStrings.otpResendCode1,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: ColorPalettes.secondaryTextColor),
                              children: [
                                TextSpan(
                                  text: ProjectStrings.otpResendCode2,
                                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                        color: ColorPalettes.primaryTextColor,
                                        decoration: TextDecoration.underline,
                                        decorationColor: ColorPalettes.primaryTextColor,
                                      ),
                                ),
                                TextSpan(
                                  text: '(${remainingTime.toString()}s)',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: ColorPalettes.secondaryTextColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                  child: CustomButton(
                    onPressed: () {
                      if (otpCode.isNotEmpty) {
                        log('Go ahead, valid otp.');
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PersonalInfoScreen()));
                      } else {
                        isOTPError = true;
                        log('Invalid otp.');
                      }
                    },
                    fgColor: ColorPalettes.labelBgColor,
                    bgColor: ColorPalettes.primaryTextColor,
                    btnStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorPalettes.labelBgColor),
                    btnWidth: MediaQuery.of(context).size.width * 0.85,
                    btnHeight: MediaQuery.of(context).size.height * 0.05,
                    buttonTitle: ProjectStrings.otpVerify,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void startCountdown() {
    countdownTimer?.cancel(); // Cancel any existing timer
    setState(() {
      remainingTime = 60; // Reset the time to 60 seconds
    });

    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        setState(() {
          remainingTime--;
        });
      } else {
        timer.cancel(); // Stop the timer when it reaches zero
      }
    });
  }
}
