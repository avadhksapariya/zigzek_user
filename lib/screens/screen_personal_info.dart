import 'package:flutter/material.dart';
import 'package:zigzek_user/constants/color_palettes.dart';
import 'package:zigzek_user/constants/project_strings.dart';
import 'package:zigzek_user/widgets/widget_steps_indicator.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Column(
                children: [
                  SizedBox(
                    width: screenWidth * 0.8,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 32.0),
                          child: StepsIndicatorWidget(
                            stepNumOne: Text(
                              ProjectStrings.psInfoStep,
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: ColorPalettes.labelBgColor),
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
                        Text(
                          ProjectStrings.psInfoGreeting1,
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 24),
                        ),
                        Text(
                          ProjectStrings.psInfoGreeting2,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(color: ColorPalettes.secondaryTextColor),
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
