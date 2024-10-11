import 'package:flutter/material.dart';
import 'package:zigzek_user/color_palettes.dart';
import 'package:zigzek_user/customs/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(8.0),
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
                padding: const EdgeInsets.all(8.0).copyWith(top: 20.0),
                child: CustomTextField(
                  controller: mobileController,
                  enableField: true,
                  required: true,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
