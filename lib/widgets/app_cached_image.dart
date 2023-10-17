import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppCachedImage extends StatelessWidget {
  final String? imageUrl;
  final double? radius;
  final double width, height;
  final BoxFit? fit;
  final Color? borderColor;
  final double? borderWidth;
  final bool isCircular;

  const AppCachedImage({
    this.imageUrl,
    this.width = 100,
    this.height = 100,
    this.radius,
    this.fit,
    this.borderColor,
    this.borderWidth,
    this.isCircular = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: borderColor == null
            ? null
            : Border.all(
                color: borderColor ?? Theme.of(context).primaryColor,
                width: borderWidth ?? 0,
              ),
        shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: isCircular
            ? null
            : BorderRadius.only(
                topLeft: Radius.circular(radius ?? 4),
                topRight: Radius.circular(radius ?? 4),
                bottomLeft: Radius.circular(radius ?? 4),
                bottomRight: Radius.circular(radius ?? 4),
              ),
      ),
      child: imageUrl == null
          ? const SizedBox()
          : kIsWeb
              ? IgnorePointer(
                child: ImageNetwork(
                    image: imageUrl ?? "image not found",
                    duration: 1500,
                    width: width,
                    height: height,
                    curve: Curves.easeIn,
                    onPointer: true,
                    debugPrint: false,
                    fullScreen: false,
                    fitAndroidIos: BoxFit.cover,
                    fitWeb: BoxFitWeb.cover,
                    imageCache: CachedNetworkImageProvider(imageUrl ?? 'image not found'),
                    borderRadius: BorderRadius.circular(radius ?? 4),
                    onLoading: Center(
                      child: SizedBox(
                        height: height / 4,
                        width: height / 4,
                        child: LoadingAnimationWidget.flickr(
                          leftDotColor: Colors.indigo,
                          rightDotColor: Theme.of(context).primaryColor,
                          size: height / 4,
                        ),
                      ),
                    ),
                    onError: Container(
                      decoration: BoxDecoration(
                        shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
                        borderRadius: isCircular
                            ? null
                            : BorderRadius.only(
                                topLeft: Radius.circular(radius ?? 4),
                                topRight: Radius.circular(radius ?? 4),
                                bottomLeft: Radius.circular(radius ?? 4),
                                bottomRight: Radius.circular(radius ?? 4),
                              ),
                        image: DecorationImage(
                          image: const AssetImage('assets/images/launcher/ios.png'),
                          fit: fit ?? BoxFit.cover,
                        ),
                      ),
                    ),
                    // onTap: () {
                    //   debugPrint("©gabriel_patrick_souza");
                    // },
                  ),
              )
              : CachedNetworkImage(
                  imageBuilder: (context, imageProvider) => Container(
                    height: height,
                    decoration: BoxDecoration(
                      shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
                      borderRadius: isCircular
                          ? null
                          : BorderRadius.only(
                              topLeft: Radius.circular(radius ?? 12),
                              topRight: Radius.circular(radius ?? 12),
                              bottomLeft: Radius.circular(radius ?? 12),
                              bottomRight: Radius.circular(radius ?? 12),
                            ),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: fit ?? BoxFit.cover,
                      ),
                    ),
                  ),
                  imageUrl: imageUrl ?? 'image not found',
                  width: width,
                  height: height,
                  progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                    child: SizedBox(
                      height: height / 4,
                      width: height / 4,
                      child: LoadingAnimationWidget.flickr(
                        leftDotColor: Colors.indigo,
                        rightDotColor: Theme.of(context).primaryColor,
                        size: height / 4,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    decoration: BoxDecoration(
                      shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
                      borderRadius: isCircular
                          ? null
                          : BorderRadius.only(
                              topLeft: Radius.circular(radius ?? 12),
                              topRight: Radius.circular(radius ?? 12),
                              bottomLeft: Radius.circular(radius ?? 12),
                              bottomRight: Radius.circular(radius ?? 12),
                            ),
                      image: DecorationImage(
                        image: const AssetImage('assets/images/launcher/ios.png'),
                        fit: fit ?? BoxFit.cover,
                      ),
                    ),
                  ),
                ),
    );
  }
}
