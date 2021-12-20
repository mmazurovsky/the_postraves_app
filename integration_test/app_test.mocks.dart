// Mocks generated by Mockito 5.0.15 from annotations
// in the_postraves_app/test/integration_test/app_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:firebase_auth/firebase_auth.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;
import 'package:the_postraves_app/src/common/authentication/repository/firebase_auth_repository.dart'
    as _i6;
import 'package:the_postraves_app/src/common/geo_repository/city_local_repository.dart'
    as _i3;
import 'package:the_postraves_package/client/response_sealed.dart' as _i2;
import 'package:the_postraves_package/models/geo/city.dart' as _i5;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeResponseSealed_0<DATA> extends _i1.Fake
    implements _i2.ResponseSealed<DATA> {}

/// A class which mocks [CityLocalRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockCityLocalRepository extends _i1.Mock
    implements _i3.CityLocalRepository {
  MockCityLocalRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.ResponseSealed<List<_i5.City>>> fetchCitiesFromLocal() =>
      (super.noSuchMethod(Invocation.method(#fetchCitiesFromLocal, []),
              returnValue: Future<_i2.ResponseSealed<List<_i5.City>>>.value(
                  _FakeResponseSealed_0<List<_i5.City>>()))
          as _i4.Future<_i2.ResponseSealed<List<_i5.City>>>);
  @override
  _i4.Future<_i2.ResponseSealed<_i5.City?>> fetchCurrentCityFromLocal() =>
      (super.noSuchMethod(Invocation.method(#fetchCurrentCityFromLocal, []),
              returnValue: Future<_i2.ResponseSealed<_i5.City?>>.value(
                  _FakeResponseSealed_0<_i5.City?>()))
          as _i4.Future<_i2.ResponseSealed<_i5.City?>>);
  @override
  _i4.Future<_i2.ResponseSealed<void>> saveCitiesToLocalAndDeletePrevious(
          List<_i5.City>? cities) =>
      (super.noSuchMethod(
              Invocation.method(#saveCitiesToLocalAndDeletePrevious, [cities]),
              returnValue: Future<_i2.ResponseSealed<void>>.value(
                  _FakeResponseSealed_0<void>()))
          as _i4.Future<_i2.ResponseSealed<void>>);
  @override
  _i4.Future<_i2.ResponseSealed<void>> saveCurrentCityToLocalAndDeletePrevious(
          _i5.City? city) =>
      (super.noSuchMethod(
          Invocation.method(#saveCurrentCityToLocalAndDeletePrevious, [city]),
          returnValue: Future<_i2.ResponseSealed<void>>.value(
              _FakeResponseSealed_0<void>())) as _i4
          .Future<_i2.ResponseSealed<void>>);
  @override
  _i4.Future<_i2.ResponseSealed<void>> removeCurrentCityFromLocal() =>
      (super.noSuchMethod(Invocation.method(#removeCurrentCityFromLocal, []),
              returnValue: Future<_i2.ResponseSealed<void>>.value(
                  _FakeResponseSealed_0<void>()))
          as _i4.Future<_i2.ResponseSealed<void>>);
  @override
  _i4.Future<_i2.ResponseSealed<void>> removeCitiesFromLocal() =>
      (super.noSuchMethod(Invocation.method(#removeCitiesFromLocal, []),
              returnValue: Future<_i2.ResponseSealed<void>>.value(
                  _FakeResponseSealed_0<void>()))
          as _i4.Future<_i2.ResponseSealed<void>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [FirebaseAuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockFirebaseAuthRepository extends _i1.Mock
    implements _i6.FirebaseAuthRepository {
  MockFirebaseAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Stream<_i7.User?> get userStream =>
      (super.noSuchMethod(Invocation.getter(#userStream),
          returnValue: Stream<_i7.User?>.empty()) as _i4.Stream<_i7.User?>);
  @override
  _i4.Future<_i2.ResponseSealed<_i7.UserCredential>> signUpWithEmailAndPassword(
          {String? email, String? password}) =>
      (super.noSuchMethod(
              Invocation.method(#signUpWithEmailAndPassword, [],
                  {#email: email, #password: password}),
              returnValue: Future<_i2.ResponseSealed<_i7.UserCredential>>.value(
                  _FakeResponseSealed_0<_i7.UserCredential>()))
          as _i4.Future<_i2.ResponseSealed<_i7.UserCredential>>);
  @override
  _i4.Future<_i2.ResponseSealed<_i7.UserCredential>> signInWithEmailAndPassword(
          {String? email, String? password}) =>
      (super.noSuchMethod(
              Invocation.method(#signInWithEmailAndPassword, [],
                  {#email: email, #password: password}),
              returnValue: Future<_i2.ResponseSealed<_i7.UserCredential>>.value(
                  _FakeResponseSealed_0<_i7.UserCredential>()))
          as _i4.Future<_i2.ResponseSealed<_i7.UserCredential>>);
  @override
  _i4.Future<_i2.ResponseSealed<void>> startSigningWithEmailAndLink(
          {String? email}) =>
      (super.noSuchMethod(
          Invocation.method(#startSigningWithEmailAndLink, [], {#email: email}),
          returnValue: Future<_i2.ResponseSealed<void>>.value(
              _FakeResponseSealed_0<void>())) as _i4
          .Future<_i2.ResponseSealed<void>>);
  @override
  _i4.Future<_i2.ResponseSealed<_i7.UserCredential>> endSigningWithEmailAndLink(
          {Uri? link}) =>
      (super.noSuchMethod(
              Invocation.method(#endSigningWithEmailAndLink, [], {#link: link}),
              returnValue: Future<_i2.ResponseSealed<_i7.UserCredential>>.value(
                  _FakeResponseSealed_0<_i7.UserCredential>()))
          as _i4.Future<_i2.ResponseSealed<_i7.UserCredential>>);
  @override
  _i4.Future<_i2.ResponseSealed<_i7.UserCredential>> signInWithGoogle() =>
      (super.noSuchMethod(Invocation.method(#signInWithGoogle, []),
              returnValue: Future<_i2.ResponseSealed<_i7.UserCredential>>.value(
                  _FakeResponseSealed_0<_i7.UserCredential>()))
          as _i4.Future<_i2.ResponseSealed<_i7.UserCredential>>);
  @override
  _i4.Future<_i2.ResponseSealed<_i7.UserCredential>> signInWithApple() =>
      (super.noSuchMethod(Invocation.method(#signInWithApple, []),
              returnValue: Future<_i2.ResponseSealed<_i7.UserCredential>>.value(
                  _FakeResponseSealed_0<_i7.UserCredential>()))
          as _i4.Future<_i2.ResponseSealed<_i7.UserCredential>>);
  @override
  _i4.Future<_i2.ResponseSealed<void>> signOut() =>
      (super.noSuchMethod(Invocation.method(#signOut, []),
              returnValue: Future<_i2.ResponseSealed<void>>.value(
                  _FakeResponseSealed_0<void>()))
          as _i4.Future<_i2.ResponseSealed<void>>);
  @override
  _i4.Future<_i2.ResponseSealed<void>> deleteMyProfile() =>
      (super.noSuchMethod(Invocation.method(#deleteMyProfile, []),
              returnValue: Future<_i2.ResponseSealed<void>>.value(
                  _FakeResponseSealed_0<void>()))
          as _i4.Future<_i2.ResponseSealed<void>>);
  @override
  bool isSignInWithEmailLink(String? link) =>
      (super.noSuchMethod(Invocation.method(#isSignInWithEmailLink, [link]),
          returnValue: false) as bool);
  @override
  String toString() => super.toString();
}
