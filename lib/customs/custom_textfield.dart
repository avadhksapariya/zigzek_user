import 'package:flutter/material.dart';
import 'package:zigzek_user/color_palettes.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.label,
    this.validationLabel,
    this.validationMode,
    this.required,
    this.enableField,
    this.inputType,
    this.isTypeNumber,
    this.maxLines,
    this.maxLength,
    this.showCounterText,
    this.isObscureText = false,
    this.suffixIcon,
    this.tap,
    this.changed,
    this.submit,
  });

  final TextEditingController controller;
  final String? label;
  final String? validationLabel;
  final AutovalidateMode? validationMode;
  final bool? required;
  final bool? enableField;
  final String? inputType;
  final bool? isTypeNumber;
  final int? maxLines;
  final int? maxLength;
  final bool? showCounterText;
  final bool isObscureText;
  final Widget? suffixIcon;
  final void Function()? tap;
  final void Function(String?)? changed;
  final void Function(String?)? submit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        onTap: tap,
        onChanged: changed,
        onFieldSubmitted: submit,
        enabled: enableField,
        maxLines: maxLines,
        maxLength: maxLength,
        obscureText: isObscureText,
        style: const TextStyle(color: ColorPalettes.secondaryTextColor),
        cursorColor: ColorPalettes.secondaryTextColor,
        keyboardType: isTypeNumber != null ? TextInputType.number : null,
        validator: (value) {
          return null;
        },
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(24),
            ),
            gapPadding: 4.0,
            borderSide: BorderSide(
              width: 1,
              color: ColorPalettes.borderColor,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(24),
            ),
            gapPadding: 4.0,
            borderSide: BorderSide(
              width: 1,
              color: ColorPalettes.redPrimaryColor,
            ),
          ),
          labelText: label,
          labelStyle: const TextStyle(color: ColorPalettes.secondaryTextColor),
          alignLabelWithHint: true,
        ),
      ),
    );
  }

  validation(label, inputType, validationLabel, value) {
    if (inputType != null) {
      switch (inputType) {
        case 'phone':
          var phoneLength = value.toString().length;
          if (phoneLength <= 10) {
            return 'please enter a valid phone number';
          }
      }
    }
  }
}
