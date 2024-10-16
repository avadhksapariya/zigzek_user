import 'package:flutter/material.dart';
import 'package:zigzek_user/constants/color_palettes.dart';
import 'package:zigzek_user/constants/project_strings.dart';
import 'package:zigzek_user/widgets/widget_dashed_line.dart';

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
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: ColorPalettes.labelBgColor,
                                    radius: 10,
                                    child: Text(
                                      ProjectStrings.psInfoStep,
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: ColorPalettes.primaryTextColor),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 4.0),
                                    child: Text(
                                      ProjectStrings.psInfoTitle,
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: ColorPalettes.secondaryTextColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              CustomPaint(
                                painter: DashedLinePainter(),
                                size: const Size(40, 20),
                              ),
                              const Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: ColorPalettes.labelBgColor,
                                    radius: 10,
                                    child: Text(
                                      ProjectStrings.birthInfoStep,
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: ColorPalettes.primaryTextColor),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 4.0),
                                    child: Text(
                                      ProjectStrings.birthInfoTitle,
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: ColorPalettes.secondaryTextColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              CustomPaint(
                                painter: DashedLinePainter(),
                                size: const Size(40, 20),
                              ),
                              const Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: ColorPalettes.labelBgColor,
                                    radius: 10,
                                    child: Text(
                                      ProjectStrings.languagesStep,
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: ColorPalettes.primaryTextColor),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 4.0),
                                    child: Text(
                                      ProjectStrings.languagesTitle,
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: ColorPalettes.secondaryTextColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
