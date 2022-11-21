part of 'gallery_bloc.dart';

@immutable
abstract class GalleryState {}

class GalleryInitial extends GalleryState {}

class GalleryLoaded extends GalleryState {
  final List<ImageModel> imageList;
  GalleryLoaded({required this.imageList});
}

class GalleryLoading extends GalleryState {
  final List<ImageModel> oldList;
  final bool isFirstPage;
  GalleryLoading(this.oldList, {this.isFirstPage = false});
}

class GalleryError extends GalleryState {
  final String error;

  GalleryError({required this.error});
}
