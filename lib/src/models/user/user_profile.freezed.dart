// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
class _$UserProfileTearOff {
  const _$UserProfileTearOff();

  _UserProfile call(
      {required int id,
      required String name,
      required City currentCity,
      required int overallFollowers,
      required int weeklyFollowers,
      String? about,
      String? imageLink,
      String? instagramLink,
      String? telegramLink}) {
    return _UserProfile(
      id: id,
      name: name,
      currentCity: currentCity,
      overallFollowers: overallFollowers,
      weeklyFollowers: weeklyFollowers,
      about: about,
      imageLink: imageLink,
      instagramLink: instagramLink,
      telegramLink: telegramLink,
    );
  }

  UserProfile fromJson(Map<String, Object> json) {
    return UserProfile.fromJson(json);
  }
}

/// @nodoc
const $UserProfile = _$UserProfileTearOff();

/// @nodoc
mixin _$UserProfile {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  City get currentCity => throw _privateConstructorUsedError;
  int get overallFollowers => throw _privateConstructorUsedError;
  int get weeklyFollowers => throw _privateConstructorUsedError;
  String? get about => throw _privateConstructorUsedError;
  String? get imageLink => throw _privateConstructorUsedError;
  String? get instagramLink => throw _privateConstructorUsedError;
  String? get telegramLink => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) then) =
      _$UserProfileCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      City currentCity,
      int overallFollowers,
      int weeklyFollowers,
      String? about,
      String? imageLink,
      String? instagramLink,
      String? telegramLink});

  $CityCopyWith<$Res> get currentCity;
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res> implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  final UserProfile _value;
  // ignore: unused_field
  final $Res Function(UserProfile) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? currentCity = freezed,
    Object? overallFollowers = freezed,
    Object? weeklyFollowers = freezed,
    Object? about = freezed,
    Object? imageLink = freezed,
    Object? instagramLink = freezed,
    Object? telegramLink = freezed,
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
      currentCity: currentCity == freezed
          ? _value.currentCity
          : currentCity // ignore: cast_nullable_to_non_nullable
              as City,
      overallFollowers: overallFollowers == freezed
          ? _value.overallFollowers
          : overallFollowers // ignore: cast_nullable_to_non_nullable
              as int,
      weeklyFollowers: weeklyFollowers == freezed
          ? _value.weeklyFollowers
          : weeklyFollowers // ignore: cast_nullable_to_non_nullable
              as int,
      about: about == freezed
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      imageLink: imageLink == freezed
          ? _value.imageLink
          : imageLink // ignore: cast_nullable_to_non_nullable
              as String?,
      instagramLink: instagramLink == freezed
          ? _value.instagramLink
          : instagramLink // ignore: cast_nullable_to_non_nullable
              as String?,
      telegramLink: telegramLink == freezed
          ? _value.telegramLink
          : telegramLink // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $CityCopyWith<$Res> get currentCity {
    return $CityCopyWith<$Res>(_value.currentCity, (value) {
      return _then(_value.copyWith(currentCity: value));
    });
  }
}

/// @nodoc
abstract class _$UserProfileCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(
          _UserProfile value, $Res Function(_UserProfile) then) =
      __$UserProfileCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      City currentCity,
      int overallFollowers,
      int weeklyFollowers,
      String? about,
      String? imageLink,
      String? instagramLink,
      String? telegramLink});

  @override
  $CityCopyWith<$Res> get currentCity;
}

/// @nodoc
class __$UserProfileCopyWithImpl<$Res> extends _$UserProfileCopyWithImpl<$Res>
    implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(
      _UserProfile _value, $Res Function(_UserProfile) _then)
      : super(_value, (v) => _then(v as _UserProfile));

  @override
  _UserProfile get _value => super._value as _UserProfile;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? currentCity = freezed,
    Object? overallFollowers = freezed,
    Object? weeklyFollowers = freezed,
    Object? about = freezed,
    Object? imageLink = freezed,
    Object? instagramLink = freezed,
    Object? telegramLink = freezed,
  }) {
    return _then(_UserProfile(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      currentCity: currentCity == freezed
          ? _value.currentCity
          : currentCity // ignore: cast_nullable_to_non_nullable
              as City,
      overallFollowers: overallFollowers == freezed
          ? _value.overallFollowers
          : overallFollowers // ignore: cast_nullable_to_non_nullable
              as int,
      weeklyFollowers: weeklyFollowers == freezed
          ? _value.weeklyFollowers
          : weeklyFollowers // ignore: cast_nullable_to_non_nullable
              as int,
      about: about == freezed
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      imageLink: imageLink == freezed
          ? _value.imageLink
          : imageLink // ignore: cast_nullable_to_non_nullable
              as String?,
      instagramLink: instagramLink == freezed
          ? _value.instagramLink
          : instagramLink // ignore: cast_nullable_to_non_nullable
              as String?,
      telegramLink: telegramLink == freezed
          ? _value.telegramLink
          : telegramLink // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserProfile extends _UserProfile {
  const _$_UserProfile(
      {required this.id,
      required this.name,
      required this.currentCity,
      required this.overallFollowers,
      required this.weeklyFollowers,
      this.about,
      this.imageLink,
      this.instagramLink,
      this.telegramLink})
      : super._();

  factory _$_UserProfile.fromJson(Map<String, dynamic> json) =>
      _$_$_UserProfileFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final City currentCity;
  @override
  final int overallFollowers;
  @override
  final int weeklyFollowers;
  @override
  final String? about;
  @override
  final String? imageLink;
  @override
  final String? instagramLink;
  @override
  final String? telegramLink;

  @override
  String toString() {
    return 'UserProfile(id: $id, name: $name, currentCity: $currentCity, overallFollowers: $overallFollowers, weeklyFollowers: $weeklyFollowers, about: $about, imageLink: $imageLink, instagramLink: $instagramLink, telegramLink: $telegramLink)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserProfile &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.currentCity, currentCity) ||
                const DeepCollectionEquality()
                    .equals(other.currentCity, currentCity)) &&
            (identical(other.overallFollowers, overallFollowers) ||
                const DeepCollectionEquality()
                    .equals(other.overallFollowers, overallFollowers)) &&
            (identical(other.weeklyFollowers, weeklyFollowers) ||
                const DeepCollectionEquality()
                    .equals(other.weeklyFollowers, weeklyFollowers)) &&
            (identical(other.about, about) ||
                const DeepCollectionEquality().equals(other.about, about)) &&
            (identical(other.imageLink, imageLink) ||
                const DeepCollectionEquality()
                    .equals(other.imageLink, imageLink)) &&
            (identical(other.instagramLink, instagramLink) ||
                const DeepCollectionEquality()
                    .equals(other.instagramLink, instagramLink)) &&
            (identical(other.telegramLink, telegramLink) ||
                const DeepCollectionEquality()
                    .equals(other.telegramLink, telegramLink)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(currentCity) ^
      const DeepCollectionEquality().hash(overallFollowers) ^
      const DeepCollectionEquality().hash(weeklyFollowers) ^
      const DeepCollectionEquality().hash(about) ^
      const DeepCollectionEquality().hash(imageLink) ^
      const DeepCollectionEquality().hash(instagramLink) ^
      const DeepCollectionEquality().hash(telegramLink);

  @JsonKey(ignore: true)
  @override
  _$UserProfileCopyWith<_UserProfile> get copyWith =>
      __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserProfileToJson(this);
  }
}

abstract class _UserProfile extends UserProfile {
  const factory _UserProfile(
      {required int id,
      required String name,
      required City currentCity,
      required int overallFollowers,
      required int weeklyFollowers,
      String? about,
      String? imageLink,
      String? instagramLink,
      String? telegramLink}) = _$_UserProfile;
  const _UserProfile._() : super._();

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$_UserProfile.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  City get currentCity => throw _privateConstructorUsedError;
  @override
  int get overallFollowers => throw _privateConstructorUsedError;
  @override
  int get weeklyFollowers => throw _privateConstructorUsedError;
  @override
  String? get about => throw _privateConstructorUsedError;
  @override
  String? get imageLink => throw _privateConstructorUsedError;
  @override
  String? get instagramLink => throw _privateConstructorUsedError;
  @override
  String? get telegramLink => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserProfileCopyWith<_UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}
