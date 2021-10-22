import 'package:equatable/equatable.dart';

//TODO:
abstract class Failure extends Equatable {
  Failure([this.properties = const <dynamic>[]]);
  List properties;

  @override
  List<Object> get props => [properties];
}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class DeviceNetworkFailure extends Failure {}

abstract class AuthenticationFailure extends Failure {}

class UserNotFoundFailure extends AuthenticationFailure {}

class SignInViaGoogleFailure extends AuthenticationFailure {}
