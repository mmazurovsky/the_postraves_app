// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'aggregated_search_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AggregatedSearchModelTearOff {
  const _$AggregatedSearchModelTearOff();

  _AggregatedSeachModel call(
      {required List<EventShort> foundEvents,
      required List<ArtistShort> foundArtists,
      required List<UnityShort> foundUnities,
      required List<PlaceShort> foundPlaces}) {
    return _AggregatedSeachModel(
      foundEvents: foundEvents,
      foundArtists: foundArtists,
      foundUnities: foundUnities,
      foundPlaces: foundPlaces,
    );
  }
}

/// @nodoc
const $AggregatedSearchModel = _$AggregatedSearchModelTearOff();

/// @nodoc
mixin _$AggregatedSearchModel {
  List<EventShort> get foundEvents => throw _privateConstructorUsedError;
  List<ArtistShort> get foundArtists => throw _privateConstructorUsedError;
  List<UnityShort> get foundUnities => throw _privateConstructorUsedError;
  List<PlaceShort> get foundPlaces => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AggregatedSearchModelCopyWith<AggregatedSearchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AggregatedSearchModelCopyWith<$Res> {
  factory $AggregatedSearchModelCopyWith(AggregatedSearchModel value,
          $Res Function(AggregatedSearchModel) then) =
      _$AggregatedSearchModelCopyWithImpl<$Res>;
  $Res call(
      {List<EventShort> foundEvents,
      List<ArtistShort> foundArtists,
      List<UnityShort> foundUnities,
      List<PlaceShort> foundPlaces});
}

/// @nodoc
class _$AggregatedSearchModelCopyWithImpl<$Res>
    implements $AggregatedSearchModelCopyWith<$Res> {
  _$AggregatedSearchModelCopyWithImpl(this._value, this._then);

  final AggregatedSearchModel _value;
  // ignore: unused_field
  final $Res Function(AggregatedSearchModel) _then;

  @override
  $Res call({
    Object? foundEvents = freezed,
    Object? foundArtists = freezed,
    Object? foundUnities = freezed,
    Object? foundPlaces = freezed,
  }) {
    return _then(_value.copyWith(
      foundEvents: foundEvents == freezed
          ? _value.foundEvents
          : foundEvents // ignore: cast_nullable_to_non_nullable
              as List<EventShort>,
      foundArtists: foundArtists == freezed
          ? _value.foundArtists
          : foundArtists // ignore: cast_nullable_to_non_nullable
              as List<ArtistShort>,
      foundUnities: foundUnities == freezed
          ? _value.foundUnities
          : foundUnities // ignore: cast_nullable_to_non_nullable
              as List<UnityShort>,
      foundPlaces: foundPlaces == freezed
          ? _value.foundPlaces
          : foundPlaces // ignore: cast_nullable_to_non_nullable
              as List<PlaceShort>,
    ));
  }
}

/// @nodoc
abstract class _$AggregatedSeachModelCopyWith<$Res>
    implements $AggregatedSearchModelCopyWith<$Res> {
  factory _$AggregatedSeachModelCopyWith(_AggregatedSeachModel value,
          $Res Function(_AggregatedSeachModel) then) =
      __$AggregatedSeachModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<EventShort> foundEvents,
      List<ArtistShort> foundArtists,
      List<UnityShort> foundUnities,
      List<PlaceShort> foundPlaces});
}

/// @nodoc
class __$AggregatedSeachModelCopyWithImpl<$Res>
    extends _$AggregatedSearchModelCopyWithImpl<$Res>
    implements _$AggregatedSeachModelCopyWith<$Res> {
  __$AggregatedSeachModelCopyWithImpl(
      _AggregatedSeachModel _value, $Res Function(_AggregatedSeachModel) _then)
      : super(_value, (v) => _then(v as _AggregatedSeachModel));

  @override
  _AggregatedSeachModel get _value => super._value as _AggregatedSeachModel;

  @override
  $Res call({
    Object? foundEvents = freezed,
    Object? foundArtists = freezed,
    Object? foundUnities = freezed,
    Object? foundPlaces = freezed,
  }) {
    return _then(_AggregatedSeachModel(
      foundEvents: foundEvents == freezed
          ? _value.foundEvents
          : foundEvents // ignore: cast_nullable_to_non_nullable
              as List<EventShort>,
      foundArtists: foundArtists == freezed
          ? _value.foundArtists
          : foundArtists // ignore: cast_nullable_to_non_nullable
              as List<ArtistShort>,
      foundUnities: foundUnities == freezed
          ? _value.foundUnities
          : foundUnities // ignore: cast_nullable_to_non_nullable
              as List<UnityShort>,
      foundPlaces: foundPlaces == freezed
          ? _value.foundPlaces
          : foundPlaces // ignore: cast_nullable_to_non_nullable
              as List<PlaceShort>,
    ));
  }
}

/// @nodoc

class _$_AggregatedSeachModel implements _AggregatedSeachModel {
  _$_AggregatedSeachModel(
      {required this.foundEvents,
      required this.foundArtists,
      required this.foundUnities,
      required this.foundPlaces});

  @override
  final List<EventShort> foundEvents;
  @override
  final List<ArtistShort> foundArtists;
  @override
  final List<UnityShort> foundUnities;
  @override
  final List<PlaceShort> foundPlaces;

  @override
  String toString() {
    return 'AggregatedSearchModel(foundEvents: $foundEvents, foundArtists: $foundArtists, foundUnities: $foundUnities, foundPlaces: $foundPlaces)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AggregatedSeachModel &&
            (identical(other.foundEvents, foundEvents) ||
                const DeepCollectionEquality()
                    .equals(other.foundEvents, foundEvents)) &&
            (identical(other.foundArtists, foundArtists) ||
                const DeepCollectionEquality()
                    .equals(other.foundArtists, foundArtists)) &&
            (identical(other.foundUnities, foundUnities) ||
                const DeepCollectionEquality()
                    .equals(other.foundUnities, foundUnities)) &&
            (identical(other.foundPlaces, foundPlaces) ||
                const DeepCollectionEquality()
                    .equals(other.foundPlaces, foundPlaces)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(foundEvents) ^
      const DeepCollectionEquality().hash(foundArtists) ^
      const DeepCollectionEquality().hash(foundUnities) ^
      const DeepCollectionEquality().hash(foundPlaces);

  @JsonKey(ignore: true)
  @override
  _$AggregatedSeachModelCopyWith<_AggregatedSeachModel> get copyWith =>
      __$AggregatedSeachModelCopyWithImpl<_AggregatedSeachModel>(
          this, _$identity);
}

abstract class _AggregatedSeachModel implements AggregatedSearchModel {
  factory _AggregatedSeachModel(
      {required List<EventShort> foundEvents,
      required List<ArtistShort> foundArtists,
      required List<UnityShort> foundUnities,
      required List<PlaceShort> foundPlaces}) = _$_AggregatedSeachModel;

  @override
  List<EventShort> get foundEvents => throw _privateConstructorUsedError;
  @override
  List<ArtistShort> get foundArtists => throw _privateConstructorUsedError;
  @override
  List<UnityShort> get foundUnities => throw _privateConstructorUsedError;
  @override
  List<PlaceShort> get foundPlaces => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AggregatedSeachModelCopyWith<_AggregatedSeachModel> get copyWith =>
      throw _privateConstructorUsedError;
}
