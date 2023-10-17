import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotosGallery extends StatefulWidget {
  final PageController pageController;
  final List<String?> photos;
  final int imageIndex;
  final void Function(int index)? onIndexChanged;

  PhotosGallery({
    Key? key,
    required this.photos,
    this.imageIndex = 0,
    this.onIndexChanged,
  })  : pageController = PageController(initialPage: imageIndex),
        super(key: key);

  @override
  _PhotosGalleryState createState() => _PhotosGalleryState();
}

class _PhotosGalleryState extends State<PhotosGallery> {
  int index = 0;

  @override
  void initState() {
    index = widget.imageIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          PhotoViewGallery.builder(
            pageController: widget.pageController,
            scrollDirection: Axis.horizontal,
            itemCount: widget.photos.length,
            scrollPhysics: const BouncingScrollPhysics(),
            onPageChanged: (index) {
              if (widget.onIndexChanged != null) {
                widget.onIndexChanged!(index);
              }
              setState(() => this.index = index);
            },
            loadingBuilder: (context, event) => const Center(
              child: CircularProgressIndicator(),
            ),
            builder: (context, index) {
              final String? imageUrl = widget.photos[index];
              return PhotoViewGalleryPageOptions(
                imageProvider: CachedNetworkImageProvider(imageUrl ?? ''),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.contained * 4,
              );
            },
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.black54,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'صورة  ${index + 1}/${widget.photos.length}',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
