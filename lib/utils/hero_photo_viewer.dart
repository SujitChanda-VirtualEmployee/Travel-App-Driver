import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:travel_app_driver/constants.dart';



class HeroPhotoViewRouteWrapper extends StatelessWidget {
   const HeroPhotoViewRouteWrapper({
    required this.imageProvider,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
    this.tagName,
  });

  final ImageProvider imageProvider;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final dynamic tagName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(
              height: MediaQuery.of(context).size.height,
            ),
            child: PhotoView(
                imageProvider: imageProvider,
                backgroundDecoration: backgroundDecoration,
                minScale: minScale,
                maxScale: maxScale,
                heroAttributes: PhotoViewHeroAttributes(tag: tagName),
                loadingBuilder: (_, chunk) {
                  if (chunk != null) {
                    return glassLoading();
                  }
                  return glassLoading();
                }),
          ),
          Positioned(top:  MediaQuery.of(context).padding.top + 0, right: 0, child: const CloseButton(color: Colors.white))
        ],
      ),
    );
  }
}
