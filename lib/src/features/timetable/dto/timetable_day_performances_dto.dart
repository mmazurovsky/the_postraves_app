import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_postraves_package/models/related_to_event/timetable_performance.dart';

part 'timetable_day_performances_dto.freezed.dart';

@freezed
class TimetableDayPerformancesDto with _$TimetableDayPerformancesDto {
  const factory TimetableDayPerformancesDto({
    required DateTime date,
    required List<TimetablePerformance> performances,
  }) = _TimetableDayPerformances;
}
