import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zigzek_user/constants/color_palettes.dart';
import 'package:zigzek_user/constants/project_strings.dart';
import 'package:zigzek_user/customs/custom_button.dart';
import 'package:zigzek_user/customs/custom_textfield.dart';
import 'package:zigzek_user/utils/enums.dart';
import 'package:zigzek_user/widgets/widget_steps_indicator.dart';

class BirthDetailsScreen extends StatefulWidget {
  const BirthDetailsScreen({super.key});

  @override
  State<BirthDetailsScreen> createState() => _BirthDetailsScreenState();
}

class _BirthDetailsScreenState extends State<BirthDetailsScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController btDateController = TextEditingController();
  final TextEditingController btTimeController = TextEditingController();
  DateTime? birthDate;
  TimeOfDay? birthTime;
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
                      height: screenHeight * 0.77,
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
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
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
                                    CustomTextField(
                                      controller: btDateController,
                                      hint: ProjectStrings.btBirthDateHint,
                                      maxLines: 1,
                                      tap: () async {
                                        birthDate = await showDatePicker(
                                          context: context,
                                          firstDate: DateTime(DateTime.now().year - 100),
                                          lastDate: DateTime.now(),
                                          initialDate: DateTime.now(),
                                        );

                                        if (birthDate != null) {
                                          String formattedDate = DateFormat('dd/MM/yyyy').format(birthDate!);
                                          btDateController.text = formattedDate;
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 17,
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // Birth time
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 4.0),
                                        child: Text(
                                          ProjectStrings.btBirthTimeLabel,
                                          style: Theme.of(context).textTheme.bodyLarge,
                                        ),
                                      ),
                                    ),
                                    CustomTextField(
                                      controller: btTimeController,
                                      hint: ProjectStrings.btBirthTimeHint,
                                      maxLines: 1,
                                      tap: () async {
                                        birthTime = await showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now(),
                                        );

                                        if (birthTime != null) {
                                          formatTime(birthTime);
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 16, bottom: 4.0),
                              child: Text(
                                ProjectStrings.btBirthPlaceLabel,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                          CustomTextField(
                            controller: btDateController,
                            hint: ProjectStrings.btBirthPlaceHint,
                            maxLines: 1,
                            tap: () {},
                          ),
                        ],
                      ),
                    ),
                    // Continue
                    SizedBox(
                      height: screenHeight * 0.05,
                      child: CustomButton(
                        onPressed: () {},
                        fgColor: ColorPalettes.labelBgColor,
                        bgColor: ColorPalettes.primaryTextColor,
                        btnStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorPalettes.labelBgColor),
                        btnWidth: MediaQuery.of(context).size.width * 0.85,
                        btnHeight: MediaQuery.of(context).size.height * 0.05,
                        buttonTitle: ProjectStrings.psSubmitBtnName,
                      ),
                    ),
                    // Skip
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: SizedBox(
                        height: screenHeight * 0.05,
                        child: CustomButton(
                          onPressed: () {},
                          btnStyle:
                              Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorPalettes.primaryTextColor),
                          btnWidth: MediaQuery.of(context).size.width * 0.85,
                          btnHeight: MediaQuery.of(context).size.height * 0.05,
                          buttonTitle: ProjectStrings.btSkipBtnName,
                        ),
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

  void formatTime(TimeOfDay? time) {
    String formattedTime = time!.format(context);
    btTimeController.text = formattedTime;
  }
}
