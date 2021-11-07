import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_postraves_app/src/common/authentication/state/cubit/authentication_cubit.dart';
import 'package:the_postraves_package/models/geo/city.dart';
import 'package:the_postraves_package/models/user/user_profile_to_write.dart';
import '../../repository/firebase_image_repository_impl.dart';
import '../../repository/user_profile_repository.dart';


part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final UserProfileRepository _userProfileRepository;
  final FirebaseImageRepository _firebaseImageRepository;
  final AuthenticationCubit _authenticationBloc;

  ProfileCubit(
    this._userProfileRepository,
    this._firebaseImageRepository,
    this._authenticationBloc,
  ) : super(const ProfileState.initial());

  void createUserProfile(
      File? imageFile, String nickname, City currentCity) async {
    String? imageLink;
    if (imageFile != null) {
      final response = await _firebaseImageRepository.uploadImage(imageFile);
      imageLink = response;
    }
    final userAccountToCreate = UserProfileToWrite(
      imageLink: imageLink,
      name: nickname,
      currentCity: currentCity.name,
    );
    final createdUserAccount =
        await _userProfileRepository.createUserAccount(userAccountToCreate);

    createdUserAccount.when(
      success: (data) => _authenticationBloc.updateAuthStatus(),
      failure: (failure) {}, //TODO Exception:
    );
  }

  void updateWholeUserProfile(UserProfileToWrite userProfileToUpdate,
      [File? imageFile]) async {
    String imageLink;
    UserProfileToWrite updateProfileWithImageLink = userProfileToUpdate;
    if (imageFile != null) {
      final response = await _firebaseImageRepository.uploadImage(imageFile);
      imageLink = response;
      updateProfileWithImageLink =
          userProfileToUpdate.copyWith(imageLink: imageLink);
    }
    final updatedUserProfile = await _userProfileRepository
        .updateUserAccount(updateProfileWithImageLink);

    updatedUserProfile.when(
        success: (data) => _authenticationBloc.updateAuthStatus(),
        failure: (failure) {}); //TODO Exception:
  }

  void updateOnlyCityInUserProfile(City newCity) async {
    final userProfileBeforeUpdate = _authenticationBloc.currentUserFromBackend;
    if (userProfileBeforeUpdate != null) {
      final userProfileAfterUpdateAsWrite = userProfileBeforeUpdate
          .convertToUserProfileToWrite()
          .copyWith(currentCity: newCity.name);

      final updatedUserProfile = await _userProfileRepository
          .updateUserAccount(userProfileAfterUpdateAsWrite);

      updatedUserProfile.when(
          success: (data) => _authenticationBloc.updateAuthStatus(),
          failure: (failure) {}); //TODO Exception:
    }
  }

  Future<bool?> checkNicknameIsFree(String nickname) async {
    final response = await _userProfileRepository.checkNicknameIsFree(nickname);

    bool? isFree;
    response.when(
      success: (data) {
        final responseIsNicknameFree = data as bool;
        isFree = responseIsNicknameFree;
      },
      failure: (failure) {
        isFree = false; //TODO Exception: failure processing
      },
    );
    return isFree;
  }
}
