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

  String get weekdayAsString { //todo!!!
    if (date.weekday == 1) {
      return 'Пн';
    } else if (date.weekday == 2) {
      return 'Вт';
    } else if (date.weekday == 3) {
      return 'Ср';
    } else if (date.weekday == 4) {
      return 'Чт';
    } else if (date.weekday == 5) {
      return 'Пт';
    } else if (date.weekday == 6) {
      return 'Сб';
    } else {
      return 'Вс';
    }
  }

  factory ShowsByDate.fromJson(Map<String, dynamic> json) =>
      _$ShowsByDateFromJson(json);
}
