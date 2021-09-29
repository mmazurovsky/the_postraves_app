// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user_profile_to_update.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserProfileToUpdate _$UserProfileToUpdateFromJson(Map<String, dynamic> json) {
  return _UserProfileToUpdate.fromJson(json);
}

/// @nodoc
class _$UserProfileToUpdateTearOff {
  const _$UserProfileToUpdateTearOff();

  _UserProfileToUpdate call(
      {required String name,
      required String currentCity,
      String? about,
      String? imageLink,
      String? instagramLink,
      String? telegramLink}) {
    return _UserProfileToUpdate(
      name: name,
      currentCity: currentCity,
      about: about,
      imageLink: imageLink,
      instagramLink: instagramLink,
      telegramLink: telegramLink,
    );
  }

  UserProfileToUpdate fromJson(Map<String, Object> json) {
    return UserProfileToUpdate.fromJson(json);
  }
}

/// @nodoc
const $UserProfileToUpdate = _$UserProfileToUpdateTearOff();

/// @nodoc
mixin _$UserProfileToUpdate {
  String get name => throw _privateConstructorUsedError;
  String get currentCity => throw _privateConstructorUsedError;
  String? get about => throw _privateConstructorUsedError;
  String? get imageLink => throw _privateConstructorUsedError;
  String? get instagramLink => throw _privateConstructorUsedError;
  String? get telegramLink => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileToUpdateCopyWith<UserProfileToUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileToUpdateCopyWith<$Res> {
  factory $UserProfileToUpdateCopyWith(
          UserProfileToUpdate value, $Res Function(UserProfileToUpdate) then) =
      _$UserProfileToUpdateCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String currentCity,
      String? about,
      String? imageLink,
      String? instagramLink,
      String? telegramLink});
}

/// @nodoc
class _$UserProfileToUpdateCopyWithImpl<$Res>
    implements $UserProfileToUpdateCopyWith<$Res> {
  _$UserProfileToUpdateCopyWithImpl(this._value, this._then);

  final UserProfileToUpdate _value;
  // ignore: unused_field
  final $Res Function(UserProfileToUpdate) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? currentCity = freezed,
    Object? about = freezed,
    Object? imageLink = freezed,
    Object? instagramLink = freezed,
    Object? telegramLink = freezed,
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
abstract class _$UserProfileToUpdateCopyWith<$Res>
    implements $UserProfileToUpdateCopyWith<$Res> {
  factory _$UserProfileToUpdateCopyWith(_UserProfileToUpdate value,
          $Res Function(_UserProfileToUpdate) then) =
      __$UserProfileToUpdateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String currentCity,
      String? about,
      String? imageLink,
      String? instagramLink,
      String? telegramLink});
}

/// @nodoc
class __$UserProfileToUpdateCopyWithImpl<$Res>
    extends _$UserProfileToUpdateCopyWithImpl<$Res>
    implements _$UserProfileToUpdateCopyWith<$Res> {
  __$UserProfileToUpdateCopyWithImpl(
      _UserProfileToUpdate _value, $Res Function(_UserProfileToUpdate) _then)
      : super(_value, (v) => _then(v as _UserProfileToUpdate));

  @override
  _UserProfileToUpdate get _value => super._value as _UserProfileToUpdate;

  @override
  $Res call({
    Object? name = freezed,
    Object? currentCity = freezed,
    Object? about = freezed,
    Object? imageLink = freezed,
    Object? instagramLink = freezed,
    Object? telegramLink = freezed,
  }) {
    return _then(_UserProfileToUpdate(
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
class _$_UserProfileToUpdate implements _UserProfileToUpdate {
  const _$_UserProfileToUpdate(
      {required this.name,
      required this.currentCity,
      this.about,
      this.imageLink,
      this.instagramLink,
      this.telegramLink});

  factory _$_UserProfileToUpdate.fromJson(Map<String, dynamic> json) =>
      _$_$_UserProfileToUpdateFromJson(json);

  @override
  final String name;
  @override
  final String currentCity;
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
    return 'UserProfileToUpdate(name: $name, currentCity: $currentCity, about: $about, imageLink: $imageLink, instagramLink: $instagramLink, telegramLink: $telegramLink)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserProfileToUpdate &&
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
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(currentCity) ^
      const DeepCollectionEquality().hash(about) ^
      const DeepCollectionEquality().hash(imageLink) ^
      const DeepCollectionEquality().hash(instagramLink) ^
      const DeepCollectionEquality().hash(telegramLink);

  @JsonKey(ignore: true)
  @override
  _$UserProfileToUpdateCopyWith<_UserProfileToUpdate> get copyWith =>
      __$UserProfileToUpdateCopyWithImpl<_UserProfileToUpdate>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserProfileToUpdateToJson(this);
  }
}

abstract class _UserProfileToUpdate implements UserProfileToUpdate {
  const factory _UserProfileToUpdate(
      {required String name,
      required String currentCity,
      String? about,
      String? imageLink,
      String? instagramLink,
      String? telegramLink}) = _$_UserProfileToUpdate;

  factory _UserProfileToUpdate.fromJson(Map<String, dynamic> json) =
      _$_UserProfileToUpdate.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get currentCity => throw _privateConstructorUsedError;
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
  _$UserProfileToUpdateCopyWith<_UserProfileToUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}
