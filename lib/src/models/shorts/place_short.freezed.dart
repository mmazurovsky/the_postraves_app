// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'place_short.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlaceShort _$PlaceShortFromJson(Map<String, dynamic> json) {
  return _PlaceShort.fromJson(json);
}

/// @nodoc
class _$PlaceShortTearOff {
  const _$PlaceShortTearOff();

  _PlaceShort call(
      {required City city,
      required String streetAddress,
      required Coordinate coordinate,
      required int id,
      required String name,
      required int overallFollowers,
      required int weeklyFollowers,
      required bool isFollowed,
      String? imageLink}) {
    return _PlaceShort(
      city: city,
      streetAddress: streetAddress,
      coordinate: coordinate,
      id: id,
      name: name,
      overallFollowers: overallFollowers,
      weeklyFollowers: weeklyFollowers,
      isFollowed: isFollowed,
      imageLink: imageLink,
    );
  }

  PlaceShort fromJson(Map<String, Object> json) {
    return PlaceShort.fromJson(json);
  }
}

/// @nodoc
const $PlaceShort = _$PlaceShortTearOff();

/// @nodoc
mixin _$PlaceShort {
  City get city => throw _privateConstructorUsedError;
  String get streetAddress => throw _privateConstructorUsedError;
  Coordinate get coordinate => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get overallFollowers => throw _privateConstructorUsedError;
  int get weeklyFollowers => throw _privateConstructorUsedError;
  bool get isFollowed => throw _privateConstructorUsedError;
  String? get imageLink => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaceShortCopyWith<PlaceShort> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceShortCopyWith<$Res> {
  factory $PlaceShortCopyWith(
          PlaceShort value, $Res Function(PlaceShort) then) =
      _$PlaceShortCopyWithImpl<$Res>;
  $Res call(
      {City city,
      String streetAddress,
      Coordinate coordinate,
      int id,
      String name,
      int overallFollowers,
      int weeklyFollowers,
      bool isFollowed,
      String? imageLink});

  $CityCopyWith<$Res> get city;
  $CoordinateCopyWith<$Res> get coordinate;
}

/// @nodoc
class _$PlaceShortCopyWithImpl<$Res> implements $PlaceShortCopyWith<$Res> {
  _$PlaceShortCopyWithImpl(this._value, this._then);

  final PlaceShort _value;
  // ignore: unused_field
  final $Res Function(PlaceShort) _then;

  @override
  $Res call({
    Object? city = freezed,
    Object? streetAddress = freezed,
    Object? coordinate = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? overallFollowers = freezed,
    Object? weeklyFollowers = freezed,
    Object? isFollowed = freezed,
    Object? imageLink = freezed,
  }) {
    return _then(_value.copyWith(
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as City,
      streetAddress: streetAddress == freezed
          ? _value.streetAddress
          : streetAddress // ignore: cast_nullable_to_non_nullable
              as String,
      coordinate: coordinate == freezed
          ? _value.coordinate
          : coordinate // ignore: cast_nullable_to_non_nullable
              as Coordinate,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      overallFollowers: overallFollowers == freezed
          ? _value.overallFollowers
          : overallFollowers // ignore: cast_nullable_to_non_nullable
              as int,
      weeklyFollowers: weeklyFollowers == freezed
          ? _value.weeklyFollowers
          : weeklyFollowers // ignore: cast_nullable_to_non_nullable
              as int,
      isFollowed: isFollowed == freezed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool,
      imageLink: imageLink == freezed
          ? _value.imageLink
          : imageLink // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $CityCopyWith<$Res> get city {
    return $CityCopyWith<$Res>(_value.city, (value) {
      return _then(_value.copyWith(city: value));
    });
  }

  @override
  $CoordinateCopyWith<$Res> get coordinate {
    return $CoordinateCopyWith<$Res>(_value.coordinate, (value) {
      return _then(_value.copyWith(coordinate: value));
    });
  }
}

/// @nodoc
abstract class _$PlaceShortCopyWith<$Res> implements $PlaceShortCopyWith<$Res> {
  factory _$PlaceShortCopyWith(
          _PlaceShort value, $Res Function(_PlaceShort) then) =
      __$PlaceShortCopyWithImpl<$Res>;
  @override
  $Res call(
      {City city,
      String streetAddress,
      Coordinate coordinate,
      int id,
      String name,
      int overallFollowers,
      int weeklyFollowers,
      bool isFollowed,
      String? imageLink});

  @override
  $CityCopyWith<$Res> get city;
  @override
  $CoordinateCopyWith<$Res> get coordinate;
}

/// @nodoc
class __$PlaceShortCopyWithImpl<$Res> extends _$PlaceShortCopyWithImpl<$Res>
    implements _$PlaceShortCopyWith<$Res> {
  __$PlaceShortCopyWithImpl(
      _PlaceShort _value, $Res Function(_PlaceShort) _then)
      : super(_value, (v) => _then(v as _PlaceShort));

  @override
  _PlaceShort get _value => super._value as _PlaceShort;

  @override
  $Res call({
    Object? city = freezed,
    Object? streetAddress = freezed,
    Object? coordinate = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? overallFollowers = freezed,
    Object? weeklyFollowers = freezed,
    Object? isFollowed = freezed,
    Object? imageLink = freezed,
  }) {
    return _then(_PlaceShort(
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as City,
      streetAddress: streetAddress == freezed
          ? _value.streetAddress
          : streetAddress // ignore: cast_nullable_to_non_nullable
              as String,
      coordinate: coordinate == freezed
          ? _value.coordinate
          : coordinate // ignore: cast_nullable_to_non_nullable
              as Coordinate,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      overallFollowers: overallFollowers == freezed
          ? _value.overallFollowers
          : overallFollowers // ignore: cast_nullable_to_non_nullable
              as int,
      weeklyFollowers: weeklyFollowers == freezed
          ? _value.weeklyFollowers
          : weeklyFollowers // ignore: cast_nullable_to_non_nullable
              as int,
      isFollowed: isFollowed == freezed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool,
      imageLink: imageLink == freezed
          ? _value.imageLink
          : imageLink // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlaceShort extends _PlaceShort {
  const _$_PlaceShort(
      {required this.city,
      required this.streetAddress,
      required this.coordinate,
      required this.id,
      required this.name,
      required this.overallFollowers,
      required this.weeklyFollowers,
      required this.isFollowed,
      this.imageLink})
      : super._();

  factory _$_PlaceShort.fromJson(Map<String, dynamic> json) =>
      _$_$_PlaceShortFromJson(json);

  @override
  final City city;
  @override
  final String streetAddress;
  @override
  final Coordinate coordinate;
  @override
  final int id;
  @override
  final String name;
  @override
  final int overallFollowers;
  @override
  final int weeklyFollowers;
  @override
  final bool isFollowed;
  @override
  final String? imageLink;

  @override
  String toString() {
    return 'PlaceShort(city: $city, streetAddress: $streetAddress, coordinate: $coordinate, id: $id, name: $name, overallFollowers: $overallFollowers, weeklyFollowers: $weeklyFollowers, isFollowed: $isFollowed, imageLink: $imageLink)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PlaceShort &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.streetAddress, streetAddress) ||
                const DeepCollectionEquality()
                    .equals(other.streetAddress, streetAddress)) &&
            (identical(other.coordinate, coordinate) ||
                const DeepCollectionEquality()
                    .equals(other.coordinate, coordinate)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.overallFollowers, overallFollowers) ||
                const DeepCollectionEquality()
                    .equals(other.overallFollowers, overallFollowers)) &&
            (identical(other.weeklyFollowers, weeklyFollowers) ||
                const DeepCollectionEquality()
                    .equals(other.weeklyFollowers, weeklyFollowers)) &&
            (identical(other.isFollowed, isFollowed) ||
                const DeepCollectionEquality()
                    .equals(other.isFollowed, isFollowed)) &&
            (identical(other.imageLink, imageLink) ||
                const DeepCollectionEquality()
                    .equals(other.imageLink, imageLink)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(streetAddress) ^
      const DeepCollectionEquality().hash(coordinate) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(overallFollowers) ^
      const DeepCollectionEquality().hash(weeklyFollowers) ^
      const DeepCollectionEquality().hash(isFollowed) ^
      const DeepCollectionEquality().hash(imageLink);

  @JsonKey(ignore: true)
  @override
  _$PlaceShortCopyWith<_PlaceShort> get copyWith =>
      __$PlaceShortCopyWithImpl<_PlaceShort>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PlaceShortToJson(this);
  }
}

abstract class _PlaceShort extends PlaceShort {
  const factory _PlaceShort(
      {required City city,
      required String streetAddress,
      required Coordinate coordinate,
      required int id,
      required String name,
      required int overallFollowers,
      required int weeklyFollowers,
      required bool isFollowed,
      String? imageLink}) = _$_PlaceShort;
  const _PlaceShort._() : super._();

  factory _PlaceShort.fromJson(Map<String, dynamic> json) =
      _$_PlaceShort.fromJson;

  @override
  City get city => throw _privateConstructorUsedError;
  @override
  String get streetAddress => throw _privateConstructorUsedError;
  @override
  Coordinate get coordinate => throw _privateConstructorUsedError;
  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  int get overallFollowers => throw _privateConstructorUsedError;
  @override
  int get weeklyFollowers => throw _privateConstructorUsedError;
  @override
  bool get isFollowed => throw _privateConstructorUsedError;
  @override
  String? get imageLink => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PlaceShortCopyWith<_PlaceShort> get copyWith =>
      throw _privateConstructorUsedError;
}
