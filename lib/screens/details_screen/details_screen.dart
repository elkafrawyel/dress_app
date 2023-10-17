import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dress_app/app/extensions/space.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_widgets/app_text.dart';
import 'components/image_sliders.dart';

class DressDetailsScreen extends StatefulWidget {
  const DressDetailsScreen({super.key, required this.dress});

  final QueryDocumentSnapshot<Map<String, dynamic>> dress;

  @override
  State<DressDetailsScreen> createState() => _DressDetailsScreenState();
}

class _DressDetailsScreenState extends State<DressDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageSliders(
            sliders: (widget.dress.get('images') as List<dynamic>).map((e) => e.toString()).toList(),
          ),
          20.ph,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppText(
              widget.dress.get('name'),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          10.ph,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppText(
              "${widget.dress.get('price')} جنية",
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
