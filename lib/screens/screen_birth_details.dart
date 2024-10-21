import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zigzek_user/constants/color_palettes.dart';
import 'package:zigzek_user/constants/project_strings.dart';
import 'package:zigzek_user/customs/custom_button.dart';
import 'package:zigzek_user/utils/enums.dart';
import 'package:zigzek_user/widgets/widget_steps_indicator.dart';

class BirthDetailsScreen extends StatefulWidget {
  const BirthDetailsScreen({super.key});

  @override
  State<BirthDetailsScreen> createState() => _BirthDetailsScreenState();
}

class _BirthDetailsScreenState extends State<BirthDetailsScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  Gender gender = Gender.none;
  bool isGenderError = false;

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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.82,
                      width: screenWidth * 0.9,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Step Indicator
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 32.0),
                            child: StepsIndicatorWidget(
                              stepNumOne: Text(
                                ProjectStrings.psInfoStep,
                                style:
                                    Theme.of(context).textTheme.bodySmall!.copyWith(color: ColorPalettes.labelBgColor),
                              ),
                              stepOneTitle: Text(
                                ProjectStrings.psInfoTitle,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              stepOneBgColor: ColorPalettes.primaryTextColor,
                              stepNumTwo: Text(
                                ProjectStrings.birthInfoStep,
                                style:
                                    Theme.of(context).textTheme.bodySmall!.copyWith(color: ColorPalettes.labelBgColor),
                              ),
                              stepTwoTitle: Text(
                                ProjectStrings.birthInfoTitle,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              stepTwoBgColor: ColorPalettes.primaryTextColor,
                              stepNumThree: Text(
                                ProjectStrings.languagesStep,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              stepThreeTitle: Text(
                                ProjectStrings.languagesTitle,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: ColorPalettes.secondaryTextColor),
                              ),
                              stepThreeBgColor: ColorPalettes.labelBgColor,
                            ),
                          ),
                          // Birth Details
                          Text(
                            ProjectStrings.birthInfoTitle,
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 24),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 32.0),
                            child: Text(
                              ProjectStrings.btDetailsGreeting2,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: ColorPalettes.secondaryTextColor),
                            ),
                          ),
                          // Birth date
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Text(
                                ProjectStrings.btBirthDateLabel,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Continue
                    SizedBox(
                      height: screenHeight * 0.05,
                      child: CustomButton(
                        onPressed: () {
                          formKey.currentState!.save();
                          if (formKey.currentState!.validate() && gender != Gender.none) {
                            log('Go ahead, complete personal info.');
                            setState(() {
                              isGenderError = false;
                            });
                          } else {
                            setState(() {
                              isGenderError = true;
                            });
                            log('Incomplete personal info.');
                          }
                        },
                        fgColor: ColorPalettes.labelBgColor,
                        bgColor: ColorPalettes.primaryTextColor,
                        btnWidth: MediaQuery.of(context).size.width * 0.85,
                        btnHeight: MediaQuery.of(context).size.height * 0.05,
                        buttonTitle: 'Continue',
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
