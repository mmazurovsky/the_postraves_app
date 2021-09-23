
import 'package:json_annotation/json_annotation.dart';

class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String jsonDateTime) {
    return DateTime.parse(jsonDateTime).toLocal();
  }

  @override
  String toJson(DateTime objectDateTime) {
    return objectDateTime.toIso8601String();
  }
}