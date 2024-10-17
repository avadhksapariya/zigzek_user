import 'package:flutter/material.dart';
import 'package:zigzek_user/widgets/widget_dashed_line.dart';

class StepsIndicatorWidget extends StatelessWidget {
  const StepsIndicatorWidget({
    super.key,
    this.stepNumOne,
    this.stepNumTwo,
    this.stepNumThree,
    this.stepOneTitle,
    this.stepTwoTitle,
    this.stepThreeTitle,
    this.stepOneBgColor,
    this.stepTwoBgColor,
    this.stepThreeBgColor,
  });

  final Widget? stepNumOne;
  final Widget? stepNumTwo;
  final Widget? stepNumThree;
  final Widget? stepOneTitle;
  final Widget? stepTwoTitle;
  final Widget? stepThreeTitle;
  final Color? stepOneBgColor;
  final Color? stepTwoBgColor;
  final Color? stepThreeBgColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            CircleAvatar(
              backgroundColor: stepOneBgColor,
              radius: 10,
              child: stepNumOne!,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: stepOneTitle!,
            ),
          ],
        ),
        CustomPaint(
          painter: DashedLinePainter(),
          size: const Size(40, 20),
        ),
        Column(
          children: [
            CircleAvatar(
              backgroundColor: stepTwoBgColor,
              radius: 10,
              child: stepNumTwo!,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: stepTwoTitle!,
            ),
          ],
        ),
        CustomPaint(
          painter: DashedLinePainter(),
          size: const Size(40, 20),
        ),
        Column(
          children: [
            CircleAvatar(
              backgroundColor: stepThreeBgColor,
              radius: 10,
              child: stepNumThree!,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: stepThreeTitle!,
            ),
          ],
        ),
      ],
    );
  }
}
