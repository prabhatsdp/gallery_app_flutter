import 'package:flutter/material.dart';
import 'package:gallery_app/core/data/utils/logging.dart';
import 'package:gallery_app/features/gallery/domain/models/image_model.dart';
import 'package:go_router/go_router.dart';

class ImageItem extends StatelessWidget {
  final ImageModel image;

  const ImageItem({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      surfaceTintColor: Colors.white,
      type: MaterialType.transparency,
      child: InkWell(
        radius: 16.0,
        customBorder: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        onTap: () {
          logger.d("Clicked image ${image.id}");
          context.push(
            "/details",
            extra: {"image": image},
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: FadeInImage(
                    fadeInDuration: const Duration(milliseconds: 300),
                    fadeOutDuration: const Duration(milliseconds: 10),
                    fadeInCurve: decelerateEasing,
                    fadeOutCurve: accelerateEasing,
                    fit: BoxFit.cover,
                    placeholder:
                        const AssetImage("assets/images/placeholder.png"),
                    image: NetworkImage(image.imageThumbnail),
                  ),
                ),
              ),
              Row(
                children: [
                  Text("@${image.firstName}"),
                  const Spacer(),
                  Text("${image.likes}")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
