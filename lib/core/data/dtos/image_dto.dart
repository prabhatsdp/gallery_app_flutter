import 'package:gallery_app/core/data/dtos/urls_dto.dart';
import 'package:gallery_app/core/data/dtos/user_dto.dart';
import 'package:gallery_app/features/gallery/domain/models/image_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_dto.g.dart';

@JsonSerializable()
class ImageDto {
  String id;
  int width;
  int height;
  String color;
  @JsonKey(name: "description")
  String? desc;
  @JsonKey(name: "alt_description")
  String? altDesc;
  int likes;
  UrlsDto urls;
  UserDto user;

  ImageDto({
    required this.id,
    required this.width,
    required this.height,
    required this.color,
    required this.urls,
    required this.user,
    this.likes = 0,
    this.desc,
    this.altDesc,
  });

  factory ImageDto.fromJson(Map<String, dynamic> json) =>
      _$ImageDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ImageDtoToJson(this);

  ImageModel toDomain() => ImageModel(
        id: id,
        imageLarge: urls.regular,
        imageThumbnail: urls.thumb,
        userName: user.username,
        likes: likes,
        firstName: user.firstName ?? "Unknown",
        color: color,
      );

  @override
  String toString() {
    return toJson().toString();
  }
}
