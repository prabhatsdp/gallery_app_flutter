import 'package:gallery_app/core/domain/utils/result.dart';
import 'package:gallery_app/features/gallery/domain/models/image_model.dart';

abstract class IImageRepository {
  Future<Result<List<ImageModel>>> loadImages(int page);
}
