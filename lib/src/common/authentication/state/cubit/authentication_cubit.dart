import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_postraves_package/models/user/user_profile.dart';

import '../../../../features/profile/repository/user_profile_repository.dart';
import '../../repository/firebase_auth_repository.dart';

part 'authentication_cubit.freezed.dart';
part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final FirebaseAuthRepository _firebaseRepository;
  final UserProfileRepository _userAccountRepository;

  AuthenticationCubit(
    this._firebaseRepository,
    this._userAccountRepository,
  ) : super(const AuthenticationState.loading()) {
    updateAuthStatus();
  }

  UserProfile? _currentUserFromBackend;

  UserProfile? get currentUserFromBackend => _currentUserFromBackend;

  void updateAuthStatus() async {
    if (_firebaseRepository.currentUser == null) {
      _currentUserFromBackend = null;
      emit(const AuthenticationState.unauthenticated());
    } else {
      emit(const AuthenticationState.loading());
      final response = await _userAccountRepository.getUserAccount();
      response.when(
          success: (data) {
            final userProfile = data as UserProfile?;
            _currentUserFromBackend = userProfile;
            if (userProfile == null) {
              emit(const AuthenticationState.authenticatedWithoutAccount());
            } else {
              emit(AuthenticationState.authenticated(userProfile));
            }
          },
          failure: (failure) => emit(const AuthenticationState
              .error())); //TODO Exception: specific error
    }
  }

  void startSigningWithEmailLink(String email) async {
    await _firebaseRepository.startSigningWithEmailAndLink(email: email);
  }

  void endSigningWithEmailLink(Uri link) async {
    final result =
        await _firebaseRepository.endSigningWithEmailAndLink(link: link);

    result.when(
        success: (data) => updateAuthStatus(),
        failure: (failure) => emit(const AuthenticationState
            .error())); //TODO Exception: specific error
  }

  void signInWithGoogle() async {
    final result = await _firebaseRepository.signInWithGoogle();

    result.when(
        success: (data) => updateAuthStatus(),
        failure: (failure) => emit(
            const AuthenticationState.error()) //TODO Exception: specific error
        );
  }

  void signInWithApple() async {
    final result = await _firebaseRepository.signInWithApple();

    result.when(
        success: (data) => updateAuthStatus(),
        failure: (failure) => emit(
            const AuthenticationState.error()) //TODO Exception: specific error
        );
  }

  void signOut() async {
    await _firebaseRepository.signOut();
    updateAuthStatus();
  }

  void deleteMyProfile() async {
    final response = await _firebaseRepository.deleteMyProfile();
    response.when(
      failure: (failure) async {
        // TODO: if user logs in again, he can delete and it hopefully be deleted ok
        await _firebaseRepository.signOut();
        updateAuthStatus();
      },
      success: (success) {
        updateAuthStatus();
      },
    );
    // Could also delete from backend
  }
}
