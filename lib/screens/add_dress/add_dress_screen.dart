import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dress_app/app/extensions/space.dart';
import 'package:dress_app/app/util/constants.dart';
import 'package:dress_app/app/util/file_picker.dart';
import 'package:dress_app/app/util/information_viewer.dart';
import 'package:dress_app/widgets/app_buttons/app_outlined_button.dart';
import 'package:dress_app/widgets/app_buttons/app_progress_button.dart';
import 'package:dress_app/widgets/app_widgets/app_text.dart';
import 'package:dress_app/widgets/app_widgets/app_text_field/app_text_field.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddDressScreen extends StatefulWidget {
  const AddDressScreen({super.key});

  @override
  State<AddDressScreen> createState() => _AddDressScreenState();
}

class _AddDressScreenState extends State<AddDressScreen> {
  // late TextEditingController nameTextEditingController;
  // late TextEditingController priceTextEditingController;
  // late TextEditingController descTextEditingController;

  List<File> images = [];

  @override
  void initState() {
    super.initState();
    // nameTextEditingController = TextEditingController();
    // priceTextEditingController = TextEditingController();
    // descTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    // nameTextEditingController.dispose();
    // priceTextEditingController.dispose();
    // descTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText('إضافة فستان جديد'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              20.ph,
              // AppTextFormField(
              //   controller: nameTextEditingController,
              //   hintText: 'الآسم',
              //   keyboardType: TextInputType.text,
              //   required: false,
              // ),
              // AppTextFormField(
              //   controller: priceTextEditingController,
              //   hintText: 'السعر',
              //   keyboardType: TextInputType.number,
              //   required: false,
              // ),
              // AppTextFormField(
              //   controller: descTextEditingController,
              //   hintText: 'الوصف',
              //   keyboardType: TextInputType.text,
              //   maxLines: 3,
              //   required: false,
              // ),
              10.ph,
              Center(
                child: AppOutlinedButton(
                  text: 'إضافة صور الفستان',
                  fontSize: 18,
                  textColor: Theme.of(context).primaryColor,
                  onPressed: () async {
                    images.addAll(await AppPicker.pickMultiImages());
                    setState(() {});
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Wrap(
                  runSpacing: 10,
                  spacing: 10,
                  children: images
                      .map(
                        (e) => Stack(
                          clipBehavior: Clip.none,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(kRadius),
                              child: Image.file(
                                e,
                                fit: BoxFit.cover,
                                width: 120,
                                height: 120,
                              ),
                            ),
                            PositionedDirectional(
                              top: 0,
                              end: 0,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    images.remove(e);
                                  });
                                },
                                child: const Icon(
                                  Icons.clear,
                                  color: Colors.red,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
              100.ph,
              AppProgressButton(
                onPressed: (animationController) async {
                  animationController.forward();
                  await addProduct();
                  animationController.reverse();
                },
                text: 'تأكيد',
                width: MediaQuery.of(context).size.width * .8,
              ),
              30.ph,
            ],
          ),
        ),
      ),
    );
  }

  Future<List<String>> uploadImagesToFirebaseStorage(
    List<File> imageFile,
    String productId,
  ) async {
    final Reference storageReference = FirebaseStorage.instance.ref().child('product_images');
    List<String> imagesUrl = [];

    for (int i = 0; i < images.length; i++) {
      final File image = images[i];
      String imageName = 'img_${i + 1}_$productId.jpg';
      final UploadTask uploadTask = storageReference.child(imageName).putFile(image);

      await uploadTask.whenComplete(() => print('Image $i uploaded'));

      final imageUrl = await storageReference.child(imageName).getDownloadURL();
      if (kDebugMode) {
        print('Image $i URL: $imageUrl');
      }
      imagesUrl.add(imageUrl);
    }

    return imagesUrl;
  }

  Future<void> addProduct() async {
    if (images.isEmpty) {
      return;
    }

    // if (nameTextEditingController.text.isEmpty || priceTextEditingController.text.isEmpty || images.isEmpty) {
    //   return;
    // }

    String productId = DateTime.now().millisecondsSinceEpoch.toString();
    List<String> imagesUrl = await uploadImagesToFirebaseStorage(images, productId);
    CollectionReference products = FirebaseFirestore.instance.collection('products');

    await products.add({
      'id': productId,
      // 'name': nameTextEditingController.text,
      // 'description': descTextEditingController.text,
      // 'price': priceTextEditingController.text,
      'images': imagesUrl,
    });

    InformationViewer.showSuccessToast(msg: 'تمت إضافة الفستان بنجاح');
    if (mounted) {
      Navigator.of(context).pop();
    }
  }
}
