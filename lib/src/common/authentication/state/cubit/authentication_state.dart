part of 'authentication_cubit.dart';

@freezed
abstract class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.loading() = InitialAuthState;
  const factory AuthenticationState.unauthenticated() = UnauthenticatedState;
  const factory AuthenticationState.authenticatedWithoutAccount() = AuthenticatedWithoutAccountState;
  const factory AuthenticationState.authenticated(UserProfile userProfile) = AuthenticatedState;
  const factory AuthenticationState.error() = ErrorAuthState;
}
