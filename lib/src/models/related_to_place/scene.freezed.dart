// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'scene.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Scene _$SceneFromJson(Map<String, dynamic> json) {
  return _Scene.fromJson(json);
}

/// @nodoc
class _$SceneTearOff {
  const _$SceneTearOff();

  _Scene call({String? imageLink, required int id, required String name}) {
    return _Scene(
      imageLink: imageLink,
      id: id,
      name: name,
    );
  }

  Scene fromJson(Map<String, Object> json) {
    return Scene.fromJson(json);
  }
}

/// @nodoc
const $Scene = _$SceneTearOff();

/// @nodoc
mixin _$Scene {
  String? get imageLink => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SceneCopyWith<Scene> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SceneCopyWith<$Res> {
  factory $SceneCopyWith(Scene value, $Res Function(Scene) then) =
      _$SceneCopyWithImpl<$Res>;
  $Res call({String? imageLink, int id, String name});
}

/// @nodoc
class _$SceneCopyWithImpl<$Res> implements $SceneCopyWith<$Res> {
  _$SceneCopyWithImpl(this._value, this._then);

  final Scene _value;
  // ignore: unused_field
  final $Res Function(Scene) _then;

  @override
  $Res call({
    Object? imageLink = freezed,
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      imageLink: imageLink == freezed
          ? _value.imageLink
          : imageLink // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SceneCopyWith<$Res> implements $SceneCopyWith<$Res> {
  factory _$SceneCopyWith(_Scene value, $Res Function(_Scene) then) =
      __$SceneCopyWithImpl<$Res>;
  @override
  $Res call({String? imageLink, int id, String name});
}

/// @nodoc
class __$SceneCopyWithImpl<$Res> extends _$SceneCopyWithImpl<$Res>
    implements _$SceneCopyWith<$Res> {
  __$SceneCopyWithImpl(_Scene _value, $Res Function(_Scene) _then)
      : super(_value, (v) => _then(v as _Scene));

  @override
  _Scene get _value => super._value as _Scene;

  @override
  $Res call({
    Object? imageLink = freezed,
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_Scene(
      imageLink: imageLink == freezed
          ? _value.imageLink
          : imageLink // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Scene implements _Scene {
  const _$_Scene({this.imageLink, required this.id, required this.name});

  factory _$_Scene.fromJson(Map<String, dynamic> json) =>
      _$_$_SceneFromJson(json);

  @override
  final String? imageLink;
  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'Scene(imageLink: $imageLink, id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Scene &&
            (identical(other.imageLink, imageLink) ||
                const DeepCollectionEquality()
                    .equals(other.imageLink, imageLink)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(imageLink) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  _$SceneCopyWith<_Scene> get copyWith =>
      __$SceneCopyWithImpl<_Scene>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SceneToJson(this);
  }
}

abstract class _Scene implements Scene {
  const factory _Scene(
      {String? imageLink, required int id, required String name}) = _$_Scene;

  factory _Scene.fromJson(Map<String, dynamic> json) = _$_Scene.fromJson;

  @override
  String? get imageLink => throw _privateConstructorUsedError;
  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SceneCopyWith<_Scene> get copyWith => throw _privateConstructorUsedError;
}
