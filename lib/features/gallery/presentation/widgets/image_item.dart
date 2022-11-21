import 'package:flutter/material.dart';

class ImageItem extends StatelessWidget {
  final String imageUrl;

  const ImageItem({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
