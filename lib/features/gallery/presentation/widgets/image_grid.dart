import 'package:flutter/material.dart';
import 'package:gallery_app/features/gallery/presentation/widgets/image_item.dart';

import '../../domain/models/image_model.dart';

class ImageGrid extends StatelessWidget {
  final List<ImageModel> images;
  final ScrollController controller;
  final bool isNextPageLoading;

  const ImageGrid({
    Key? key,
    required this.images,
    required this.controller,
    this.isNextPageLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
            ),
            controller: controller,
            padding: const EdgeInsets.all(16.0),
            itemCount: images.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return ImageItem(imageUrl: images[index].imageThumbnail);
            },
          ),
        ),
        isNextPageLoading
            ? const Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CircularProgressIndicator(),
                ),
              )
            : Container(),
      ],
    );
  }
}
