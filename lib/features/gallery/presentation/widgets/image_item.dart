import 'package:flutter/material.dart';
import 'package:gallery_app/core/data/utils/logging.dart';
import 'package:gallery_app/features/gallery/domain/models/image_model.dart';
import 'package:go_router/go_router.dart';

class ImageItem extends StatelessWidget {
  final ImageModel image;

  const ImageItem({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(4.0, 4.0),
            color: Color(image.hexColor()),
            blurRadius: 24.0
          ),
        ]
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Positioned.fill(
            child: Hero(
              tag: image.id,
              child: FadeInImage(
                fadeInDuration: const Duration(milliseconds: 300),
                fadeOutDuration: const Duration(milliseconds: 10),
                fadeInCurve: decelerateEasing,
                fadeOutCurve: accelerateEasing,
                fit: BoxFit.cover,
                placeholder: const AssetImage("assets/images/placeholder.png"),
                image: NetworkImage(image.imageThumbnail),
              ),
            ),
          ),
          Material(
            type: MaterialType.transparency,
            child: InkWell(
              radius: 16.0,
              splashColor: Colors.black.withAlpha(80),
              highlightColor: Colors.black.withAlpha(70),
              onTap: () {
                logger.d("Clicked image ${image.id}");
                context.push(
                  "/details",
                  extra: {
                    "image": image,
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
