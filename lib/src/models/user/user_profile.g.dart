// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserProfile _$_$_UserProfileFromJson(Map<String, dynamic> json) {
  return _$_UserProfile(
    id: json['id'] as int,
    name: json['name'] as String,
    currentCity: City.fromJson(json['currentCity'] as Map<String, dynamic>),
    overallFollowers: json['overallFollowers'] as int,
    weeklyFollowers: json['weeklyFollowers'] as int,
    about: json['about'] as String?,
    imageLink: json['imageLink'] as String?,
    instagramLink: json['instagramLink'] as String?,
    telegramLink: json['telegramLink'] as String?,
  );
}

Map<String, dynamic> _$_$_UserProfileToJson(_$_UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'currentCity': instance.currentCity,
      'overallFollowers': instance.overallFollowers,
      'weeklyFollowers': instance.weeklyFollowers,
      'about': instance.about,
      'imageLink': instance.imageLink,
      'instagramLink': instance.instagramLink,
      'telegramLink': instance.telegramLink,
    };
