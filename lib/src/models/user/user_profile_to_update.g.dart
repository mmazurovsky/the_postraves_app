// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_to_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserProfileToUpdate _$_$_UserProfileToUpdateFromJson(
    Map<String, dynamic> json) {
  return _$_UserProfileToUpdate(
    name: json['name'] as String,
    currentCity: City.fromJson(json['currentCity'] as Map<String, dynamic>),
    about: json['about'] as String?,
    imageLink: json['imageLink'] as String?,
    instagramLink: json['instagramLink'] as String?,
    telegramLink: json['telegramLink'] as String?,
  );
}

Map<String, dynamic> _$_$_UserProfileToUpdateToJson(
        _$_UserProfileToUpdate instance) =>
    <String, dynamic>{
      'name': instance.name,
      'currentCity': instance.currentCity,
      'about': instance.about,
      'imageLink': instance.imageLink,
      'instagramLink': instance.instagramLink,
      'telegramLink': instance.telegramLink,
    };
