// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_short.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ArtistShort _$_$_ArtistShortFromJson(Map<String, dynamic> json) {
  return _$_ArtistShort(
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

Map<String, dynamic> _$_$_ArtistShortToJson(_$_ArtistShort instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'overallFollowers': instance.overallFollowers,
      'weeklyFollowers': instance.weeklyFollowers,
      'isFollowed': instance.isFollowed,
      'imageLink': instance.imageLink,
      'country': instance.country?.toJson(),
    };
