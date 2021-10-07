// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user_profile_to_write.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserProfileToWrite _$UserProfileToWriteFromJson(Map<String, dynamic> json) {
  return _UserProfileToWrite.fromJson(json);
}

/// @nodoc
class _$UserProfileToWriteTearOff {
  const _$UserProfileToWriteTearOff();

  _UserProfileToWrite call(
      {required String name,
      required String currentCity,
      String? about,
      String? imageLink,
      String? instagramUsername,
      String? telegramUsername}) {
    return _UserProfileToWrite(
      name: name,
      currentCity: currentCity,
      about: about,
      imageLink: imageLink,
      instagramUsername: instagramUsername,
      telegramUsername: telegramUsername,
    );
  }

  UserProfileToWrite fromJson(Map<String, Object> json) {
    return UserProfileToWrite.fromJson(json);
  }
}

/// @nodoc
const $UserProfileToWrite = _$UserProfileToWriteTearOff();

/// @nodoc
mixin _$UserProfileToWrite {
  String get name => throw _privateConstructorUsedError;
  String get currentCity => throw _privateConstructorUsedError;
  String? get about => throw _privateConstructorUsedError;
  String? get imageLink => throw _privateConstructorUsedError;
  String? get instagramUsername => throw _privateConstructorUsedError;
  String? get telegramUsername => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileToWriteCopyWith<UserProfileToWrite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileToWriteCopyWith<$Res> {
  factory $UserProfileToWriteCopyWith(
          UserProfileToWrite value, $Res Function(UserProfileToWrite) then) =
      _$UserProfileToWriteCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String currentCity,
      String? about,
      String? imageLink,
      String? instagramUsername,
      String? telegramUsername});
}

/// @nodoc
class _$UserProfileToWriteCopyWithImpl<$Res>
    implements $UserProfileToWriteCopyWith<$Res> {
  _$UserProfileToWriteCopyWithImpl(this._value, this._then);

  final UserProfileToWrite _value;
  // ignore: unused_field
  final $Res Function(UserProfileToWrite) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? currentCity = freezed,
    Object? about = freezed,
    Object? imageLink = freezed,
    Object? instagramUsername = freezed,
    Object? telegramUsername = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      currentCity: currentCity == freezed
          ? _value.currentCity
          : currentCity // ignore: cast_nullable_to_non_nullable
              as String,
      about: about == freezed
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      imageLink: imageLink == freezed
          ? _value.imageLink
          : imageLink // ignore: cast_nullable_to_non_nullable
              as String?,
      instagramUsername: instagramUsername == freezed
          ? _value.instagramUsername
          : instagramUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      telegramUsername: telegramUsername == freezed
          ? _value.telegramUsername
          : telegramUsername // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$UserProfileToWriteCopyWith<$Res>
    implements $UserProfileToWriteCopyWith<$Res> {
  factory _$UserProfileToWriteCopyWith(
          _UserProfileToWrite value, $Res Function(_UserProfileToWrite) then) =
      __$UserProfileToWriteCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String currentCity,
      String? about,
      String? imageLink,
      String? instagramUsername,
      String? telegramUsername});
}

/// @nodoc
class __$UserProfileToWriteCopyWithImpl<$Res>
    extends _$UserProfileToWriteCopyWithImpl<$Res>
    implements _$UserProfileToWriteCopyWith<$Res> {
  __$UserProfileToWriteCopyWithImpl(
      _UserProfileToWrite _value, $Res Function(_UserProfileToWrite) _then)
      : super(_value, (v) => _then(v as _UserProfileToWrite));

  @override
  _UserProfileToWrite get _value => super._value as _UserProfileToWrite;

  @override
  $Res call({
    Object? name = freezed,
    Object? currentCity = freezed,
    Object? about = freezed,
    Object? imageLink = freezed,
    Object? instagramUsername = freezed,
    Object? telegramUsername = freezed,
  }) {
    return _then(_UserProfileToWrite(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      currentCity: currentCity == freezed
          ? _value.currentCity
          : currentCity // ignore: cast_nullable_to_non_nullable
              as String,
      about: about == freezed
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      imageLink: imageLink == freezed
          ? _value.imageLink
          : imageLink // ignore: cast_nullable_to_non_nullable
              as String?,
      instagramUsername: instagramUsername == freezed
          ? _value.instagramUsername
          : instagramUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      telegramUsername: telegramUsername == freezed
          ? _value.telegramUsername
          : telegramUsername // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserProfileToWrite implements _UserProfileToWrite {
  const _$_UserProfileToWrite(
      {required this.name,
      required this.currentCity,
      this.about,
      this.imageLink,
      this.instagramUsername,
      this.telegramUsername});

  factory _$_UserProfileToWrite.fromJson(Map<String, dynamic> json) =>
      _$_$_UserProfileToWriteFromJson(json);

  @override
  final String name;
  @override
  final String currentCity;
  @override
  final String? about;
  @override
  final String? imageLink;
  @override
  final String? instagramUsername;
  @override
  final String? telegramUsername;

  @override
  String toString() {
    return 'UserProfileToWrite(name: $name, currentCity: $currentCity, about: $about, imageLink: $imageLink, instagramUsername: $instagramUsername, telegramUsername: $telegramUsername)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserProfileToWrite &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.currentCity, currentCity) ||
                const DeepCollectionEquality()
                    .equals(other.currentCity, currentCity)) &&
            (identical(other.about, about) ||
                const DeepCollectionEquality().equals(other.about, about)) &&
            (identical(other.imageLink, imageLink) ||
                const DeepCollectionEquality()
                    .equals(other.imageLink, imageLink)) &&
            (identical(other.instagramUsername, instagramUsername) ||
                const DeepCollectionEquality()
                    .equals(other.instagramUsername, instagramUsername)) &&
            (identical(other.telegramUsername, telegramUsername) ||
                const DeepCollectionEquality()
                    .equals(other.telegramUsername, telegramUsername)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(currentCity) ^
      const DeepCollectionEquality().hash(about) ^
      const DeepCollectionEquality().hash(imageLink) ^
      const DeepCollectionEquality().hash(instagramUsername) ^
      const DeepCollectionEquality().hash(telegramUsername);

  @JsonKey(ignore: true)
  @override
  _$UserProfileToWriteCopyWith<_UserProfileToWrite> get copyWith =>
      __$UserProfileToWriteCopyWithImpl<_UserProfileToWrite>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserProfileToWriteToJson(this);
  }
}

abstract class _UserProfileToWrite implements UserProfileToWrite {
  const factory _UserProfileToWrite(
      {required String name,
      required String currentCity,
      String? about,
      String? imageLink,
      String? instagramUsername,
      String? telegramUsername}) = _$_UserProfileToWrite;

  factory _UserProfileToWrite.fromJson(Map<String, dynamic> json) =
      _$_UserProfileToWrite.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get currentCity => throw _privateConstructorUsedError;
  @override
  String? get about => throw _privateConstructorUsedError;
  @override
  String? get imageLink => throw _privateConstructorUsedError;
  @override
  String? get instagramUsername => throw _privateConstructorUsedError;
  @override
  String? get telegramUsername => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserProfileToWriteCopyWith<_UserProfileToWrite> get copyWith =>
      throw _privateConstructorUsedError;
}
