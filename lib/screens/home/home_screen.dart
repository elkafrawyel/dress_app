import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dress_app/screens/add_dress/add_dress_screen.dart';
import 'package:dress_app/screens/details_screen/details_screen.dart';
import 'package:dress_app/widgets/app_cached_image.dart';
import 'package:dress_app/widgets/app_widgets/app_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../widgets/photos_gallery.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kIsWeb
          ? null
          : AppBar(
              title: const AppText('بسمة علوان'),
              actions: [
                if (!kIsWeb)
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AddDressScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.add),
                  )
              ],
            ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('products').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<QueryDocumentSnapshot<Map<String, dynamic>>> snapshotList = snapshot.data!.docs;
            snapshotList.addAll(snapshot.data!.docs);
            snapshotList.addAll(snapshot.data!.docs);
            return snapshotList.isEmpty
                ? const SizedBox()
                : GridView.custom(
                    gridDelegate: SliverQuiltedGridDelegate(
                      crossAxisCount: 4,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      repeatPattern: QuiltedGridRepeatPattern.inverted,
                      pattern: [
                        const QuiltedGridTile(3, 3),
                        const QuiltedGridTile(1, 1),
                        const QuiltedGridTile(1, 1),
                        const QuiltedGridTile(1, 1),
                      ],
                    ),
                    childrenDelegate: SliverChildBuilderDelegate(
                      (context, index) => GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => DressDetailsScreen(
                          //       dress: snapshotList[index],
                          //     ),
                          //   ),
                          // );

                          List<dynamic> list = snapshotList[index].get('images').map((e) => e.toString()).toList();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PhotosGallery(
                                photos: list.map((e) => e.toString()).toList(),
                              ),
                            ),
                          );
                        },
                        child: AppCachedImage(
                          imageUrl: snapshotList[index].get('images')[0],
                          height: MediaQuery.of(context).size.height * (index % 5 == 0 ? 0.7 : 0.25),
                          width: MediaQuery.of(context).size.width * .5,
                          radius: 4,
                        ),
                      ),
                      childCount: snapshotList.length,
                    ),
                  );
          }
          if (snapshot.hasError) {
            return const Text('Error');
          } else {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
        },
      ),
    );
  }
}
