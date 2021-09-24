import 'package:freezed_annotation/freezed_annotation.dart';
import '../interfaces/data_interfaces.dart';
import 'country.dart';

part 'city.freezed.dart';
part 'city.g.dart';

@freezed
class City with _$City implements LocationInterface {
  const City._();
  const factory City({
    required String name,
    required String localizedName,
    required Country country,
  }) = _City;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  @override
  String get countryEmoji => country.countryEmoji;
}
