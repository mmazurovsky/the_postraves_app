// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'timetable_for_scene_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TimetableForSceneDtoTearOff {
  const _$TimetableForSceneDtoTearOff();

  _TimetableForSceneDto call(
      {required Scene scene,
      required List<TimetableDayPerformancesDto> timetableDayPerformances}) {
    return _TimetableForSceneDto(
      scene: scene,
      timetableDayPerformances: timetableDayPerformances,
    );
  }
}

/// @nodoc
const $TimetableForSceneDto = _$TimetableForSceneDtoTearOff();

/// @nodoc
mixin _$TimetableForSceneDto {
  Scene get scene => throw _privateConstructorUsedError;
  List<TimetableDayPerformancesDto> get timetableDayPerformances =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimetableForSceneDtoCopyWith<TimetableForSceneDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimetableForSceneDtoCopyWith<$Res> {
  factory $TimetableForSceneDtoCopyWith(TimetableForSceneDto value,
          $Res Function(TimetableForSceneDto) then) =
      _$TimetableForSceneDtoCopyWithImpl<$Res>;
  $Res call(
      {Scene scene,
      List<TimetableDayPerformancesDto> timetableDayPerformances});

  $SceneCopyWith<$Res> get scene;
}

/// @nodoc
class _$TimetableForSceneDtoCopyWithImpl<$Res>
    implements $TimetableForSceneDtoCopyWith<$Res> {
  _$TimetableForSceneDtoCopyWithImpl(this._value, this._then);

  final TimetableForSceneDto _value;
  // ignore: unused_field
  final $Res Function(TimetableForSceneDto) _then;

  @override
  $Res call({
    Object? scene = freezed,
    Object? timetableDayPerformances = freezed,
  }) {
    return _then(_value.copyWith(
      scene: scene == freezed
          ? _value.scene
          : scene // ignore: cast_nullable_to_non_nullable
              as Scene,
      timetableDayPerformances: timetableDayPerformances == freezed
          ? _value.timetableDayPerformances
          : timetableDayPerformances // ignore: cast_nullable_to_non_nullable
              as List<TimetableDayPerformancesDto>,
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
abstract class _$TimetableForSceneDtoCopyWith<$Res>
    implements $TimetableForSceneDtoCopyWith<$Res> {
  factory _$TimetableForSceneDtoCopyWith(_TimetableForSceneDto value,
          $Res Function(_TimetableForSceneDto) then) =
      __$TimetableForSceneDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {Scene scene,
      List<TimetableDayPerformancesDto> timetableDayPerformances});

  @override
  $SceneCopyWith<$Res> get scene;
}

/// @nodoc
class __$TimetableForSceneDtoCopyWithImpl<$Res>
    extends _$TimetableForSceneDtoCopyWithImpl<$Res>
    implements _$TimetableForSceneDtoCopyWith<$Res> {
  __$TimetableForSceneDtoCopyWithImpl(
      _TimetableForSceneDto _value, $Res Function(_TimetableForSceneDto) _then)
      : super(_value, (v) => _then(v as _TimetableForSceneDto));

  @override
  _TimetableForSceneDto get _value => super._value as _TimetableForSceneDto;

  @override
  $Res call({
    Object? scene = freezed,
    Object? timetableDayPerformances = freezed,
  }) {
    return _then(_TimetableForSceneDto(
      scene: scene == freezed
          ? _value.scene
          : scene // ignore: cast_nullable_to_non_nullable
              as Scene,
      timetableDayPerformances: timetableDayPerformances == freezed
          ? _value.timetableDayPerformances
          : timetableDayPerformances // ignore: cast_nullable_to_non_nullable
              as List<TimetableDayPerformancesDto>,
    ));
  }
}

/// @nodoc

class _$_TimetableForSceneDto extends _TimetableForSceneDto {
  const _$_TimetableForSceneDto(
      {required this.scene, required this.timetableDayPerformances})
      : super._();

  @override
  final Scene scene;
  @override
  final List<TimetableDayPerformancesDto> timetableDayPerformances;

  @override
  String toString() {
    return 'TimetableForSceneDto(scene: $scene, timetableDayPerformances: $timetableDayPerformances)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TimetableForSceneDto &&
            (identical(other.scene, scene) ||
                const DeepCollectionEquality().equals(other.scene, scene)) &&
            (identical(
                    other.timetableDayPerformances, timetableDayPerformances) ||
                const DeepCollectionEquality().equals(
                    other.timetableDayPerformances, timetableDayPerformances)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(scene) ^
      const DeepCollectionEquality().hash(timetableDayPerformances);

  @JsonKey(ignore: true)
  @override
  _$TimetableForSceneDtoCopyWith<_TimetableForSceneDto> get copyWith =>
      __$TimetableForSceneDtoCopyWithImpl<_TimetableForSceneDto>(
          this, _$identity);
}

abstract class _TimetableForSceneDto extends TimetableForSceneDto {
  const factory _TimetableForSceneDto(
      {required Scene scene,
      required List<TimetableDayPerformancesDto>
          timetableDayPerformances}) = _$_TimetableForSceneDto;
  const _TimetableForSceneDto._() : super._();

  @override
  Scene get scene => throw _privateConstructorUsedError;
  @override
  List<TimetableDayPerformancesDto> get timetableDayPerformances =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TimetableForSceneDtoCopyWith<_TimetableForSceneDto> get copyWith =>
      throw _privateConstructorUsedError;
}
