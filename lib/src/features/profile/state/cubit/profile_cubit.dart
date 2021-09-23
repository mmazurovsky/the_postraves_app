import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/authentication/state/cubit/authentication_cubit.dart';
import '../../repository/firebase_image_repository_impl.dart';
import '../../repository/user_profile_repository_impl.dart';
import '../../../../models/geo/city.dart';
import '../../../../models/user/user_profile_to_create.dart';
import '../../../../models/user/user_profile_to_update.dart';

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
  ) : super(ProfileState.initial());

  void createUserProfile(
      File? imageFile, String nickname, City currentCity) async {
    String? imageLink;
    if (imageFile != null) {
      final response = await _firebaseImageRepository.uploadImage(imageFile);
      imageLink = response;
    }
    final userAccountToCreate = UserProfileToCreate(
      imageLink: imageLink,
      name: nickname,
      currentCity: currentCity,
    );
    final createdUserAccount =
        await _userProfileRepository.createUserAccount(userAccountToCreate);

    createdUserAccount.when(
      success: (data) => _authenticationBloc.updateAuthStatus(),
      failure: (failure, failureMessage) {}, //todo
    );
  }

  void updateUserProfile(UserProfileToUpdate userProfileToUpdate,
      [File? imageFile]) async {
    String imageLink;
    UserProfileToUpdate updateProfileWithImageLink = userProfileToUpdate;
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
        failure: (failure, failureMessage) {}); //todo
  }
}
