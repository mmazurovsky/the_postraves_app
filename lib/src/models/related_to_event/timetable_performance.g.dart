// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable_performance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TimetablePerformance _$_$_TimetablePerformanceFromJson(
    Map<String, dynamic> json) {
  return _$_TimetablePerformance(
    artists: (json['artists'] as List<dynamic>)
        .map((e) => ArtistShort.fromJson(e as Map<String, dynamic>))
        .toList(),
    startingDateTime: DateTime.parse(json['startingDateTime'] as String),
    endingDateTime: DateTime.parse(json['endingDateTime'] as String),
    typeOfPerformance: json['typeOfPerformance'] as String?,
    performanceStatus: _$enumDecodeNullable(
        _$ArtistPerformanceStatusEnumMap, json['performanceStatus']),
  );
}

Map<String, dynamic> _$_$_TimetablePerformanceToJson(
        _$_TimetablePerformance instance) =>
    <String, dynamic>{
      'artists': instance.artists.map((e) => e.toJson()).toList(),
      'startingDateTime': instance.startingDateTime.toIso8601String(),
      'endingDateTime': instance.endingDateTime.toIso8601String(),
      'typeOfPerformance': instance.typeOfPerformance,
      'performanceStatus':
          _$ArtistPerformanceStatusEnumMap[instance.performanceStatus],
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

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$ArtistPerformanceStatusEnumMap = {
  ArtistPerformanceStatus.UPCOMING: 'UPCOMING',
  ArtistPerformanceStatus.LIVE: 'LIVE',
  ArtistPerformanceStatus.PAST: 'PAST',
};
