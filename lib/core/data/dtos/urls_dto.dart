import 'package:json_annotation/json_annotation.dart';

part 'urls_dto.g.dart';

@JsonSerializable()
class UrlsDto {
  String? raw;
  String full;
  String regular;
  String? small;
  String thumb;
  @JsonKey(name: "small_s3")
  String? smallS3;

  UrlsDto({
    this.raw,
    required this.full,
    required this.regular,
    this.small,
    this.smallS3,
    required this.thumb,
  });

  factory UrlsDto.fromJson(Map<String, dynamic> json) => _$UrlsDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UrlsDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
