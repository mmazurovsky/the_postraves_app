// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_short.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlaceShort _$_$_PlaceShortFromJson(Map<String, dynamic> json) {
  return _$_PlaceShort(
    city: City.fromJson(json['city'] as Map<String, dynamic>),
    streetAddress: json['streetAddress'] as String,
    coordinate: Coordinate.fromJson(json['coordinate'] as Map<String, dynamic>),
    id: json['id'] as int,
    name: json['name'] as String,
    overallFollowers: json['overallFollowers'] as int,
    weeklyFollowers: json['weeklyFollowers'] as int,
    isFollowed: json['isFollowed'] as bool,
    imageLink: json['imageLink'] as String?,
  );
}

Map<String, dynamic> _$_$_PlaceShortToJson(_$_PlaceShort instance) =>
    <String, dynamic>{
      'city': instance.city,
      'streetAddress': instance.streetAddress,
      'coordinate': instance.coordinate,
      'id': instance.id,
      'name': instance.name,
      'overallFollowers': instance.overallFollowers,
      'weeklyFollowers': instance.weeklyFollowers,
      'isFollowed': instance.isFollowed,
      'imageLink': instance.imageLink,
    };
