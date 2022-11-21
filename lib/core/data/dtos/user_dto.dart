import 'package:gallery_app/core/data/dtos/profile_image_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  String id;
  String username;
  String name;
  @JsonKey(name: "first_name")
  String? firstName;
  @JsonKey(name: "last_name")
  String? lastName;
  @JsonKey(name: "profile_image")
  ProfileImageDto profileImage;

  UserDto({
    required this.id,
    required this.username,
    required this.name,
    required this.profileImage,
    this.firstName,
    this.lastName,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
