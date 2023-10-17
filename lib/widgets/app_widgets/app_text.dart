import 'package:flutter/material.dart';

import '../../../app/res/res.dart';
import '../../../data/providers/storage/local_provider.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color? color;
  final bool centerText;
  final int maxLines;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool lineThrough;
  final bool underLine;

  const AppText(
    this.text, {
    this.color,
    this.centerText = false,
    this.maxLines = 1,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w700,
    this.lineThrough = false,
    this.underLine = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String fontFamily = LocalProvider().isAr() ? Res.appArFontName : Res.appEnFontName;

    return Text(
      text,
      maxLines: maxLines,
      textAlign: centerText ? TextAlign.center : TextAlign.start,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        decoration: lineThrough
            ? TextDecoration.lineThrough
            : underLine
                ? TextDecoration.underline
                : TextDecoration.none,
        decorationThickness: 2,
        decorationColor: color ?? Theme.of(context).textTheme.titleMedium!.color,
      ),
    );
  }
}
