import 'package:flutter/material.dart';
import 'package:zigzek_user/constants/color_palettes.dart';

class CustomRadio<T> extends StatelessWidget {
  const CustomRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.activeColor = ColorPalettes.primaryTextColor,
  });

  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return RadioTheme(
      data: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>((state) {
          if (state.contains(WidgetState.selected)) {
            return Theme.of(context).colorScheme.primary;
          }
          return ColorPalettes.secondaryTextColor;
        }),
      ),
      child: Radio<T>(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        activeColor: activeColor,
      ),
    );
  }
}
