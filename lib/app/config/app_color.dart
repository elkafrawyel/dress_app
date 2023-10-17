import 'package:flutter/material.dart';

const hintColor = Color(0xFF929292);
const errorColor = Color(0xFFE74343);
final whiteShadowColor = const Color(0xffFFFFFF).withOpacity(0.1);

class DarkThemeColor {
  const DarkThemeColor._();

  static const primaryColor = Color(0xFFF6C358);
  static const disabledColor = Colors.white60;
  static const scaffoldBackground = Color(0xFF03051C);
  static const dividerColor = Color(0xff4F4F4F);
  static const bottomBarColor = Color(0xFF1B1C1F);
}

class LightThemeColor {
  LightThemeColor._();

  static const primaryColor = Color(0xFFF6C358);
  static const disabledColor = Color(0xFF000000);
  static const dividerColor = Color(0xFF000000);
  static const scaffoldBackground = Color(0xffffffff);
  static const bottomBarColor = Color(0xFFFFFFFF);
}
