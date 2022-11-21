part of 'gallery_bloc.dart';

@immutable
abstract class GalleryEvent {
  const GalleryEvent();
}

class GetGalleryImages extends GalleryEvent {
  const GetGalleryImages();
}
