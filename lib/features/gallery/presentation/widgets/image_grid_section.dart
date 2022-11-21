import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/core/data/utils/logging.dart';
import 'package:gallery_app/features/gallery/domain/models/image_model.dart';
import 'package:gallery_app/features/gallery/presentation/bloc/gallery_bloc.dart';
import 'package:gallery_app/features/gallery/presentation/widgets/image_grid.dart';

import 'image_item.dart';

class ImageGridSection extends StatelessWidget {
  final ScrollController _controller = ScrollController();

  /// Scroll offset value is 1000 because we want to preload the items before
  /// the list reaches to end. If you want to load the items when scroll reaches
  /// to the end, then make the value 0
  static const double nextPageScrollOffset = 1000;

  ImageGridSection({
    Key? key,
  }) : super(key: key);

  void setupScrollController(BuildContext context) {
    _controller.addListener(() {
      if (_controller.position.extentAfter < nextPageScrollOffset) {
        BlocProvider.of<GalleryBloc>(context).add(const GetGalleryImages());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    return BlocBuilder<GalleryBloc, GalleryState>(builder: (context, state) {
      if (state is GalleryLoading) {
        if (state.isFirstPage) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ImageGrid(
            images: state.oldList,
            controller: _controller,
            isNextPageLoading: true,
          );
        }
      }
      if (state is GalleryLoaded) {
        return ImageGrid(images: state.imageList, controller: _controller);
      }
      if (state is GalleryError) {
        return Center(
          child: Text(state.error),
        );
      }
      return const Center(
        child: Text("Something went wrong"),
      );
    });
  }
}
