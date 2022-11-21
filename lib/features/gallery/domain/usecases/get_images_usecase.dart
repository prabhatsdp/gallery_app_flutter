import 'package:gallery_app/core/domain/utils/result.dart';
import 'package:gallery_app/features/gallery/domain/models/image_model.dart';
import 'package:injectable/injectable.dart';

import '../repos/i_image_repository.dart';

@injectable
class GetImagesUseCase {
  final IImageRepository repository;

  GetImagesUseCase(this.repository);

  Future<Result<List<ImageModel>>> execute(int page) async {
    return await repository.loadImages(page);
  }

}
