import 'package:freezed_annotation/freezed_annotation.dart';

import '../shorts/event_short.dart';

part 'shows_by_date.freezed.dart';
part 'shows_by_date.g.dart';

@freezed
class ShowsByDate with _$ShowsByDate {
  const ShowsByDate._();
  const factory ShowsByDate({
    required DateTime date,
    required List<EventShort> events,
  }) = _EventsByDate;

  factory ShowsByDate.fromJson(Map<String, dynamic> json) =>
      _$ShowsByDateFromJson(json);
}
