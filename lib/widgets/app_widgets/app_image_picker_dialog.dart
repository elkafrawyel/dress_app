import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../app/util/util.dart';
import '../../app/util/information_viewer.dart';
import 'app_text.dart';

showAppImageDialog({
  required BuildContext context,
  required Function(File image) onFilePicked,
}) {
  showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) => _ImagePickerDialog(
      onFilePicked: onFilePicked,
    ),
  );
}

class _ImagePickerDialog extends StatelessWidget {
  final Function(File image) onFilePicked;

  const _ImagePickerDialog({
    Key? key,
    required this.onFilePicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? textColor = Theme.of(context).textTheme.titleMedium?.color;
    return CupertinoTheme(
      data: CupertinoThemeData(
        // primaryColor: Theme.of(context).scaffoldBackgroundColor,
        brightness: Get.isDarkMode ? Brightness.dark : Brightness.light,
        // textTheme: CupertinoTextThemeData(primaryColor: Theme.of(context).primaryColor),
        // scaffoldBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
        // primaryContrastingColor: Theme.of(context).primaryColor,
      ),
      child: CupertinoActionSheet(
        cancelButton: CupertinoButton(
          color: Theme.of(context).scaffoldBackgroundColor,
          onPressed: () => Navigator.pop(context),
          child: AppText(
            'close'.tr,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.red,
          ),
        ),
        actions: <Widget>[
          CupertinoButton(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Row(
              children: <Widget>[
                Icon(
                  CupertinoIcons.photo_camera_solid,
                  color: textColor,
                ),
                const SizedBox(width: 20),
                AppText(
                  'camera'.tr,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                ),
              ],
            ),
            onPressed: () async {
              Navigator.pop(context);
              File? imageFile = await _pickImage(gallery: false);
              if (imageFile != null) {
                onFilePicked(imageFile);
              }
            },
          ),
          CupertinoButton(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.insert_photo,
                  color: textColor,
                ),
                const SizedBox(width: 20),
                AppText(
                  'gallery'.tr,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                ),
              ],
            ),
            onPressed: () async {
              try {
                Navigator.pop(context);
                File? imageFile = await _pickImage();
                if (imageFile != null) {
                  onFilePicked(imageFile);
                }
              } catch (e) {
                Utils.logMessage(e.toString());
              }
            },
          ),
        ],
      ),
    );
  }

  Future<File?> _pickImage({bool gallery = true}) async {
    XFile? media;
    if (gallery) {
      media = await ImagePicker().pickImage(source: ImageSource.gallery);
    } else {
      try {
        media = await ImagePicker().pickImage(source: ImageSource.camera);
      } catch (e) {
        printError(info: e.toString());
        InformationViewer.showErrorToast(msg: 'Camera not available');
      }
    }

    if (media != null) {
      return File(media.path);
    } else {
      return null;
    }
  }
}
