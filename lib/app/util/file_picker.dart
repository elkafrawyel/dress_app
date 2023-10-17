import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

import 'util.dart';

class AppPicker {
  static final ImagePicker _imagePicker = ImagePicker();

  static Future<List<File>> pickMultiImages() async {
    try {
      final List<XFile> images = await _imagePicker.pickMultiImage();

      if (images.isNotEmpty) {
        List<XFile?> files = [];

        for (XFile image in images) {
          File imageFile = File(image.path);

          files.add(
            await FlutterImageCompress.compressAndGetFile(
              image.path,
              "${imageFile.parent.path}/new_${image.name}",
              minHeight: 1200,
              minWidth: 1200,
              quality: 96,
            ),
          );
        }
        return files.nonNulls.map((e) => File(e.path)).toList();
      } else {
        return [];
      }
    } catch (e) {
      Utils.logMessage(e.toString());
      return [];
    }
  }
}
