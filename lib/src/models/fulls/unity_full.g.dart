// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unity_full.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnityFull _$_$_UnityFullFromJson(Map<String, dynamic> json) {
  return _$_UnityFull(
    about: json['about'] as String?,
    instagramUsername: json['instagramUsername'] as String?,
    soundcloudUsername: json['soundcloudUsername'] as String?,
    bandcampUsername: json['bandcampUsername'] as String?,
    id: json['id'] as int,
    name: json['name'] as String,
    overallFollowers: json['overallFollowers'] as int,
    weeklyFollowers: json['weeklyFollowers'] as int,
    isFollowed: json['isFollowed'] as bool,
    imageLink: json['imageLink'] as String?,
    country: json['country'] == null
        ? null
        : Country.fromJson(json['country'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_UnityFullToJson(_$_UnityFull instance) =>
    <String, dynamic>{
      'about': instance.about,
      'instagramUsername': instance.instagramUsername,
      'soundcloudUsername': instance.soundcloudUsername,
      'bandcampUsername': instance.bandcampUsername,
      'id': instance.id,
      'name': instance.name,
      'overallFollowers': instance.overallFollowers,
      'weeklyFollowers': instance.weeklyFollowers,
      'isFollowed': instance.isFollowed,
      'imageLink': instance.imageLink,
      'country': instance.country?.toJson(),
    };
