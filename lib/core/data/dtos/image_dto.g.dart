// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageDto _$ImageDtoFromJson(Map<String, dynamic> json) => ImageDto(
      id: json['id'] as String,
      width: json['width'] as int,
      height: json['height'] as int,
      color: json['color'] as String,
      urls: UrlsDto.fromJson(json['urls'] as Map<String, dynamic>),
      user: UserDto.fromJson(json['user'] as Map<String, dynamic>),
      likes: json['likes'] as int? ?? 0,
      desc: json['description'] as String?,
      altDesc: json['alt_description'] as String?,
    );

Map<String, dynamic> _$ImageDtoToJson(ImageDto instance) => <String, dynamic>{
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
      'color': instance.color,
      'description': instance.desc,
      'alt_description': instance.altDesc,
      'likes': instance.likes,
      'urls': instance.urls,
      'user': instance.user,
    };
