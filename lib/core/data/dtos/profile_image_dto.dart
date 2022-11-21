import 'package:json_annotation/json_annotation.dart';
part 'profile_image_dto.g.dart';

@JsonSerializable()
class ProfileImageDto {
  String? small;
  String? medium;
  String? large;

  ProfileImageDto({
    this.small,
    this.medium,
    this.large,
  });

  factory ProfileImageDto.fromJson(Map<String, dynamic> json) => _$ProfileImageDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileImageDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
