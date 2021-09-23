// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_short.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EventShort _$_$_EventShortFromJson(Map<String, dynamic> json) {
  return _$_EventShort(
    id: json['id'] as int,
    name: json['name'] as String,
    overallFollowers: json['overallFollowers'] as int,
    weeklyFollowers: json['weeklyFollowers'] as int,
    isFollowed: json['isFollowed'] as bool,
    status: _$enumDecode(_$EventStatusEnumMap, json['status']),
    startDateTime: DateTime.parse(json['startDateTime'] as String),
    place: PlaceShort.fromJson(json['place'] as Map<String, dynamic>),
    ticketPrices: (json['ticketPrices'] as List<dynamic>)
        .map((e) => TicketPrice.fromJson(e as Map<String, dynamic>))
        .toList(),
    imageLink: json['imageLink'] as String?,
  );
}

Map<String, dynamic> _$_$_EventShortToJson(_$_EventShort instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'overallFollowers': instance.overallFollowers,
      'weeklyFollowers': instance.weeklyFollowers,
      'isFollowed': instance.isFollowed,
      'status': _$EventStatusEnumMap[instance.status],
      'startDateTime': instance.startDateTime.toIso8601String(),
      'place': instance.place,
      'ticketPrices': instance.ticketPrices,
      'imageLink': instance.imageLink,
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

const _$EventStatusEnumMap = {
  EventStatus.UPCOMING: 'UPCOMING',
  EventStatus.PRESALE: 'PRESALE',
  EventStatus.TOMORROW: 'TOMORROW',
  EventStatus.TODAY: 'TODAY',
  EventStatus.LIVE: 'LIVE',
  EventStatus.PAST: 'PAST',
  EventStatus.CANCELLED: 'CANCELLED',
};
