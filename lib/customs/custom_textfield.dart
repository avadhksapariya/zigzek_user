import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zigzek_user/constants/color_palettes.dart';
import 'package:zigzek_user/constants/project_strings.dart';

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
    this.keyBoardInput,
    this.textInputFormatters,
    this.maxLines,
    this.maxLength,
    this.showCounterText,
    this.isObscureText = false,
    this.prefixIcon,
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
  final TextInputType? keyBoardInput;
  final List<TextInputFormatter>? textInputFormatters;
  final int? maxLines;
  final int? maxLength;
  final bool? showCounterText;
  final bool isObscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function()? tap;
  final void Function(String?)? changed;
  final void Function(String?)? submit;

  @override
  Widget build(BuildContext context) {
    InputBorder textFieldBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(24),
      ),
      borderSide: BorderSide(
        width: 1,
        color: ColorPalettes.borderColor,
      ),
    );

    return TextFormField(
      controller: controller,
      onTap: tap,
      onChanged: changed,
      onFieldSubmitted: submit,
      enabled: enableField,
      maxLines: maxLines,
      maxLength: maxLength,
      obscureText: isObscureText,
      style: Theme.of(context).textTheme.bodyLarge,
      cursorColor: ColorPalettes.secondaryTextColor,
      keyboardType: keyBoardInput,
      inputFormatters: textInputFormatters,
      validator: (required != null && required == true)
          ? (String? value) => validation(label, inputType, validationLabel, value)
          : null,
      autovalidateMode: validationMode,
      decoration: InputDecoration(
        border: textFieldBorder,
        enabledBorder: textFieldBorder,
        focusedBorder: textFieldBorder,
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
          gapPadding: 4.0,
          borderSide: BorderSide(
            width: 1,
            color: ColorPalettes.errorColor,
          ),
        ),
        errorStyle: const TextStyle(color: ColorPalettes.errorColor),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14.0),
        prefixIcon: prefixIcon,
        suffixIcon: (inputType == 'email' && emailValidation() == true)
            ? const Icon(
                Icons.check_circle,
                color: ColorPalettes.greenColor,
                size: 20.0,
              )
            : suffixIcon,
        labelText: label,
        labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorPalettes.secondaryTextColor),
        alignLabelWithHint: true,
      ),
    );
  }

  validation(label, inputType, validationLabel, value) {
    if (inputType != null) {
      switch (inputType) {
        case 'phone':
          var phoneLength = value.toString().length;
          if (phoneLength < 10) {
            return ProjectStrings.lsEmptyMobileError;
          }
          break;
        case 'email':
          if (value == null || value.isEmpty) {
            return ProjectStrings.psMailError;
          } else if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value) ==
              false) {
            return ProjectStrings.psInvalidMailError;
          }
          break;

        default:
      }
    } else {
      if (value == null || value.isEmpty) {
        return validationLabel != null ? '$validationLabel required' : 'This field is required';
      }
    }
  }

  bool emailValidation() {
    String mailID = controller.text;
    bool isValidEmail = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(mailID);
    return isValidEmail;
  }
}
