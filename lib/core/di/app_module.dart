
import 'package:injectable/injectable.dart';

import '../data/sources/remote/gallery_service.dart';

@module
abstract class AppModule {

  @preResolve
  Future<GalleryService> get galleryService async => await GalleryService().init();
}