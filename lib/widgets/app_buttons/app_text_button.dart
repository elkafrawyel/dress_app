import 'package:flutter/material.dart';

import '../../app/util/constants.dart';
import '../app_widgets/app_text.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? backgroundColor;
  final bool? centerText;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final VoidCallback onPressed;

  const AppTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.centerText,
    this.fontSize,
    this.fontFamily,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          // padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          foregroundColor: textColor ?? Colors.white, //text color
          side: BorderSide(color: textColor ?? Colors.white, width: 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kRadius))),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: AppText(
          text,
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
