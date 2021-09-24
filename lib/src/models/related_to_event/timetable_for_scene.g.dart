// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable_for_scene.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TimetableForScene _$_$_TimetableForSceneFromJson(Map<String, dynamic> json) {
  return _$_TimetableForScene(
    scene: Scene.fromJson(json['scene'] as Map<String, dynamic>),
    artistPerformances: (json['artistPerformances'] as List<dynamic>)
        .map((e) => TimetablePerformance.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_TimetableForSceneToJson(
        _$_TimetableForScene instance) =>
    <String, dynamic>{
      'scene': instance.scene.toJson(),
      'artistPerformances':
          instance.artistPerformances.map((e) => e.toJson()).toList(),
    };
