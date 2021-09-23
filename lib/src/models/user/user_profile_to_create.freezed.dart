// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user_profile_to_create.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserProfileToCreate _$UserProfileToCreateFromJson(Map<String, dynamic> json) {
  return _UserProfileToCreate.fromJson(json);
}

/// @nodoc
class _$UserProfileToCreateTearOff {
  const _$UserProfileToCreateTearOff();

  _UserProfileToCreate call(
      {required String name, String? imageLink, required City currentCity}) {
    return _UserProfileToCreate(
      name: name,
      imageLink: imageLink,
      currentCity: currentCity,
    );
  }

  UserProfileToCreate fromJson(Map<String, Object> json) {
    return UserProfileToCreate.fromJson(json);
  }
}

/// @nodoc
const $UserProfileToCreate = _$UserProfileToCreateTearOff();

/// @nodoc
mixin _$UserProfileToCreate {
  String get name => throw _privateConstructorUsedError;
  String? get imageLink => throw _privateConstructorUsedError;
  City get currentCity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileToCreateCopyWith<UserProfileToCreate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileToCreateCopyWith<$Res> {
  factory $UserProfileToCreateCopyWith(
          UserProfileToCreate value, $Res Function(UserProfileToCreate) then) =
      _$UserProfileToCreateCopyWithImpl<$Res>;
  $Res call({String name, String? imageLink, City currentCity});

  $CityCopyWith<$Res> get currentCity;
}

/// @nodoc
class _$UserProfileToCreateCopyWithImpl<$Res>
    implements $UserProfileToCreateCopyWith<$Res> {
  _$UserProfileToCreateCopyWithImpl(this._value, this._then);

  final UserProfileToCreate _value;
  // ignore: unused_field
  final $Res Function(UserProfileToCreate) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? imageLink = freezed,
    Object? currentCity = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageLink: imageLink == freezed
          ? _value.imageLink
          : imageLink // ignore: cast_nullable_to_non_nullable
              as String?,
      currentCity: currentCity == freezed
          ? _value.currentCity
          : currentCity // ignore: cast_nullable_to_non_nullable
              as City,
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
abstract class _$UserProfileToCreateCopyWith<$Res>
    implements $UserProfileToCreateCopyWith<$Res> {
  factory _$UserProfileToCreateCopyWith(_UserProfileToCreate value,
          $Res Function(_UserProfileToCreate) then) =
      __$UserProfileToCreateCopyWithImpl<$Res>;
  @override
  $Res call({String name, String? imageLink, City currentCity});

  @override
  $CityCopyWith<$Res> get currentCity;
}

/// @nodoc
class __$UserProfileToCreateCopyWithImpl<$Res>
    extends _$UserProfileToCreateCopyWithImpl<$Res>
    implements _$UserProfileToCreateCopyWith<$Res> {
  __$UserProfileToCreateCopyWithImpl(
      _UserProfileToCreate _value, $Res Function(_UserProfileToCreate) _then)
      : super(_value, (v) => _then(v as _UserProfileToCreate));

  @override
  _UserProfileToCreate get _value => super._value as _UserProfileToCreate;

  @override
  $Res call({
    Object? name = freezed,
    Object? imageLink = freezed,
    Object? currentCity = freezed,
  }) {
    return _then(_UserProfileToCreate(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageLink: imageLink == freezed
          ? _value.imageLink
          : imageLink // ignore: cast_nullable_to_non_nullable
              as String?,
      currentCity: currentCity == freezed
          ? _value.currentCity
          : currentCity // ignore: cast_nullable_to_non_nullable
              as City,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserProfileToCreate implements _UserProfileToCreate {
  const _$_UserProfileToCreate(
      {required this.name, this.imageLink, required this.currentCity});

  factory _$_UserProfileToCreate.fromJson(Map<String, dynamic> json) =>
      _$_$_UserProfileToCreateFromJson(json);

  @override
  final String name;
  @override
  final String? imageLink;
  @override
  final City currentCity;

  @override
  String toString() {
    return 'UserProfileToCreate(name: $name, imageLink: $imageLink, currentCity: $currentCity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserProfileToCreate &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.imageLink, imageLink) ||
                const DeepCollectionEquality()
                    .equals(other.imageLink, imageLink)) &&
            (identical(other.currentCity, currentCity) ||
                const DeepCollectionEquality()
                    .equals(other.currentCity, currentCity)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(imageLink) ^
      const DeepCollectionEquality().hash(currentCity);

  @JsonKey(ignore: true)
  @override
  _$UserProfileToCreateCopyWith<_UserProfileToCreate> get copyWith =>
      __$UserProfileToCreateCopyWithImpl<_UserProfileToCreate>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserProfileToCreateToJson(this);
  }
}

abstract class _UserProfileToCreate implements UserProfileToCreate {
  const factory _UserProfileToCreate(
      {required String name,
      String? imageLink,
      required City currentCity}) = _$_UserProfileToCreate;

  factory _UserProfileToCreate.fromJson(Map<String, dynamic> json) =
      _$_UserProfileToCreate.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String? get imageLink => throw _privateConstructorUsedError;
  @override
  City get currentCity => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserProfileToCreateCopyWith<_UserProfileToCreate> get copyWith =>
      throw _privateConstructorUsedError;
}
