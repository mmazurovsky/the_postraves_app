// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'follow_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FollowStateTearOff {
  const _$FollowStateTearOff();

  _FollowState call(int? followers, bool? isFollowed) {
    return _FollowState(
      followers,
      isFollowed,
    );
  }
}

/// @nodoc
const $FollowState = _$FollowStateTearOff();

/// @nodoc
mixin _$FollowState {
  int? get followers => throw _privateConstructorUsedError;
  bool? get isFollowed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FollowStateCopyWith<FollowState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowStateCopyWith<$Res> {
  factory $FollowStateCopyWith(
          FollowState value, $Res Function(FollowState) then) =
      _$FollowStateCopyWithImpl<$Res>;
  $Res call({int? followers, bool? isFollowed});
}

/// @nodoc
class _$FollowStateCopyWithImpl<$Res> implements $FollowStateCopyWith<$Res> {
  _$FollowStateCopyWithImpl(this._value, this._then);

  final FollowState _value;
  // ignore: unused_field
  final $Res Function(FollowState) _then;

  @override
  $Res call({
    Object? followers = freezed,
    Object? isFollowed = freezed,
  }) {
    return _then(_value.copyWith(
      followers: followers == freezed
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as int?,
      isFollowed: isFollowed == freezed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$FollowStateCopyWith<$Res>
    implements $FollowStateCopyWith<$Res> {
  factory _$FollowStateCopyWith(
          _FollowState value, $Res Function(_FollowState) then) =
      __$FollowStateCopyWithImpl<$Res>;
  @override
  $Res call({int? followers, bool? isFollowed});
}

/// @nodoc
class __$FollowStateCopyWithImpl<$Res> extends _$FollowStateCopyWithImpl<$Res>
    implements _$FollowStateCopyWith<$Res> {
  __$FollowStateCopyWithImpl(
      _FollowState _value, $Res Function(_FollowState) _then)
      : super(_value, (v) => _then(v as _FollowState));

  @override
  _FollowState get _value => super._value as _FollowState;

  @override
  $Res call({
    Object? followers = freezed,
    Object? isFollowed = freezed,
  }) {
    return _then(_FollowState(
      followers == freezed
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as int?,
      isFollowed == freezed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_FollowState implements _FollowState {
  const _$_FollowState(this.followers, this.isFollowed);

  @override
  final int? followers;
  @override
  final bool? isFollowed;

  @override
  String toString() {
    return 'FollowState(followers: $followers, isFollowed: $isFollowed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FollowState &&
            (identical(other.followers, followers) ||
                const DeepCollectionEquality()
                    .equals(other.followers, followers)) &&
            (identical(other.isFollowed, isFollowed) ||
                const DeepCollectionEquality()
                    .equals(other.isFollowed, isFollowed)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(followers) ^
      const DeepCollectionEquality().hash(isFollowed);

  @JsonKey(ignore: true)
  @override
  _$FollowStateCopyWith<_FollowState> get copyWith =>
      __$FollowStateCopyWithImpl<_FollowState>(this, _$identity);
}

abstract class _FollowState implements FollowState {
  const factory _FollowState(int? followers, bool? isFollowed) = _$_FollowState;

  @override
  int? get followers => throw _privateConstructorUsedError;
  @override
  bool? get isFollowed => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FollowStateCopyWith<_FollowState> get copyWith =>
      throw _privateConstructorUsedError;
}
