// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_full.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ArtistFull _$_$_ArtistFullFromJson(Map<String, dynamic> json) {
  return _$_ArtistFull(
    id: json['id'] as int,
    name: json['name'] as String,
    overallFollowers: json['overallFollowers'] as int,
    weeklyFollowers: json['weeklyFollowers'] as int,
    isFollowed: json['isFollowed'] as bool,
    imageLink: json['imageLink'] as String?,
    country: json['country'] == null
        ? null
        : Country.fromJson(json['country'] as Map<String, dynamic>),
    about: json['about'] as String?,
    soundcloudUsername: json['soundcloudUsername'] as String?,
    instagramUsername: json['instagramUsername'] as String?,
  );
}

Map<String, dynamic> _$_$_ArtistFullToJson(_$_ArtistFull instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'overallFollowers': instance.overallFollowers,
      'weeklyFollowers': instance.weeklyFollowers,
      'isFollowed': instance.isFollowed,
      'imageLink': instance.imageLink,
      'country': instance.country?.toJson(),
      'about': instance.about,
      'soundcloudUsername': instance.soundcloudUsername,
      'instagramUsername': instance.instagramUsername,
    };
