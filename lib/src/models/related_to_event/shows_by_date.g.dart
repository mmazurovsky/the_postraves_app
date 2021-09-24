// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shows_by_date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EventsByDate _$_$_EventsByDateFromJson(Map<String, dynamic> json) {
  return _$_EventsByDate(
    date: DateTime.parse(json['date'] as String),
    events: (json['events'] as List<dynamic>)
        .map((e) => EventShort.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_EventsByDateToJson(_$_EventsByDate instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'events': instance.events.map((e) => e.toJson()).toList(),
    };
