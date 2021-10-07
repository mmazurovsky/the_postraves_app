// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'place_full.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlaceFull _$PlaceFullFromJson(Map<String, dynamic> json) {
  return _PlaceFull.fromJson(json);
}

/// @nodoc
class _$PlaceFullTearOff {
  const _$PlaceFullTearOff();

  _PlaceFull call(
      {String? about,
      String? instagramUsername,
      String? soundcloudUsername,
      required int id,
      required String name,
      required int overallFollowers,
      required int weeklyFollowers,
      required bool isFollowed,
      String? imageLink,
      required City city,
      required String streetAddress,
      required Coordinate coordinate}) {
    return _PlaceFull(
      about: about,
      instagramUsername: instagramUsername,
      soundcloudUsername: soundcloudUsername,
      id: id,
      name: name,
      overallFollowers: overallFollowers,
      weeklyFollowers: weeklyFollowers,
      isFollowed: isFollowed,
      imageLink: imageLink,
      city: city,
      streetAddress: streetAddress,
      coordinate: coordinate,
    );
  }

  PlaceFull fromJson(Map<String, Object> json) {
    return PlaceFull.fromJson(json);
  }
}

/// @nodoc
const $PlaceFull = _$PlaceFullTearOff();

/// @nodoc
mixin _$PlaceFull {
  String? get about => throw _privateConstructorUsedError;
  String? get instagramUsername => throw _privateConstructorUsedError;
  String? get soundcloudUsername => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get overallFollowers => throw _privateConstructorUsedError;
  int get weeklyFollowers => throw _privateConstructorUsedError;
  bool get isFollowed => throw _privateConstructorUsedError;
  String? get imageLink => throw _privateConstructorUsedError;
  City get city => throw _privateConstructorUsedError;
  String get streetAddress => throw _privateConstructorUsedError;
  Coordinate get coordinate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaceFullCopyWith<PlaceFull> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceFullCopyWith<$Res> {
  factory $PlaceFullCopyWith(PlaceFull value, $Res Function(PlaceFull) then) =
      _$PlaceFullCopyWithImpl<$Res>;
  $Res call(
      {String? about,
      String? instagramUsername,
      String? soundcloudUsername,
      int id,
      String name,
      int overallFollowers,
      int weeklyFollowers,
      bool isFollowed,
      String? imageLink,
      City city,
      String streetAddress,
      Coordinate coordinate});

  $CityCopyWith<$Res> get city;
  $CoordinateCopyWith<$Res> get coordinate;
}

/// @nodoc
class _$PlaceFullCopyWithImpl<$Res> implements $PlaceFullCopyWith<$Res> {
  _$PlaceFullCopyWithImpl(this._value, this._then);

  final PlaceFull _value;
  // ignore: unused_field
  final $Res Function(PlaceFull) _then;

  @override
  $Res call({
    Object? about = freezed,
    Object? instagramUsername = freezed,
    Object? soundcloudUsername = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? overallFollowers = freezed,
    Object? weeklyFollowers = freezed,
    Object? isFollowed = freezed,
    Object? imageLink = freezed,
    Object? city = freezed,
    Object? streetAddress = freezed,
    Object? coordinate = freezed,
  }) {
    return _then(_value.copyWith(
      about: about == freezed
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      instagramUsername: instagramUsername == freezed
          ? _value.instagramUsername
          : instagramUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      soundcloudUsername: soundcloudUsername == freezed
          ? _value.soundcloudUsername
          : soundcloudUsername // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$PlaceFullCopyWith<$Res> implements $PlaceFullCopyWith<$Res> {
  factory _$PlaceFullCopyWith(
          _PlaceFull value, $Res Function(_PlaceFull) then) =
      __$PlaceFullCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? about,
      String? instagramUsername,
      String? soundcloudUsername,
      int id,
      String name,
      int overallFollowers,
      int weeklyFollowers,
      bool isFollowed,
      String? imageLink,
      City city,
      String streetAddress,
      Coordinate coordinate});

  @override
  $CityCopyWith<$Res> get city;
  @override
  $CoordinateCopyWith<$Res> get coordinate;
}

/// @nodoc
class __$PlaceFullCopyWithImpl<$Res> extends _$PlaceFullCopyWithImpl<$Res>
    implements _$PlaceFullCopyWith<$Res> {
  __$PlaceFullCopyWithImpl(_PlaceFull _value, $Res Function(_PlaceFull) _then)
      : super(_value, (v) => _then(v as _PlaceFull));

  @override
  _PlaceFull get _value => super._value as _PlaceFull;

  @override
  $Res call({
    Object? about = freezed,
    Object? instagramUsername = freezed,
    Object? soundcloudUsername = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? overallFollowers = freezed,
    Object? weeklyFollowers = freezed,
    Object? isFollowed = freezed,
    Object? imageLink = freezed,
    Object? city = freezed,
    Object? streetAddress = freezed,
    Object? coordinate = freezed,
  }) {
    return _then(_PlaceFull(
      about: about == freezed
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      instagramUsername: instagramUsername == freezed
          ? _value.instagramUsername
          : instagramUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      soundcloudUsername: soundcloudUsername == freezed
          ? _value.soundcloudUsername
          : soundcloudUsername // ignore: cast_nullable_to_non_nullable
              as String?,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlaceFull extends _PlaceFull {
  const _$_PlaceFull(
      {this.about,
      this.instagramUsername,
      this.soundcloudUsername,
      required this.id,
      required this.name,
      required this.overallFollowers,
      required this.weeklyFollowers,
      required this.isFollowed,
      this.imageLink,
      required this.city,
      required this.streetAddress,
      required this.coordinate})
      : super._();

  factory _$_PlaceFull.fromJson(Map<String, dynamic> json) =>
      _$_$_PlaceFullFromJson(json);

  @override
  final String? about;
  @override
  final String? instagramUsername;
  @override
  final String? soundcloudUsername;
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
  final City city;
  @override
  final String streetAddress;
  @override
  final Coordinate coordinate;

  @override
  String toString() {
    return 'PlaceFull(about: $about, instagramUsername: $instagramUsername, soundcloudUsername: $soundcloudUsername, id: $id, name: $name, overallFollowers: $overallFollowers, weeklyFollowers: $weeklyFollowers, isFollowed: $isFollowed, imageLink: $imageLink, city: $city, streetAddress: $streetAddress, coordinate: $coordinate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PlaceFull &&
            (identical(other.about, about) ||
                const DeepCollectionEquality().equals(other.about, about)) &&
            (identical(other.instagramUsername, instagramUsername) ||
                const DeepCollectionEquality()
                    .equals(other.instagramUsername, instagramUsername)) &&
            (identical(other.soundcloudUsername, soundcloudUsername) ||
                const DeepCollectionEquality()
                    .equals(other.soundcloudUsername, soundcloudUsername)) &&
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
                    .equals(other.imageLink, imageLink)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.streetAddress, streetAddress) ||
                const DeepCollectionEquality()
                    .equals(other.streetAddress, streetAddress)) &&
            (identical(other.coordinate, coordinate) ||
                const DeepCollectionEquality()
                    .equals(other.coordinate, coordinate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(about) ^
      const DeepCollectionEquality().hash(instagramUsername) ^
      const DeepCollectionEquality().hash(soundcloudUsername) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(overallFollowers) ^
      const DeepCollectionEquality().hash(weeklyFollowers) ^
      const DeepCollectionEquality().hash(isFollowed) ^
      const DeepCollectionEquality().hash(imageLink) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(streetAddress) ^
      const DeepCollectionEquality().hash(coordinate);

  @JsonKey(ignore: true)
  @override
  _$PlaceFullCopyWith<_PlaceFull> get copyWith =>
      __$PlaceFullCopyWithImpl<_PlaceFull>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PlaceFullToJson(this);
  }
}

abstract class _PlaceFull extends PlaceFull {
  const factory _PlaceFull(
      {String? about,
      String? instagramUsername,
      String? soundcloudUsername,
      required int id,
      required String name,
      required int overallFollowers,
      required int weeklyFollowers,
      required bool isFollowed,
      String? imageLink,
      required City city,
      required String streetAddress,
      required Coordinate coordinate}) = _$_PlaceFull;
  const _PlaceFull._() : super._();

  factory _PlaceFull.fromJson(Map<String, dynamic> json) =
      _$_PlaceFull.fromJson;

  @override
  String? get about => throw _privateConstructorUsedError;
  @override
  String? get instagramUsername => throw _privateConstructorUsedError;
  @override
  String? get soundcloudUsername => throw _privateConstructorUsedError;
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
  City get city => throw _privateConstructorUsedError;
  @override
  String get streetAddress => throw _privateConstructorUsedError;
  @override
  Coordinate get coordinate => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PlaceFullCopyWith<_PlaceFull> get copyWith =>
      throw _privateConstructorUsedError;
}
