// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'country.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Country _$CountryFromJson(Map<String, dynamic> json) {
  return _Country.fromJson(json);
}

/// @nodoc
class _$CountryTearOff {
  const _$CountryTearOff();

  _Country call(
      {required String name,
      required String localizedName,
      required String phoneCode,
      required String emojiCode}) {
    return _Country(
      name: name,
      localizedName: localizedName,
      phoneCode: phoneCode,
      emojiCode: emojiCode,
    );
  }

  Country fromJson(Map<String, Object> json) {
    return Country.fromJson(json);
  }
}

/// @nodoc
const $Country = _$CountryTearOff();

/// @nodoc
mixin _$Country {
  String get name => throw _privateConstructorUsedError;
  String get localizedName => throw _privateConstructorUsedError;
  String get phoneCode => throw _privateConstructorUsedError;
  String get emojiCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryCopyWith<Country> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryCopyWith<$Res> {
  factory $CountryCopyWith(Country value, $Res Function(Country) then) =
      _$CountryCopyWithImpl<$Res>;
  $Res call(
      {String name, String localizedName, String phoneCode, String emojiCode});
}

/// @nodoc
class _$CountryCopyWithImpl<$Res> implements $CountryCopyWith<$Res> {
  _$CountryCopyWithImpl(this._value, this._then);

  final Country _value;
  // ignore: unused_field
  final $Res Function(Country) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? localizedName = freezed,
    Object? phoneCode = freezed,
    Object? emojiCode = freezed,
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
      phoneCode: phoneCode == freezed
          ? _value.phoneCode
          : phoneCode // ignore: cast_nullable_to_non_nullable
              as String,
      emojiCode: emojiCode == freezed
          ? _value.emojiCode
          : emojiCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CountryCopyWith<$Res> implements $CountryCopyWith<$Res> {
  factory _$CountryCopyWith(_Country value, $Res Function(_Country) then) =
      __$CountryCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name, String localizedName, String phoneCode, String emojiCode});
}

/// @nodoc
class __$CountryCopyWithImpl<$Res> extends _$CountryCopyWithImpl<$Res>
    implements _$CountryCopyWith<$Res> {
  __$CountryCopyWithImpl(_Country _value, $Res Function(_Country) _then)
      : super(_value, (v) => _then(v as _Country));

  @override
  _Country get _value => super._value as _Country;

  @override
  $Res call({
    Object? name = freezed,
    Object? localizedName = freezed,
    Object? phoneCode = freezed,
    Object? emojiCode = freezed,
  }) {
    return _then(_Country(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      localizedName: localizedName == freezed
          ? _value.localizedName
          : localizedName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneCode: phoneCode == freezed
          ? _value.phoneCode
          : phoneCode // ignore: cast_nullable_to_non_nullable
              as String,
      emojiCode: emojiCode == freezed
          ? _value.emojiCode
          : emojiCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Country extends _Country {
  const _$_Country(
      {required this.name,
      required this.localizedName,
      required this.phoneCode,
      required this.emojiCode})
      : super._();

  factory _$_Country.fromJson(Map<String, dynamic> json) =>
      _$_$_CountryFromJson(json);

  @override
  final String name;
  @override
  final String localizedName;
  @override
  final String phoneCode;
  @override
  final String emojiCode;

  @override
  String toString() {
    return 'Country(name: $name, localizedName: $localizedName, phoneCode: $phoneCode, emojiCode: $emojiCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Country &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.localizedName, localizedName) ||
                const DeepCollectionEquality()
                    .equals(other.localizedName, localizedName)) &&
            (identical(other.phoneCode, phoneCode) ||
                const DeepCollectionEquality()
                    .equals(other.phoneCode, phoneCode)) &&
            (identical(other.emojiCode, emojiCode) ||
                const DeepCollectionEquality()
                    .equals(other.emojiCode, emojiCode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(localizedName) ^
      const DeepCollectionEquality().hash(phoneCode) ^
      const DeepCollectionEquality().hash(emojiCode);

  @JsonKey(ignore: true)
  @override
  _$CountryCopyWith<_Country> get copyWith =>
      __$CountryCopyWithImpl<_Country>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CountryToJson(this);
  }
}

abstract class _Country extends Country {
  const factory _Country(
      {required String name,
      required String localizedName,
      required String phoneCode,
      required String emojiCode}) = _$_Country;
  const _Country._() : super._();

  factory _Country.fromJson(Map<String, dynamic> json) = _$_Country.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get localizedName => throw _privateConstructorUsedError;
  @override
  String get phoneCode => throw _privateConstructorUsedError;
  @override
  String get emojiCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CountryCopyWith<_Country> get copyWith =>
      throw _privateConstructorUsedError;
}
