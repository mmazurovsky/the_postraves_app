// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wiki_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WikiDataDto _$_$_WikiDataDtoFromJson(Map<String, dynamic> json) {
  return _$_WikiDataDto(
    name: json['name'] as String,
    imageLink: json['imageLink'] as String?,
    imageDimensions: json['imageDimensions'] == null
        ? null
        : ImageDimensions.fromJson(
            json['imageDimensions'] as Map<String, dynamic>),
    country: json['country'] == null
        ? null
        : Country.fromJson(json['country'] as Map<String, dynamic>),
    id: json['id'] as int,
    type: _$enumDecode(_$WikiFollowableTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$_$_WikiDataDtoToJson(_$_WikiDataDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'imageLink': instance.imageLink,
      'imageDimensions': instance.imageDimensions?.toJson(),
      'country': instance.country?.toJson(),
      'id': instance.id,
      'type': _$WikiFollowableTypeEnumMap[instance.type],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$WikiFollowableTypeEnumMap = {
  WikiFollowableType.ARTIST: 'ARTIST',
  WikiFollowableType.UNITY: 'UNITY',
  WikiFollowableType.PLACE: 'PLACE',
  WikiFollowableType.EVENT: 'EVENT',
  WikiFollowableType.USER: 'USER',
};
