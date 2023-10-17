import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../widgets/app_cached_image.dart';
import '../../../widgets/photos_gallery.dart';

class ImageSliders extends StatefulWidget {
  final List<String>? sliders;
  final double? height;
  final bool? autoPlay;

  const ImageSliders({
    this.sliders,
    Key? key,
    this.height,
    this.autoPlay,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ImageSlidersState();
  }
}

class ImageSlidersState extends State<ImageSliders> {
  int _current = 0;
  List<String> _images = [];
  final CarouselController _buttonCarouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    _images = widget.sliders ?? [];
  }

  @override
  Widget build(BuildContext context) {
    if (widget.sliders?.isEmpty ?? true) {
      return Image.asset(
        'assets/images/icon.png',
        height: widget.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      );
    }
    return Stack(
      children: [
        CarouselSlider.builder(
          carouselController: _buttonCarouselController,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) => InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PhotosGallery(
                    photos: (widget.sliders ?? []).map((e) => e).toList(),
                    imageIndex: itemIndex,
                    onIndexChanged: updateCurrentList,
                  ),
                ),
              );
            },
            child: AppCachedImage(
              imageUrl: _images[itemIndex],
              width: MediaQuery.of(context).size.width,
              radius: 0,
              height: widget.height ?? MediaQuery.of(context).size.height / 2.5,
            ),
          ),
          options: CarouselOptions(
              autoPlay: widget.autoPlay ?? false,
              viewportFraction: 1,
              height: widget.height ?? MediaQuery.of(context).size.height / 2.5,
              initialPage: _current,
              scrollPhysics: _images.length == 1 ? const NeverScrollableScrollPhysics() : null,
              autoPlayAnimationDuration: const Duration(seconds: 2),
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
          itemCount: _images.length,
        ),
        PositionedDirectional(
          bottom: 10,
          start: 10,
          end: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _images.map((product) {
              int index = _images.indexOf(product);
              return _current == index
                  ? Container(
                      width: 7.0,
                      height: 7.0,
                      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).primaryColor),
                    )
                  : Container(
                      width: 7.0,
                      height: 7.0,
                      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xffF0F0F0)),
                    );
            }).toList(),
          ),
        ),
      ],
    );
  }

  void updateCurrentList(int index, {bool animate = true}) {
    _current = index;
    setState(() {});
    if (animate) {
      _buttonCarouselController.animateToPage(index);
    } else {
      // to stop the view pager on change callback
      _buttonCarouselController.jumpToPage(index);
    }
  }
}
