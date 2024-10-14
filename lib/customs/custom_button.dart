import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.buttonTitle,
    this.fgColor,
    this.bgColor,
    this.btnWidth,
    this.btnHeight,
  });

  final Function() onPressed;
  final String buttonTitle;
  final Color? fgColor;
  final Color? bgColor;
  final double? btnWidth;
  final double? btnHeight;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        foregroundColor: fgColor,
        backgroundColor: bgColor,
        minimumSize: Size(btnWidth!, btnHeight!),
      ),
      child: Text(
        buttonTitle,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
