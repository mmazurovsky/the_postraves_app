// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'response_sealed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ResponseSealedTearOff {
  const _$ResponseSealedTearOff();

  SuccessResponse<DATA> success<DATA>(DATA data) {
    return SuccessResponse<DATA>(
      data,
    );
  }

  FailureResponse<DATA> failure<DATA>(Failure failure,
      [String? failureMessage]) {
    return FailureResponse<DATA>(
      failure,
      failureMessage,
    );
  }
}

/// @nodoc
const $ResponseSealed = _$ResponseSealedTearOff();

/// @nodoc
mixin _$ResponseSealed<DATA> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DATA data) success,
    required TResult Function(Failure failure, String? failureMessage) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DATA data)? success,
    TResult Function(Failure failure, String? failureMessage)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessResponse<DATA> value) success,
    required TResult Function(FailureResponse<DATA> value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessResponse<DATA> value)? success,
    TResult Function(FailureResponse<DATA> value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseSealedCopyWith<DATA, $Res> {
  factory $ResponseSealedCopyWith(ResponseSealed<DATA> value,
          $Res Function(ResponseSealed<DATA>) then) =
      _$ResponseSealedCopyWithImpl<DATA, $Res>;
}

/// @nodoc
class _$ResponseSealedCopyWithImpl<DATA, $Res>
    implements $ResponseSealedCopyWith<DATA, $Res> {
  _$ResponseSealedCopyWithImpl(this._value, this._then);

  final ResponseSealed<DATA> _value;
  // ignore: unused_field
  final $Res Function(ResponseSealed<DATA>) _then;
}

/// @nodoc
abstract class $SuccessResponseCopyWith<DATA, $Res> {
  factory $SuccessResponseCopyWith(SuccessResponse<DATA> value,
          $Res Function(SuccessResponse<DATA>) then) =
      _$SuccessResponseCopyWithImpl<DATA, $Res>;
  $Res call({DATA data});
}

/// @nodoc
class _$SuccessResponseCopyWithImpl<DATA, $Res>
    extends _$ResponseSealedCopyWithImpl<DATA, $Res>
    implements $SuccessResponseCopyWith<DATA, $Res> {
  _$SuccessResponseCopyWithImpl(
      SuccessResponse<DATA> _value, $Res Function(SuccessResponse<DATA>) _then)
      : super(_value, (v) => _then(v as SuccessResponse<DATA>));

  @override
  SuccessResponse<DATA> get _value => super._value as SuccessResponse<DATA>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(SuccessResponse<DATA>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DATA,
    ));
  }
}

/// @nodoc

class _$SuccessResponse<DATA> implements SuccessResponse<DATA> {
  const _$SuccessResponse(this.data);

  @override
  final DATA data;

  @override
  String toString() {
    return 'ResponseSealed<$DATA>.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SuccessResponse<DATA> &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  $SuccessResponseCopyWith<DATA, SuccessResponse<DATA>> get copyWith =>
      _$SuccessResponseCopyWithImpl<DATA, SuccessResponse<DATA>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DATA data) success,
    required TResult Function(Failure failure, String? failureMessage) failure,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DATA data)? success,
    TResult Function(Failure failure, String? failureMessage)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessResponse<DATA> value) success,
    required TResult Function(FailureResponse<DATA> value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessResponse<DATA> value)? success,
    TResult Function(FailureResponse<DATA> value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessResponse<DATA> implements ResponseSealed<DATA> {
  const factory SuccessResponse(DATA data) = _$SuccessResponse<DATA>;

  DATA get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SuccessResponseCopyWith<DATA, SuccessResponse<DATA>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureResponseCopyWith<DATA, $Res> {
  factory $FailureResponseCopyWith(FailureResponse<DATA> value,
          $Res Function(FailureResponse<DATA>) then) =
      _$FailureResponseCopyWithImpl<DATA, $Res>;
  $Res call({Failure failure, String? failureMessage});
}

/// @nodoc
class _$FailureResponseCopyWithImpl<DATA, $Res>
    extends _$ResponseSealedCopyWithImpl<DATA, $Res>
    implements $FailureResponseCopyWith<DATA, $Res> {
  _$FailureResponseCopyWithImpl(
      FailureResponse<DATA> _value, $Res Function(FailureResponse<DATA>) _then)
      : super(_value, (v) => _then(v as FailureResponse<DATA>));

  @override
  FailureResponse<DATA> get _value => super._value as FailureResponse<DATA>;

  @override
  $Res call({
    Object? failure = freezed,
    Object? failureMessage = freezed,
  }) {
    return _then(FailureResponse<DATA>(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
      failureMessage == freezed
          ? _value.failureMessage
          : failureMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FailureResponse<DATA> implements FailureResponse<DATA> {
  const _$FailureResponse(this.failure, [this.failureMessage]);

  @override
  final Failure failure;
  @override
  final String? failureMessage;

  @override
  String toString() {
    return 'ResponseSealed<$DATA>.failure(failure: $failure, failureMessage: $failureMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FailureResponse<DATA> &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality()
                    .equals(other.failure, failure)) &&
            (identical(other.failureMessage, failureMessage) ||
                const DeepCollectionEquality()
                    .equals(other.failureMessage, failureMessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(failure) ^
      const DeepCollectionEquality().hash(failureMessage);

  @JsonKey(ignore: true)
  @override
  $FailureResponseCopyWith<DATA, FailureResponse<DATA>> get copyWith =>
      _$FailureResponseCopyWithImpl<DATA, FailureResponse<DATA>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DATA data) success,
    required TResult Function(Failure failure, String? failureMessage) failure,
  }) {
    return failure(this.failure, failureMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DATA data)? success,
    TResult Function(Failure failure, String? failureMessage)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this.failure, failureMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessResponse<DATA> value) success,
    required TResult Function(FailureResponse<DATA> value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessResponse<DATA> value)? success,
    TResult Function(FailureResponse<DATA> value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class FailureResponse<DATA> implements ResponseSealed<DATA> {
  const factory FailureResponse(Failure failure, [String? failureMessage]) =
      _$FailureResponse<DATA>;

  Failure get failure => throw _privateConstructorUsedError;
  String? get failureMessage => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FailureResponseCopyWith<DATA, FailureResponse<DATA>> get copyWith =>
      throw _privateConstructorUsedError;
}
