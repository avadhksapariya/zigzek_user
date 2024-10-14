import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:zigzek_user/color_palettes.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Image(
                  image: AssetImage('assets/images/img_userphone1.png'),
                  height: 275,
                  width: 250,
                ),
                OtpTextField(
                  numberOfFields: 6,
                  showFieldAsBox: true,
                  borderRadius: BorderRadius.circular(6),
                  contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                  margin: const EdgeInsets.only(right: 12.8),
                  textStyle: const TextStyle(
                    color: ColorPalettes.primaryTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  borderWidth: 0.8,
                  filled: true,
                  fillColor: ColorPalettes.labelBgColor,
                  borderColor: ColorPalettes.secondaryTextColor,
                  focusedBorderColor: ColorPalettes.secondaryTextColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
