import '../../../core/utils/my_constants.dart';
import '../../../models/user/user_profile.dart';
import '../../../models/user/user_profile_to_create.dart';
import '../../../models/user/user_profile_to_update.dart';

import '../../../core/client/remote_client.dart';
import '../../../core/error/exceptions.dart';

abstract class UserProfileDataSource {
  Future<UserProfile?> getUserAccount(
      {required Map<String, String> httpHeaders});
  Future<void> createUserProfile(
      {required Map<String, String> httpHeaders,
      required UserProfileToCreate userAccountToCreate});
  Future<void> updateUserProfile(
      {required Map<String, String> httpHeaders,
      required UserProfileToUpdate updatedUserProfile});
  Future<bool> checkNicknameIsFree(
      {required Map<String, String> httpHeaders, required String nickname});
}

class UserProfileDataSourceImpl implements UserProfileDataSource {
  @override
  Future<UserProfile?> getUserAccount(
      {required Map<String, String> httpHeaders}) async {
    dynamic decodedResponse;

    try {
      decodedResponse = await RemoteClient.makeGetRequestAndReturnResponse(
        endpointWithPath: MyConstants.usersEndpoint + '/public/myAccount',
        httpHeaders: httpHeaders,
      );
    } on Exception {
      throw ServerException();
    }
    return decodedResponse == null ? null : UserProfile.fromJson(decodedResponse); //todo check response for null
  }

  @override
  Future<void> createUserProfile(
      {required Map<String, String> httpHeaders,
      required UserProfileToCreate userAccountToCreate}) async {
    try {
      await RemoteClient.makePostRequestAndReturnResponse(
        endpointWithPath: MyConstants.usersEndpoint + '/public/myAccount',
        httpHeaders: httpHeaders,
        body: userAccountToCreate.toJson(),
      );
    } on Exception {
      throw ServerException();
    }
    return;
  }

  @override
  Future<bool> checkNicknameIsFree(
      {required Map<String, String> httpHeaders,
      required String nickname}) async {
    dynamic decodedResponse;

    try {
      decodedResponse = await RemoteClient.makeGetRequestAndReturnResponse(
        endpointWithPath:
            MyConstants.usersEndpoint + '/public/nicknameChecking/$nickname',
        httpHeaders: httpHeaders,
      );
    } on Exception {
      throw ServerException();
    }
    return decodedResponse;
  }

  @override
  Future<void> updateUserProfile({
    required Map<String, String> httpHeaders,
    required UserProfileToUpdate updatedUserProfile,
  }) async {
    try {
      await RemoteClient.makePutRequestAndReturnResponse(
        endpointWithPath: MyConstants.usersEndpoint + '/public/myAccount',
        httpHeaders: httpHeaders,
        body: updatedUserProfile.toJson(),
      );
    } on Exception {
      throw ServerException();
    }
    return;
  }
}
