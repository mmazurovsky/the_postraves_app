// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'timetable_for_scene.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TimetableForScene _$TimetableForSceneFromJson(Map<String, dynamic> json) {
  return _TimetableForScene.fromJson(json);
}

/// @nodoc
class _$TimetableForSceneTearOff {
  const _$TimetableForSceneTearOff();

  _TimetableForScene call(
      {required Scene scene,
      required List<TimetablePerformance> performances}) {
    return _TimetableForScene(
      scene: scene,
      performances: performances,
    );
  }

  TimetableForScene fromJson(Map<String, Object> json) {
    return TimetableForScene.fromJson(json);
  }
}

/// @nodoc
const $TimetableForScene = _$TimetableForSceneTearOff();

/// @nodoc
mixin _$TimetableForScene {
  Scene get scene => throw _privateConstructorUsedError;
  List<TimetablePerformance> get performances =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimetableForSceneCopyWith<TimetableForScene> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimetableForSceneCopyWith<$Res> {
  factory $TimetableForSceneCopyWith(
          TimetableForScene value, $Res Function(TimetableForScene) then) =
      _$TimetableForSceneCopyWithImpl<$Res>;
  $Res call({Scene scene, List<TimetablePerformance> performances});

  $SceneCopyWith<$Res> get scene;
}

/// @nodoc
class _$TimetableForSceneCopyWithImpl<$Res>
    implements $TimetableForSceneCopyWith<$Res> {
  _$TimetableForSceneCopyWithImpl(this._value, this._then);

  final TimetableForScene _value;
  // ignore: unused_field
  final $Res Function(TimetableForScene) _then;

  @override
  $Res call({
    Object? scene = freezed,
    Object? performances = freezed,
  }) {
    return _then(_value.copyWith(
      scene: scene == freezed
          ? _value.scene
          : scene // ignore: cast_nullable_to_non_nullable
              as Scene,
      performances: performances == freezed
          ? _value.performances
          : performances // ignore: cast_nullable_to_non_nullable
              as List<TimetablePerformance>,
    ));
  }

  @override
  $SceneCopyWith<$Res> get scene {
    return $SceneCopyWith<$Res>(_value.scene, (value) {
      return _then(_value.copyWith(scene: value));
    });
  }
}

/// @nodoc
abstract class _$TimetableForSceneCopyWith<$Res>
    implements $TimetableForSceneCopyWith<$Res> {
  factory _$TimetableForSceneCopyWith(
          _TimetableForScene value, $Res Function(_TimetableForScene) then) =
      __$TimetableForSceneCopyWithImpl<$Res>;
  @override
  $Res call({Scene scene, List<TimetablePerformance> performances});

  @override
  $SceneCopyWith<$Res> get scene;
}

/// @nodoc
class __$TimetableForSceneCopyWithImpl<$Res>
    extends _$TimetableForSceneCopyWithImpl<$Res>
    implements _$TimetableForSceneCopyWith<$Res> {
  __$TimetableForSceneCopyWithImpl(
      _TimetableForScene _value, $Res Function(_TimetableForScene) _then)
      : super(_value, (v) => _then(v as _TimetableForScene));

  @override
  _TimetableForScene get _value => super._value as _TimetableForScene;

  @override
  $Res call({
    Object? scene = freezed,
    Object? performances = freezed,
  }) {
    return _then(_TimetableForScene(
      scene: scene == freezed
          ? _value.scene
          : scene // ignore: cast_nullable_to_non_nullable
              as Scene,
      performances: performances == freezed
          ? _value.performances
          : performances // ignore: cast_nullable_to_non_nullable
              as List<TimetablePerformance>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimetableForScene implements _TimetableForScene {
  const _$_TimetableForScene({required this.scene, required this.performances});

  factory _$_TimetableForScene.fromJson(Map<String, dynamic> json) =>
      _$_$_TimetableForSceneFromJson(json);

  @override
  final Scene scene;
  @override
  final List<TimetablePerformance> performances;

  @override
  String toString() {
    return 'TimetableForScene(scene: $scene, performances: $performances)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TimetableForScene &&
            (identical(other.scene, scene) ||
                const DeepCollectionEquality().equals(other.scene, scene)) &&
            (identical(other.performances, performances) ||
                const DeepCollectionEquality()
                    .equals(other.performances, performances)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(scene) ^
      const DeepCollectionEquality().hash(performances);

  @JsonKey(ignore: true)
  @override
  _$TimetableForSceneCopyWith<_TimetableForScene> get copyWith =>
      __$TimetableForSceneCopyWithImpl<_TimetableForScene>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TimetableForSceneToJson(this);
  }
}

abstract class _TimetableForScene implements TimetableForScene {
  const factory _TimetableForScene(
      {required Scene scene,
      required List<TimetablePerformance> performances}) = _$_TimetableForScene;

  factory _TimetableForScene.fromJson(Map<String, dynamic> json) =
      _$_TimetableForScene.fromJson;

  @override
  Scene get scene => throw _privateConstructorUsedError;
  @override
  List<TimetablePerformance> get performances =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TimetableForSceneCopyWith<_TimetableForScene> get copyWith =>
      throw _privateConstructorUsedError;
}
