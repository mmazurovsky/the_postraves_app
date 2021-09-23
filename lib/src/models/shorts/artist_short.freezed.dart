// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'artist_short.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ArtistShort _$ArtistShortFromJson(Map<String, dynamic> json) {
  return _ArtistShort.fromJson(json);
}

/// @nodoc
class _$ArtistShortTearOff {
  const _$ArtistShortTearOff();

  _ArtistShort call(
      {required int id,
      required String name,
      required int overallFollowers,
      required int weeklyFollowers,
      required bool isFollowed,
      String? imageLink,
      Country? country = null}) {
    return _ArtistShort(
      id: id,
      name: name,
      overallFollowers: overallFollowers,
      weeklyFollowers: weeklyFollowers,
      isFollowed: isFollowed,
      imageLink: imageLink,
      country: country,
    );
  }

  ArtistShort fromJson(Map<String, Object> json) {
    return ArtistShort.fromJson(json);
  }
}

/// @nodoc
const $ArtistShort = _$ArtistShortTearOff();

/// @nodoc
mixin _$ArtistShort {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get overallFollowers => throw _privateConstructorUsedError;
  int get weeklyFollowers => throw _privateConstructorUsedError;
  bool get isFollowed => throw _privateConstructorUsedError;
  String? get imageLink => throw _privateConstructorUsedError;
  Country? get country => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtistShortCopyWith<ArtistShort> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistShortCopyWith<$Res> {
  factory $ArtistShortCopyWith(
          ArtistShort value, $Res Function(ArtistShort) then) =
      _$ArtistShortCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      int overallFollowers,
      int weeklyFollowers,
      bool isFollowed,
      String? imageLink,
      Country? country});

  $CountryCopyWith<$Res>? get country;
}

/// @nodoc
class _$ArtistShortCopyWithImpl<$Res> implements $ArtistShortCopyWith<$Res> {
  _$ArtistShortCopyWithImpl(this._value, this._then);

  final ArtistShort _value;
  // ignore: unused_field
  final $Res Function(ArtistShort) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? overallFollowers = freezed,
    Object? weeklyFollowers = freezed,
    Object? isFollowed = freezed,
    Object? imageLink = freezed,
    Object? country = freezed,
  }) {
    return _then(_value.copyWith(
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
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country?,
    ));
  }

  @override
  $CountryCopyWith<$Res>? get country {
    if (_value.country == null) {
      return null;
    }

    return $CountryCopyWith<$Res>(_value.country!, (value) {
      return _then(_value.copyWith(country: value));
    });
  }
}

/// @nodoc
abstract class _$ArtistShortCopyWith<$Res>
    implements $ArtistShortCopyWith<$Res> {
  factory _$ArtistShortCopyWith(
          _ArtistShort value, $Res Function(_ArtistShort) then) =
      __$ArtistShortCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      int overallFollowers,
      int weeklyFollowers,
      bool isFollowed,
      String? imageLink,
      Country? country});

  @override
  $CountryCopyWith<$Res>? get country;
}

/// @nodoc
class __$ArtistShortCopyWithImpl<$Res> extends _$ArtistShortCopyWithImpl<$Res>
    implements _$ArtistShortCopyWith<$Res> {
  __$ArtistShortCopyWithImpl(
      _ArtistShort _value, $Res Function(_ArtistShort) _then)
      : super(_value, (v) => _then(v as _ArtistShort));

  @override
  _ArtistShort get _value => super._value as _ArtistShort;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? overallFollowers = freezed,
    Object? weeklyFollowers = freezed,
    Object? isFollowed = freezed,
    Object? imageLink = freezed,
    Object? country = freezed,
  }) {
    return _then(_ArtistShort(
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
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ArtistShort extends _ArtistShort {
  const _$_ArtistShort(
      {required this.id,
      required this.name,
      required this.overallFollowers,
      required this.weeklyFollowers,
      required this.isFollowed,
      this.imageLink,
      this.country = null})
      : super._();

  factory _$_ArtistShort.fromJson(Map<String, dynamic> json) =>
      _$_$_ArtistShortFromJson(json);

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
  @JsonKey(defaultValue: null)
  @override
  final Country? country;

  @override
  String toString() {
    return 'ArtistShort(id: $id, name: $name, overallFollowers: $overallFollowers, weeklyFollowers: $weeklyFollowers, isFollowed: $isFollowed, imageLink: $imageLink, country: $country)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ArtistShort &&
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
            (identical(other.country, country) ||
                const DeepCollectionEquality().equals(other.country, country)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(overallFollowers) ^
      const DeepCollectionEquality().hash(weeklyFollowers) ^
      const DeepCollectionEquality().hash(isFollowed) ^
      const DeepCollectionEquality().hash(imageLink) ^
      const DeepCollectionEquality().hash(country);

  @JsonKey(ignore: true)
  @override
  _$ArtistShortCopyWith<_ArtistShort> get copyWith =>
      __$ArtistShortCopyWithImpl<_ArtistShort>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ArtistShortToJson(this);
  }
}

abstract class _ArtistShort extends ArtistShort {
  const factory _ArtistShort(
      {required int id,
      required String name,
      required int overallFollowers,
      required int weeklyFollowers,
      required bool isFollowed,
      String? imageLink,
      Country? country}) = _$_ArtistShort;
  const _ArtistShort._() : super._();

  factory _ArtistShort.fromJson(Map<String, dynamic> json) =
      _$_ArtistShort.fromJson;

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
  Country? get country => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ArtistShortCopyWith<_ArtistShort> get copyWith =>
      throw _privateConstructorUsedError;
}
