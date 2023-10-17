import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class Utils {
  static String getImagePath(String name, {String format = 'png'}) {
    return 'assets/images/$name.$format';
  }

  static void logMessage(String message, {bool isError = false}) {
    if (kDebugMode) {
      Get.log(message, isError: isError);
    }
  }

  static hideGetXDialog() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }


}
