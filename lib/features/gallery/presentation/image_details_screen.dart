import 'package:flutter/material.dart';
import 'package:gallery_app/features/gallery/domain/models/image_model.dart';

class ImageDetailsScreen extends StatelessWidget {
  final ImageModel? image;

  const ImageDetailsScreen({Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Full Image"),
      ),
      body: SafeArea(
        child: image != null ? _imageDetails(image!) : _errorView(),
      ),
    );
  }

  Widget _imageDetails(ImageModel img) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          widthFactor: 1,
          child: Hero(
            tag: img.id,
            child: FadeInImage(
              fadeInDuration: const Duration(milliseconds: 300),
              fadeOutDuration: const Duration(milliseconds: 10),
              fadeInCurve: decelerateEasing,
              fadeOutCurve: accelerateEasing,
              fit: BoxFit.cover,
              placeholder: const AssetImage("assets/images/placeholder.png"),
              image: NetworkImage(img.imageLarge),
            ),
          ),
        )
      ],
    );
  }

  Widget _errorView() {
    return const Center(
      child: Text("Image not found!"),
    );
  }
}
