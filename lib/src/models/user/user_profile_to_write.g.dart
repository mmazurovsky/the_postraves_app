// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_to_write.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserProfileToWrite _$_$_UserProfileToWriteFromJson(
    Map<String, dynamic> json) {
  return _$_UserProfileToWrite(
    name: json['name'] as String,
    currentCity: json['currentCity'] as String,
    about: json['about'] as String?,
    imageLink: json['imageLink'] as String?,
    instagramUsername: json['instagramUsername'] as String?,
    telegramUsername: json['telegramUsername'] as String?,
  );
}

Map<String, dynamic> _$_$_UserProfileToWriteToJson(
        _$_UserProfileToWrite instance) =>
    <String, dynamic>{
      'name': instance.name,
      'currentCity': instance.currentCity,
      'about': instance.about,
      'imageLink': instance.imageLink,
      'instagramUsername': instance.instagramUsername,
      'telegramUsername': instance.telegramUsername,
    };
