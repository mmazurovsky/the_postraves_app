import 'package:freezed_annotation/freezed_annotation.dart';
import '../enum/artist_performance_status.dart';
import '../shorts/artist_short.dart';

part 'timetable_performance.freezed.dart';
part 'timetable_performance.g.dart';

@freezed
class TimetablePerformance with _$TimetablePerformance {

  const factory TimetablePerformance({
    required List<ArtistShort> artists,
    required DateTime startingDateTime,
    required DateTime endingDateTime,
    String? typeOfPerformance,
    ArtistPerformanceStatus? performanceStatus,
  }) = _TimetablePerformance;

  factory TimetablePerformance.fromJson(Map<String, dynamic> json) =>
      _$TimetablePerformanceFromJson(json);
}
