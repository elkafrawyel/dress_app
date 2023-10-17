import 'package:flutter/material.dart';

import '../../app/util/constants.dart';
import '../app_widgets/app_text.dart';

class AppElevatedButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? backgroundColor;
  final bool? centerText;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final VoidCallback? onPressed;
  final EdgeInsets? padding;

  const AppElevatedButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.centerText,
    this.fontSize,
    this.fontFamily,
    this.fontWeight,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor ?? Colors.black,
        ),
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        //background color
        foregroundColor: textColor ?? Theme.of(context).textTheme.labelLarge?.color,
        elevation: 1.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kRadius)),
        padding: padding ?? const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
      ),
      // text color
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: AppText(
          text,
          color: textColor ?? Theme.of(context).textTheme.labelLarge?.color,
          fontSize: fontSize ?? 16,
          fontWeight: fontWeight ?? FontWeight.normal,
        ),
      ),
    );
  }
}
