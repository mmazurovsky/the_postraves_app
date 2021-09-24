// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_to_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserProfileToCreate _$_$_UserProfileToCreateFromJson(
    Map<String, dynamic> json) {
  return _$_UserProfileToCreate(
    name: json['name'] as String,
    imageLink: json['imageLink'] as String?,
    currentCity: City.fromJson(json['currentCity'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_UserProfileToCreateToJson(
        _$_UserProfileToCreate instance) =>
    <String, dynamic>{
      'name': instance.name,
      'imageLink': instance.imageLink,
      'currentCity': instance.currentCity.toJson(),
    };
