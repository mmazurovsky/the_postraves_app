import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/utils/date_time_converter.dart';
import '../shorts/artist_short.dart';

part 'timetable_performance.freezed.dart';
part 'timetable_performance.g.dart';

@freezed
class TimetablePerformance with _$TimetablePerformance {

  const factory TimetablePerformance({
    required List<ArtistShort> artists,
    @DateTimeConverter()
    required DateTime startingDateTime,
    @DateTimeConverter()
    required DateTime endingDateTime,
    String? typeOfPerformance,
    // ArtistPerformanceStatus? performanceStatus,
  }) = _TimetablePerformance;

  factory TimetablePerformance.fromJson(Map<String, dynamic> json) =>
      _$TimetablePerformanceFromJson(json);
}
