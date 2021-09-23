// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_full.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EventFull _$_$_EventFullFromJson(Map<String, dynamic> json) {
  return _$_EventFull(
    id: json['id'] as int,
    name: json['name'] as String,
    overallFollowers: json['overallFollowers'] as int,
    weeklyFollowers: json['weeklyFollowers'] as int,
    isFollowed: json['isFollowed'] as bool,
    status: _$enumDecode(_$EventStatusEnumMap, json['status']),
    startDateTime: DateTime.parse(json['startDateTime'] as String),
    endDateTime: DateTime.parse(json['endDateTime'] as String),
    place: PlaceShort.fromJson(json['place'] as Map<String, dynamic>),
    imageLink: json['imageLink'] as String?,
    about: json['about'] as String?,
    ticketsLink: json['ticketsLink'] as String?,
    ticketPrices: (json['ticketPrices'] as List<dynamic>?)
        ?.map((e) => TicketPrice.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_EventFullToJson(_$_EventFull instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'overallFollowers': instance.overallFollowers,
      'weeklyFollowers': instance.weeklyFollowers,
      'isFollowed': instance.isFollowed,
      'status': _$EventStatusEnumMap[instance.status],
      'startDateTime': instance.startDateTime.toIso8601String(),
      'endDateTime': instance.endDateTime.toIso8601String(),
      'place': instance.place,
      'imageLink': instance.imageLink,
      'about': instance.about,
      'ticketsLink': instance.ticketsLink,
      'ticketPrices': instance.ticketPrices,
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
