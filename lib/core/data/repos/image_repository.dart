import 'package:dio/dio.dart';
import 'package:gallery_app/core/data/dtos/image_dto.dart';
import 'package:gallery_app/core/data/utils/logging.dart';
import 'package:gallery_app/core/data/utils/network_response.dart';
import 'package:gallery_app/core/domain/utils/result.dart';
import 'package:gallery_app/features/gallery/domain/models/image_model.dart';
import 'package:gallery_app/features/gallery/domain/repos/i_image_repository.dart';
import 'package:injectable/injectable.dart';

import '../sources/remote/gallery_service.dart';

@Injectable(as: IImageRepository)
class ImageRepository implements IImageRepository {
  final GalleryService httpService;

  ImageRepository(this.httpService);
  
  @override
  Future<Result<List<ImageModel>>> loadImages(int page) async {
    try {
      ApiResponse response = await httpService.requestCustomResponse(
          url: "/photos",
          method: Method.GET,
          params: {
            "per_page": 20,
            "page": page
          }
      );
      if(response is ApiResponseSuccess) {
        List<dynamic> list = response.data;
        var imageList = list.map((e) => ImageDto.fromJson(e).toDomain()).toList();
        return Success(data: imageList);
      }
      if(response is ApiResponseFailed) {
        logger.e(response.errorBody);
        // send error message from here
        return Failed(response.errorBody ?? "Something went wrong");
      }
      return Failed("Unknown error");
    } on Exception catch(e) {
      logger.e(e.toString());
      return Failed(e.toString());
    }
  }
}
