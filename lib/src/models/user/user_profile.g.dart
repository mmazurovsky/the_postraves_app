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
    imageLink: json['imageLink'] as String?,
    about: json['about'] as String?,
    instagramLink: json['instagramLink'] as String?,
    telegramLink: json['telegramLink'] as String?,
  );
}

Map<String, dynamic> _$_$_UserProfileToJson(_$_UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'currentCity': instance.currentCity.toJson(),
      'overallFollowers': instance.overallFollowers,
      'weeklyFollowers': instance.weeklyFollowers,
      'imageLink': instance.imageLink,
      'about': instance.about,
      'instagramLink': instance.instagramLink,
      'telegramLink': instance.telegramLink,
    };
