import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../repository/firebase_auth_repository_impl.dart';
import '../../../../features/profile/repository/user_profile_repository_impl.dart';
import '../../../../models/user/user_profile.dart';

part 'authentication_state.dart';
part 'authentication_cubit.freezed.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final FirebaseAuthRepository _firebaseRepository;
  final UserProfileRepository _userAccountRepository;

  AuthenticationCubit(this._firebaseRepository, this._userAccountRepository)
      : super(const AuthenticationState.initial());

  void updateAuthStatus() async {
    if (_firebaseRepository.currentUser == null) {
      emit(const AuthenticationState.unauthenticated());
    } else {
      emit(const AuthenticationState.initial());
      final response = await _userAccountRepository.getUserAccount();
      response.when(
          success: (data) {
            final userProfile = data as UserProfile?;
            if (userProfile == null) {
              emit(const AuthenticationState.authenticatedWithoutAccount());
            } else {
              emit(AuthenticationState.authenticated(userProfile));
            }
          },
          failure: (failure, message) =>
              emit(const AuthenticationState.error())); //todo specific error
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
        failure: (failure, errorMessage) =>
            emit(const AuthenticationState.error())); //todo specific error
  }

  void signInWithGoogle() async {
    final result = await _firebaseRepository.signInWithGoogle();

    result.when(
        success: (data) => updateAuthStatus(),
        failure: (failure, errorMessage) =>
            emit(const AuthenticationState.error()) //todo specific error
        );
  }

  void singOut() async {
    await _firebaseRepository.signOut();
    updateAuthStatus();
  }
}
