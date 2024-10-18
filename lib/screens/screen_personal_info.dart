import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zigzek_user/constants/color_palettes.dart';
import 'package:zigzek_user/constants/project_strings.dart';
import 'package:zigzek_user/customs/custom_button.dart';
import 'package:zigzek_user/customs/custom_radio.dart';
import 'package:zigzek_user/customs/custom_textfield.dart';
import 'package:zigzek_user/utils/enums.dart';
import 'package:zigzek_user/widgets/widget_steps_indicator.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
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
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              stepTwoTitle: Text(
                                ProjectStrings.birthInfoTitle,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: ColorPalettes.secondaryTextColor),
                              ),
                              stepTwoBgColor: ColorPalettes.labelBgColor,
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
                          // Welcome
                          Text(
                            ProjectStrings.psInfoGreeting1,
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 24),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 32.0),
                            child: Text(
                              ProjectStrings.psInfoGreeting2,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: ColorPalettes.secondaryTextColor),
                            ),
                          ),
                          // Full Name
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Text(
                                ProjectStrings.psNameLabel,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: CustomTextField(
                              controller: nameController,
                              label: ProjectStrings.psNameHint,
                              validationLabel: ProjectStrings.psNameLabel,
                              keyBoardInput: TextInputType.text,
                              enableField: true,
                              required: true,
                              maxLines: 1,
                            ),
                          ),
                          // Email Id
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Text(
                                ProjectStrings.psMailLabel,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: CustomTextField(
                              controller: emailController,
                              label: ProjectStrings.psMailHint,
                              validationLabel: ProjectStrings.psMailLabel,
                              keyBoardInput: TextInputType.text,
                              enableField: true,
                              required: true,
                              maxLines: 1,
                            ),
                          ),
                          // Gender Title
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                ProjectStrings.psGenderTitle,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                          // Gender Radio
                          Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomRadio(
                                  value: Gender.male,
                                  groupValue: gender,
                                  onChanged: (value) {
                                    setState(() {
                                      gender = value!;
                                      isGenderError = false;
                                    });
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 32.0),
                                  child: Text(
                                    ProjectStrings.psGenderMale,
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                        color: gender == Gender.male
                                            ? ColorPalettes.primaryTextColor
                                            : ColorPalettes.secondaryTextColor),
                                  ),
                                ),
                                CustomRadio(
                                  value: Gender.female,
                                  groupValue: gender,
                                  onChanged: (value) {
                                    setState(() {
                                      gender = value!;
                                      isGenderError = false;
                                    });
                                  },
                                ),
                                Text(
                                  ProjectStrings.psGenderFemale,
                                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: gender == Gender.female
                                          ? ColorPalettes.primaryTextColor
                                          : ColorPalettes.secondaryTextColor),
                                ),
                              ],
                            ),
                          ),
                          if (isGenderError)
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  ProjectStrings.psGenderError,
                                  style:
                                      Theme.of(context).textTheme.bodySmall!.copyWith(color: ColorPalettes.errorColor),
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
                          } else {
                            isGenderError = true;
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
