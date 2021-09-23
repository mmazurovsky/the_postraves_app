// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unified_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifiedSearchModel _$_$_UnifiedSearchModelFromJson(
    Map<String, dynamic> json) {
  return _$_UnifiedSearchModel(
    id: json['id'] as int,
    name: json['name'] as String,
    imageLink: json['imageLink'] as String?,
    type: _$enumDecode(_$WikiFollowableTypeEnumMap, json['type']),
    updatedDateTime: DateTime.parse(json['updatedDateTime'] as String),
    country: json['country'] == null
        ? null
        : Country.fromJson(json['country'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_UnifiedSearchModelToJson(
        _$_UnifiedSearchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageLink': instance.imageLink,
      'type': _$WikiFollowableTypeEnumMap[instance.type],
      'updatedDateTime': instance.updatedDateTime.toIso8601String(),
      'country': instance.country,
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
