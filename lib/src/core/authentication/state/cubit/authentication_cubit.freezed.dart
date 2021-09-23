// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'authentication_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthenticationStateTearOff {
  const _$AuthenticationStateTearOff();

  InitialAuthState initial() {
    return const InitialAuthState();
  }

  UnauthenticatedState unauthenticated() {
    return const UnauthenticatedState();
  }

  AuthenticatedWithoutAccountState authenticatedWithoutAccount() {
    return const AuthenticatedWithoutAccountState();
  }

  AuthenticatedState authenticated(UserProfile userProfile) {
    return AuthenticatedState(
      userProfile,
    );
  }

  ErrorAuthState error() {
    return const ErrorAuthState();
  }
}

/// @nodoc
const $AuthenticationState = _$AuthenticationStateTearOff();

/// @nodoc
mixin _$AuthenticationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unauthenticated,
    required TResult Function() authenticatedWithoutAccount,
    required TResult Function(UserProfile userProfile) authenticated,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthenticated,
    TResult Function()? authenticatedWithoutAccount,
    TResult Function(UserProfile userProfile)? authenticated,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialAuthState value) initial,
    required TResult Function(UnauthenticatedState value) unauthenticated,
    required TResult Function(AuthenticatedWithoutAccountState value)
        authenticatedWithoutAccount,
    required TResult Function(AuthenticatedState value) authenticated,
    required TResult Function(ErrorAuthState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAuthState value)? initial,
    TResult Function(UnauthenticatedState value)? unauthenticated,
    TResult Function(AuthenticatedWithoutAccountState value)?
        authenticatedWithoutAccount,
    TResult Function(AuthenticatedState value)? authenticated,
    TResult Function(ErrorAuthState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticationStateCopyWith(
          AuthenticationState value, $Res Function(AuthenticationState) then) =
      _$AuthenticationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._value, this._then);

  final AuthenticationState _value;
  // ignore: unused_field
  final $Res Function(AuthenticationState) _then;
}

/// @nodoc
abstract class $InitialAuthStateCopyWith<$Res> {
  factory $InitialAuthStateCopyWith(
          InitialAuthState value, $Res Function(InitialAuthState) then) =
      _$InitialAuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialAuthStateCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements $InitialAuthStateCopyWith<$Res> {
  _$InitialAuthStateCopyWithImpl(
      InitialAuthState _value, $Res Function(InitialAuthState) _then)
      : super(_value, (v) => _then(v as InitialAuthState));

  @override
  InitialAuthState get _value => super._value as InitialAuthState;
}

/// @nodoc

class _$InitialAuthState implements InitialAuthState {
  const _$InitialAuthState();

  @override
  String toString() {
    return 'AuthenticationState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitialAuthState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unauthenticated,
    required TResult Function() authenticatedWithoutAccount,
    required TResult Function(UserProfile userProfile) authenticated,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthenticated,
    TResult Function()? authenticatedWithoutAccount,
    TResult Function(UserProfile userProfile)? authenticated,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialAuthState value) initial,
    required TResult Function(UnauthenticatedState value) unauthenticated,
    required TResult Function(AuthenticatedWithoutAccountState value)
        authenticatedWithoutAccount,
    required TResult Function(AuthenticatedState value) authenticated,
    required TResult Function(ErrorAuthState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAuthState value)? initial,
    TResult Function(UnauthenticatedState value)? unauthenticated,
    TResult Function(AuthenticatedWithoutAccountState value)?
        authenticatedWithoutAccount,
    TResult Function(AuthenticatedState value)? authenticated,
    TResult Function(ErrorAuthState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialAuthState implements AuthenticationState {
  const factory InitialAuthState() = _$InitialAuthState;
}

/// @nodoc
abstract class $UnauthenticatedStateCopyWith<$Res> {
  factory $UnauthenticatedStateCopyWith(UnauthenticatedState value,
          $Res Function(UnauthenticatedState) then) =
      _$UnauthenticatedStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnauthenticatedStateCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements $UnauthenticatedStateCopyWith<$Res> {
  _$UnauthenticatedStateCopyWithImpl(
      UnauthenticatedState _value, $Res Function(UnauthenticatedState) _then)
      : super(_value, (v) => _then(v as UnauthenticatedState));

  @override
  UnauthenticatedState get _value => super._value as UnauthenticatedState;
}

/// @nodoc

class _$UnauthenticatedState implements UnauthenticatedState {
  const _$UnauthenticatedState();

  @override
  String toString() {
    return 'AuthenticationState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UnauthenticatedState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unauthenticated,
    required TResult Function() authenticatedWithoutAccount,
    required TResult Function(UserProfile userProfile) authenticated,
    required TResult Function() error,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthenticated,
    TResult Function()? authenticatedWithoutAccount,
    TResult Function(UserProfile userProfile)? authenticated,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialAuthState value) initial,
    required TResult Function(UnauthenticatedState value) unauthenticated,
    required TResult Function(AuthenticatedWithoutAccountState value)
        authenticatedWithoutAccount,
    required TResult Function(AuthenticatedState value) authenticated,
    required TResult Function(ErrorAuthState value) error,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAuthState value)? initial,
    TResult Function(UnauthenticatedState value)? unauthenticated,
    TResult Function(AuthenticatedWithoutAccountState value)?
        authenticatedWithoutAccount,
    TResult Function(AuthenticatedState value)? authenticated,
    TResult Function(ErrorAuthState value)? error,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class UnauthenticatedState implements AuthenticationState {
  const factory UnauthenticatedState() = _$UnauthenticatedState;
}

/// @nodoc
abstract class $AuthenticatedWithoutAccountStateCopyWith<$Res> {
  factory $AuthenticatedWithoutAccountStateCopyWith(
          AuthenticatedWithoutAccountState value,
          $Res Function(AuthenticatedWithoutAccountState) then) =
      _$AuthenticatedWithoutAccountStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthenticatedWithoutAccountStateCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements $AuthenticatedWithoutAccountStateCopyWith<$Res> {
  _$AuthenticatedWithoutAccountStateCopyWithImpl(
      AuthenticatedWithoutAccountState _value,
      $Res Function(AuthenticatedWithoutAccountState) _then)
      : super(_value, (v) => _then(v as AuthenticatedWithoutAccountState));

  @override
  AuthenticatedWithoutAccountState get _value =>
      super._value as AuthenticatedWithoutAccountState;
}

/// @nodoc

class _$AuthenticatedWithoutAccountState
    implements AuthenticatedWithoutAccountState {
  const _$AuthenticatedWithoutAccountState();

  @override
  String toString() {
    return 'AuthenticationState.authenticatedWithoutAccount()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthenticatedWithoutAccountState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unauthenticated,
    required TResult Function() authenticatedWithoutAccount,
    required TResult Function(UserProfile userProfile) authenticated,
    required TResult Function() error,
  }) {
    return authenticatedWithoutAccount();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthenticated,
    TResult Function()? authenticatedWithoutAccount,
    TResult Function(UserProfile userProfile)? authenticated,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (authenticatedWithoutAccount != null) {
      return authenticatedWithoutAccount();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialAuthState value) initial,
    required TResult Function(UnauthenticatedState value) unauthenticated,
    required TResult Function(AuthenticatedWithoutAccountState value)
        authenticatedWithoutAccount,
    required TResult Function(AuthenticatedState value) authenticated,
    required TResult Function(ErrorAuthState value) error,
  }) {
    return authenticatedWithoutAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAuthState value)? initial,
    TResult Function(UnauthenticatedState value)? unauthenticated,
    TResult Function(AuthenticatedWithoutAccountState value)?
        authenticatedWithoutAccount,
    TResult Function(AuthenticatedState value)? authenticated,
    TResult Function(ErrorAuthState value)? error,
    required TResult orElse(),
  }) {
    if (authenticatedWithoutAccount != null) {
      return authenticatedWithoutAccount(this);
    }
    return orElse();
  }
}

abstract class AuthenticatedWithoutAccountState implements AuthenticationState {
  const factory AuthenticatedWithoutAccountState() =
      _$AuthenticatedWithoutAccountState;
}

/// @nodoc
abstract class $AuthenticatedStateCopyWith<$Res> {
  factory $AuthenticatedStateCopyWith(
          AuthenticatedState value, $Res Function(AuthenticatedState) then) =
      _$AuthenticatedStateCopyWithImpl<$Res>;
  $Res call({UserProfile userProfile});

  $UserProfileCopyWith<$Res> get userProfile;
}

/// @nodoc
class _$AuthenticatedStateCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements $AuthenticatedStateCopyWith<$Res> {
  _$AuthenticatedStateCopyWithImpl(
      AuthenticatedState _value, $Res Function(AuthenticatedState) _then)
      : super(_value, (v) => _then(v as AuthenticatedState));

  @override
  AuthenticatedState get _value => super._value as AuthenticatedState;

  @override
  $Res call({
    Object? userProfile = freezed,
  }) {
    return _then(AuthenticatedState(
      userProfile == freezed
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfile,
    ));
  }

  @override
  $UserProfileCopyWith<$Res> get userProfile {
    return $UserProfileCopyWith<$Res>(_value.userProfile, (value) {
      return _then(_value.copyWith(userProfile: value));
    });
  }
}

/// @nodoc

class _$AuthenticatedState implements AuthenticatedState {
  const _$AuthenticatedState(this.userProfile);

  @override
  final UserProfile userProfile;

  @override
  String toString() {
    return 'AuthenticationState.authenticated(userProfile: $userProfile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthenticatedState &&
            (identical(other.userProfile, userProfile) ||
                const DeepCollectionEquality()
                    .equals(other.userProfile, userProfile)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(userProfile);

  @JsonKey(ignore: true)
  @override
  $AuthenticatedStateCopyWith<AuthenticatedState> get copyWith =>
      _$AuthenticatedStateCopyWithImpl<AuthenticatedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unauthenticated,
    required TResult Function() authenticatedWithoutAccount,
    required TResult Function(UserProfile userProfile) authenticated,
    required TResult Function() error,
  }) {
    return authenticated(userProfile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthenticated,
    TResult Function()? authenticatedWithoutAccount,
    TResult Function(UserProfile userProfile)? authenticated,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(userProfile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialAuthState value) initial,
    required TResult Function(UnauthenticatedState value) unauthenticated,
    required TResult Function(AuthenticatedWithoutAccountState value)
        authenticatedWithoutAccount,
    required TResult Function(AuthenticatedState value) authenticated,
    required TResult Function(ErrorAuthState value) error,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAuthState value)? initial,
    TResult Function(UnauthenticatedState value)? unauthenticated,
    TResult Function(AuthenticatedWithoutAccountState value)?
        authenticatedWithoutAccount,
    TResult Function(AuthenticatedState value)? authenticated,
    TResult Function(ErrorAuthState value)? error,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class AuthenticatedState implements AuthenticationState {
  const factory AuthenticatedState(UserProfile userProfile) =
      _$AuthenticatedState;

  UserProfile get userProfile => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthenticatedStateCopyWith<AuthenticatedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorAuthStateCopyWith<$Res> {
  factory $ErrorAuthStateCopyWith(
          ErrorAuthState value, $Res Function(ErrorAuthState) then) =
      _$ErrorAuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ErrorAuthStateCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements $ErrorAuthStateCopyWith<$Res> {
  _$ErrorAuthStateCopyWithImpl(
      ErrorAuthState _value, $Res Function(ErrorAuthState) _then)
      : super(_value, (v) => _then(v as ErrorAuthState));

  @override
  ErrorAuthState get _value => super._value as ErrorAuthState;
}

/// @nodoc

class _$ErrorAuthState implements ErrorAuthState {
  const _$ErrorAuthState();

  @override
  String toString() {
    return 'AuthenticationState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ErrorAuthState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unauthenticated,
    required TResult Function() authenticatedWithoutAccount,
    required TResult Function(UserProfile userProfile) authenticated,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthenticated,
    TResult Function()? authenticatedWithoutAccount,
    TResult Function(UserProfile userProfile)? authenticated,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialAuthState value) initial,
    required TResult Function(UnauthenticatedState value) unauthenticated,
    required TResult Function(AuthenticatedWithoutAccountState value)
        authenticatedWithoutAccount,
    required TResult Function(AuthenticatedState value) authenticated,
    required TResult Function(ErrorAuthState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialAuthState value)? initial,
    TResult Function(UnauthenticatedState value)? unauthenticated,
    TResult Function(AuthenticatedWithoutAccountState value)?
        authenticatedWithoutAccount,
    TResult Function(AuthenticatedState value)? authenticated,
    TResult Function(ErrorAuthState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorAuthState implements AuthenticationState {
  const factory ErrorAuthState() = _$ErrorAuthState;
}
