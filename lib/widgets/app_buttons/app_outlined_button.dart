import 'package:flutter/material.dart';

import '../../app/config/app_color.dart';
import '../../app/util/constants.dart';
import '../app_widgets/app_text.dart';

class AppOutlinedButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final bool? centerText;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final VoidCallback? onPressed;
  final EdgeInsets? padding;
  final double? elevation;
  final double? borderWidth;

  const AppOutlinedButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.textColor,
    this.centerText,
    this.fontSize,
    this.fontFamily,
    this.fontWeight,
    this.padding,
    this.elevation,
    this.borderWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: onPressed == null
          ? OutlinedButton.styleFrom(
              foregroundColor: hintColor,
              backgroundColor: hintColor,
              textStyle: TextStyle(
                fontFamily: fontFamily,
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: hintColor,
              ),
            )
          : OutlinedButton.styleFrom(
              textStyle: TextStyle(
                fontFamily: fontFamily,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
              foregroundColor: textColor ?? Theme.of(context).textTheme.titleMedium?.color,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: elevation ?? 1.0,
              side: BorderSide(
                color: textColor ?? Theme.of(context).textTheme.titleMedium?.color ?? Colors.white,
                width: borderWidth ?? 1.0,
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kRadius)),
            ),
      onPressed: onPressed,
      child: Padding(
        padding: padding ?? const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
        child: AppText(
          text,
          fontSize: fontSize ?? 14,
          fontWeight: fontWeight ?? FontWeight.bold,
        ),
      ),
    );
  }
}
