import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../models/related_to_event/timetable_for_scene.dart';
import '../../../models/related_to_place/scene.dart';
import 'timetable_day_performances_dto.dart';

part 'timetable_for_scene_dto.freezed.dart';

@freezed
class TimetableForSceneDto with _$TimetableForSceneDto {
  const TimetableForSceneDto._();
  const factory TimetableForSceneDto({
    required Scene scene,
    required List<TimetableDayPerformancesDto> timetableDayPerformances,
  }) = _TimetableForSceneDto;

  factory TimetableForSceneDto.fromModel(
      TimetableForScene timetableForSceneModel) {
    DateTime _getOnlyDate(DateTime dateTime) {
      return DateTime(dateTime.year, dateTime.month, dateTime.day);
    }

    List<TimetableDayPerformancesDto> dayPerformances = [];
    Set<DateTime> sceneDays = {};

    timetableForSceneModel.artistPerformances.forEach((performance) {
      DateTime performanceDate = _getOnlyDate(performance.startingDateTime);
      if (sceneDays.contains(performanceDate)) {
        dayPerformances
            .firstWhere((element) => element.date == performanceDate)
            .performances
            .add(performance);
      } else {
        sceneDays.add(performanceDate);
        dayPerformances.add(
          TimetableDayPerformancesDto(
            date: performanceDate,
            performances: [performance],
          ),
        );
      }
    });

    return TimetableForSceneDto(
        scene: timetableForSceneModel.scene,
        timetableDayPerformances: dayPerformances);
  }
}
