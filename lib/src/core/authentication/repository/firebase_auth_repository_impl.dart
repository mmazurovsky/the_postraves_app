import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:the_postraves_app/src/core/utils/my_constants.dart';
import '../../client/data_sealed/response_sealed.dart';
import '../../error/failures.dart';

abstract class FirebaseAuthRepository {
  Future<ResponseSealed<UserCredential>> signUpWithEmailAndPassword(
      {required String email, required String password});
  Future<ResponseSealed<UserCredential>> signInWithEmailAndPassword(
      {required String email, required String password});
  Future<ResponseSealed<void>> startSigningWithEmailAndLink(
      {required String email});
  Future<ResponseSealed<UserCredential>> endSigningWithEmailAndLink(
      {required Uri link});
  Future<ResponseSealed<UserCredential>> signInWithGoogle();
  Future<ResponseSealed<UserCredential>> signInWithApple();
  Future<ResponseSealed<void>> signOut();
  User? get currentUser;
  Stream<User?> get userStream;
  bool isSignInWithEmailLink(String link);
}

class FirebaseAuthRepositioryImpl implements FirebaseAuthRepository {
  final FirebaseAuth _firebaseAuth;
  String? _storedEmailForLinkVerification;
  String? phoneVerificationId;
  int? phoneForceResendingToken;

  FirebaseAuthRepositioryImpl(this._firebaseAuth);

  @override
  User? get currentUser {
    User? user;
    try {
      user = _firebaseAuth.currentUser;
    } on FirebaseAuthException catch (e) {
      //todo
      signOut();
    }
    return user;
  }

  @override
  Stream<User?> get userStream => _firebaseAuth.userChanges();

  @override
  Future<ResponseSealed<UserCredential>> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final userCredentials = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return ResponseSealed.success(userCredentials);
    } on FirebaseAuthException catch (e) {
      //todo
      // todo map error codes to failures
      return ResponseSealed.failure(UserNotFoundFailure());
    }
  }

  @override
  Future<ResponseSealed<UserCredential>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final userCredentials = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return ResponseSealed.success(userCredentials);
    } on FirebaseAuthException catch (e) {
      //todo
      // todo map error codes to failures
      return ResponseSealed.failure(UserNotFoundFailure());
    }
  }

  @override
  Future<ResponseSealed<void>> startSigningWithEmailAndLink(
      {required String email}) async {
    ActionCodeSettings actionCodeSettings = ActionCodeSettings(
      url: 'https://thepostravesapp.page.link',
      // 'https://postraves.com',
      androidPackageName: MyConstants.androidPackageName,
      iOSBundleId: MyConstants.iosBundleId,
      handleCodeInApp: true,
      androidInstallApp: true,
    );

    try {
      await _firebaseAuth.sendSignInLinkToEmail(
          email: email, actionCodeSettings: actionCodeSettings);
    } on Exception catch (e) {
      //todo
    }

    _storedEmailForLinkVerification = email;
    return const ResponseSealed.success(null);
  }

  @override
  Future<ResponseSealed<UserCredential>> endSigningWithEmailAndLink(
      {required Uri link}) async {
    if (_firebaseAuth.isSignInWithEmailLink(link.toString())) {
      try {
        final userCredentials = await _firebaseAuth.signInWithEmailLink(
            email: _storedEmailForLinkVerification!,
            emailLink: link.toString());
        return ResponseSealed.success(userCredentials);
      } on FirebaseAuthException catch (e) {
        //todo
        // todo map error codes to failures
        return ResponseSealed.failure(UserNotFoundFailure());
      }
    } else {
      return ResponseSealed.failure(UserNotFoundFailure());
    }
  }

  @override
  bool isSignInWithEmailLink(String link) {
    return _firebaseAuth.isSignInWithEmailLink(link);
  }

  @override
  Future<ResponseSealed<UserCredential>> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    GoogleSignInAuthentication googleAuth;
    try {
      googleAuth = await googleUser!.authentication;
    } on NoSuchMethodError catch (e) {
      log('Google sign in has been cancelled: ${e.toString()}');
      return ResponseSealed.failure(SignInViaGoogleFailure());
    }

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    try {
      final userCredentials =
          await _firebaseAuth.signInWithCredential(credential);
      return ResponseSealed.success(userCredentials);
    } on FirebaseAuthException catch (e) {
      // todo map error codes to failures
      return ResponseSealed.failure(UserNotFoundFailure());
    }
  }

  @override
  Future<ResponseSealed<UserCredential>> signInWithApple() {
    // TODO: implement signInWithApple
    throw UnimplementedError();
  }

  @override
  Future<ResponseSealed<void>> signOut() async {
    try {
      return ResponseSealed.success(await _firebaseAuth.signOut());
    } on FirebaseAuthException catch (e) {
      // todo
      return ResponseSealed.failure(UserNotFoundFailure());
    }
  }
}
