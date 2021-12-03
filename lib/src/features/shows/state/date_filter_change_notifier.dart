import 'package:flutter/widgets.dart';
import 'package:sprintf/sprintf.dart';
import 'package:the_postraves_app/src/common/geo_provider/current_city_provider.dart';
import 'package:the_postraves_package/models/geo/city.dart';

class DateTimeFilterChangeNotifier with ChangeNotifier {
  final CurrentCityChangeNotifier _currentCityProvider;
  DateTime? _startDateTime;
  DateTime? _endDateTime;
  City? _currentCity;
  bool _isFiltered = false;

  DateTimeFilterChangeNotifier(this._currentCityProvider) {
    _currentCityProvider.addListener(() {
      if (_currentCity != _currentCityProvider.currentCity) {
        dropFilter();
      }
    });
  }

  DateTime? get startDateTime => _startDateTime;
  DateTime? get endDateTime => _endDateTime;
  DateTime? get startDateTimeWithTimezone => _startDateTime == null
      ? null
      : _createDateTimeWithTimeOffsetOfCurrentCity(_startDateTime!);
  DateTime? get endDateTimeWithTimezone => _endDateTime == null
      ? null
      : _createDateTimeWithTimeOffsetOfCurrentCity(_endDateTime!);
  bool get isFiltered => _isFiltered;

  set startDateTime(DateTime? dateTime) {
    _startDateTime = dateTime;
    notifyListeners();
  }

  set endDateTime(DateTime? dateTime) {
    _endDateTime = dateTime;
    notifyListeners();
  }

  void dropFilter() {
    _startDateTime = null;
    _endDateTime = null;
    _isFiltered = false;
    notifyListeners();
  }

  void applyFilter() {
    _isFiltered = true;
    notifyListeners();
  }

  DateTime _createDateTimeWithTimeOffsetOfCurrentCity(DateTime inputDateTime) {
    final dateTimeInUtc = inputDateTime.toUtc();
    final timeOffset = _currentCityProvider
        .currentCity!.timeOffset; //todo if timeoffset null -> exception
    final dateTimeWithTimeOffsetAsStringWithUtcMarker =
        dateTimeInUtc.toIso8601String();
    final dateTimeWithTimeOffsetAsStringWithoutUtcMarker =
        dateTimeWithTimeOffsetAsStringWithUtcMarker.substring(
            0, dateTimeWithTimeOffsetAsStringWithUtcMarker.length - 1);
    final dateTimeWithTimeOffsetAsString =
        '$dateTimeWithTimeOffsetAsStringWithoutUtcMarker${_createTimeOffsetStringMarker(timeOffset)}';
    return DateTime.parse(dateTimeWithTimeOffsetAsString).toLocal();
  }

  String _createTimeOffsetStringMarker(int timeOffset) {
    StringBuffer timeOffsetMarkerBuffer = StringBuffer();
    timeOffsetMarkerBuffer.write(timeOffset >= 0 ? '+' : "-");
    timeOffsetMarkerBuffer.write(sprintf('%02i', [timeOffset]));
    timeOffsetMarkerBuffer.write(':00');
    return timeOffsetMarkerBuffer.toString();
  }
}
