// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'city.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

City _$CityFromJson(Map<String, dynamic> json) {
  return _City.fromJson(json);
}

/// @nodoc
class _$CityTearOff {
  const _$CityTearOff();

  _City call(
      {required String name,
      required String localizedName,
      required Country country}) {
    return _City(
      name: name,
      localizedName: localizedName,
      country: country,
    );
  }

  City fromJson(Map<String, Object> json) {
    return City.fromJson(json);
  }
}

/// @nodoc
const $City = _$CityTearOff();

/// @nodoc
mixin _$City {
  String get name => throw _privateConstructorUsedError;
  String get localizedName => throw _privateConstructorUsedError;
  Country get country => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CityCopyWith<City> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityCopyWith<$Res> {
  factory $CityCopyWith(City value, $Res Function(City) then) =
      _$CityCopyWithImpl<$Res>;
  $Res call({String name, String localizedName, Country country});

  $CountryCopyWith<$Res> get country;
}

/// @nodoc
class _$CityCopyWithImpl<$Res> implements $CityCopyWith<$Res> {
  _$CityCopyWithImpl(this._value, this._then);

  final City _value;
  // ignore: unused_field
  final $Res Function(City) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? localizedName = freezed,
    Object? country = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      localizedName: localizedName == freezed
          ? _value.localizedName
          : localizedName // ignore: cast_nullable_to_non_nullable
              as String,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country,
    ));
  }

  @override
  $CountryCopyWith<$Res> get country {
    return $CountryCopyWith<$Res>(_value.country, (value) {
      return _then(_value.copyWith(country: value));
    });
  }
}

/// @nodoc
abstract class _$CityCopyWith<$Res> implements $CityCopyWith<$Res> {
  factory _$CityCopyWith(_City value, $Res Function(_City) then) =
      __$CityCopyWithImpl<$Res>;
  @override
  $Res call({String name, String localizedName, Country country});

  @override
  $CountryCopyWith<$Res> get country;
}

/// @nodoc
class __$CityCopyWithImpl<$Res> extends _$CityCopyWithImpl<$Res>
    implements _$CityCopyWith<$Res> {
  __$CityCopyWithImpl(_City _value, $Res Function(_City) _then)
      : super(_value, (v) => _then(v as _City));

  @override
  _City get _value => super._value as _City;

  @override
  $Res call({
    Object? name = freezed,
    Object? localizedName = freezed,
    Object? country = freezed,
  }) {
    return _then(_City(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      localizedName: localizedName == freezed
          ? _value.localizedName
          : localizedName // ignore: cast_nullable_to_non_nullable
              as String,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_City extends _City {
  const _$_City(
      {required this.name, required this.localizedName, required this.country})
      : super._();

  factory _$_City.fromJson(Map<String, dynamic> json) =>
      _$_$_CityFromJson(json);

  @override
  final String name;
  @override
  final String localizedName;
  @override
  final Country country;

  @override
  String toString() {
    return 'City(name: $name, localizedName: $localizedName, country: $country)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _City &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.localizedName, localizedName) ||
                const DeepCollectionEquality()
                    .equals(other.localizedName, localizedName)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality().equals(other.country, country)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(localizedName) ^
      const DeepCollectionEquality().hash(country);

  @JsonKey(ignore: true)
  @override
  _$CityCopyWith<_City> get copyWith =>
      __$CityCopyWithImpl<_City>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CityToJson(this);
  }
}

abstract class _City extends City {
  const factory _City(
      {required String name,
      required String localizedName,
      required Country country}) = _$_City;
  const _City._() : super._();

  factory _City.fromJson(Map<String, dynamic> json) = _$_City.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get localizedName => throw _privateConstructorUsedError;
  @override
  Country get country => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CityCopyWith<_City> get copyWith => throw _privateConstructorUsedError;
}
