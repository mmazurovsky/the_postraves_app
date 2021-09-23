import 'package:freezed_annotation/freezed_annotation.dart';
import 'timetable_performance.dart';
import '../related_to_place/scene.dart';

part 'timetable_for_scene.freezed.dart';
part 'timetable_for_scene.g.dart';

@freezed
class TimetableForScene with _$TimetableForScene {

  const factory TimetableForScene({
    required Scene scene,
    required List<TimetablePerformance> artistPerformances,
  }) = _TimetableForScene;

  factory TimetableForScene.fromJson(Map<String, dynamic> json) =>
      _$TimetableForSceneFromJson(json);
}
