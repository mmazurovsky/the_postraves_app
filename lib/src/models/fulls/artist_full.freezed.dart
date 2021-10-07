// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'artist_full.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ArtistFull _$ArtistFullFromJson(Map<String, dynamic> json) {
  return _ArtistFull.fromJson(json);
}

/// @nodoc
class _$ArtistFullTearOff {
  const _$ArtistFullTearOff();

  _ArtistFull call(
      {required int id,
      required String name,
      required int overallFollowers,
      required int weeklyFollowers,
      required bool isFollowed,
      String? imageLink,
      Country? country,
      String? about,
      String? soundcloudUsername,
      String? instagramUsername}) {
    return _ArtistFull(
      id: id,
      name: name,
      overallFollowers: overallFollowers,
      weeklyFollowers: weeklyFollowers,
      isFollowed: isFollowed,
      imageLink: imageLink,
      country: country,
      about: about,
      soundcloudUsername: soundcloudUsername,
      instagramUsername: instagramUsername,
    );
  }

  ArtistFull fromJson(Map<String, Object> json) {
    return ArtistFull.fromJson(json);
  }
}

/// @nodoc
const $ArtistFull = _$ArtistFullTearOff();

/// @nodoc
mixin _$ArtistFull {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get overallFollowers => throw _privateConstructorUsedError;
  int get weeklyFollowers => throw _privateConstructorUsedError;
  bool get isFollowed => throw _privateConstructorUsedError;
  String? get imageLink => throw _privateConstructorUsedError;
  Country? get country => throw _privateConstructorUsedError;
  String? get about => throw _privateConstructorUsedError;
  String? get soundcloudUsername => throw _privateConstructorUsedError;
  String? get instagramUsername => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtistFullCopyWith<ArtistFull> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistFullCopyWith<$Res> {
  factory $ArtistFullCopyWith(
          ArtistFull value, $Res Function(ArtistFull) then) =
      _$ArtistFullCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      int overallFollowers,
      int weeklyFollowers,
      bool isFollowed,
      String? imageLink,
      Country? country,
      String? about,
      String? soundcloudUsername,
      String? instagramUsername});

  $CountryCopyWith<$Res>? get country;
}

/// @nodoc
class _$ArtistFullCopyWithImpl<$Res> implements $ArtistFullCopyWith<$Res> {
  _$ArtistFullCopyWithImpl(this._value, this._then);

  final ArtistFull _value;
  // ignore: unused_field
  final $Res Function(ArtistFull) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? overallFollowers = freezed,
    Object? weeklyFollowers = freezed,
    Object? isFollowed = freezed,
    Object? imageLink = freezed,
    Object? country = freezed,
    Object? about = freezed,
    Object? soundcloudUsername = freezed,
    Object? instagramUsername = freezed,
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
      about: about == freezed
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      soundcloudUsername: soundcloudUsername == freezed
          ? _value.soundcloudUsername
          : soundcloudUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      instagramUsername: instagramUsername == freezed
          ? _value.instagramUsername
          : instagramUsername // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$ArtistFullCopyWith<$Res> implements $ArtistFullCopyWith<$Res> {
  factory _$ArtistFullCopyWith(
          _ArtistFull value, $Res Function(_ArtistFull) then) =
      __$ArtistFullCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      int overallFollowers,
      int weeklyFollowers,
      bool isFollowed,
      String? imageLink,
      Country? country,
      String? about,
      String? soundcloudUsername,
      String? instagramUsername});

  @override
  $CountryCopyWith<$Res>? get country;
}

/// @nodoc
class __$ArtistFullCopyWithImpl<$Res> extends _$ArtistFullCopyWithImpl<$Res>
    implements _$ArtistFullCopyWith<$Res> {
  __$ArtistFullCopyWithImpl(
      _ArtistFull _value, $Res Function(_ArtistFull) _then)
      : super(_value, (v) => _then(v as _ArtistFull));

  @override
  _ArtistFull get _value => super._value as _ArtistFull;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? overallFollowers = freezed,
    Object? weeklyFollowers = freezed,
    Object? isFollowed = freezed,
    Object? imageLink = freezed,
    Object? country = freezed,
    Object? about = freezed,
    Object? soundcloudUsername = freezed,
    Object? instagramUsername = freezed,
  }) {
    return _then(_ArtistFull(
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
      about: about == freezed
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      soundcloudUsername: soundcloudUsername == freezed
          ? _value.soundcloudUsername
          : soundcloudUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      instagramUsername: instagramUsername == freezed
          ? _value.instagramUsername
          : instagramUsername // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ArtistFull extends _ArtistFull {
  const _$_ArtistFull(
      {required this.id,
      required this.name,
      required this.overallFollowers,
      required this.weeklyFollowers,
      required this.isFollowed,
      this.imageLink,
      this.country,
      this.about,
      this.soundcloudUsername,
      this.instagramUsername})
      : super._();

  factory _$_ArtistFull.fromJson(Map<String, dynamic> json) =>
      _$_$_ArtistFullFromJson(json);

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
  final Country? country;
  @override
  final String? about;
  @override
  final String? soundcloudUsername;
  @override
  final String? instagramUsername;

  @override
  String toString() {
    return 'ArtistFull(id: $id, name: $name, overallFollowers: $overallFollowers, weeklyFollowers: $weeklyFollowers, isFollowed: $isFollowed, imageLink: $imageLink, country: $country, about: $about, soundcloudUsername: $soundcloudUsername, instagramUsername: $instagramUsername)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ArtistFull &&
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
                const DeepCollectionEquality()
                    .equals(other.country, country)) &&
            (identical(other.about, about) ||
                const DeepCollectionEquality().equals(other.about, about)) &&
            (identical(other.soundcloudUsername, soundcloudUsername) ||
                const DeepCollectionEquality()
                    .equals(other.soundcloudUsername, soundcloudUsername)) &&
            (identical(other.instagramUsername, instagramUsername) ||
                const DeepCollectionEquality()
                    .equals(other.instagramUsername, instagramUsername)));
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
      const DeepCollectionEquality().hash(country) ^
      const DeepCollectionEquality().hash(about) ^
      const DeepCollectionEquality().hash(soundcloudUsername) ^
      const DeepCollectionEquality().hash(instagramUsername);

  @JsonKey(ignore: true)
  @override
  _$ArtistFullCopyWith<_ArtistFull> get copyWith =>
      __$ArtistFullCopyWithImpl<_ArtistFull>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ArtistFullToJson(this);
  }
}

abstract class _ArtistFull extends ArtistFull {
  const factory _ArtistFull(
      {required int id,
      required String name,
      required int overallFollowers,
      required int weeklyFollowers,
      required bool isFollowed,
      String? imageLink,
      Country? country,
      String? about,
      String? soundcloudUsername,
      String? instagramUsername}) = _$_ArtistFull;
  const _ArtistFull._() : super._();

  factory _ArtistFull.fromJson(Map<String, dynamic> json) =
      _$_ArtistFull.fromJson;

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
  String? get about => throw _privateConstructorUsedError;
  @override
  String? get soundcloudUsername => throw _privateConstructorUsedError;
  @override
  String? get instagramUsername => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ArtistFullCopyWith<_ArtistFull> get copyWith =>
      throw _privateConstructorUsedError;
}
