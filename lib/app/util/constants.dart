import 'package:flutter/material.dart';

class Constants {
  static String mainAppLanguage = 'ar';

  // static String mainAppLanguage = Get.locale?.languageCode ?? 'en';
  static String defaultUserType = 'client';
  static String defaultApiTokenType = 'Bearer';
}

double kRadius = 8;
double kBorderWidth = 0.5;
double kSelectedBorderWidth = 1;

final List<BoxShadow> shadows = [
  const BoxShadow(
    color: Color(0x28000000),
    offset: Offset(0, 5),
    blurRadius: 30,
  ),
];
