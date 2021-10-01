import 'package:the_postraves_app/src/models/enum/wiki_rating_type.dart';

import '../../../models/user/user_profile.dart';
import '../../../models/user/user_profile_to_write.dart';

import '../../../core/client/remote_client.dart';
import '../../../core/error/exceptions.dart';

abstract class UserProfileDataSource {
  Future<UserProfile?> getUserAccount(
      {required Map<String, String> httpHeaders});
  Future<void> createUserProfile(
      {required Map<String, String> httpHeaders,
      required UserProfileToWrite userAccountToCreate});
  Future<void> updateUserProfile(
      {required Map<String, String> httpHeaders,
      required UserProfileToWrite updatedUserProfile});
  Future<bool> checkNicknameIsFree(
      {required Map<String, String> httpHeaders, required String nickname});
}

class UserProfileDataSourceImpl implements UserProfileDataSource {
  @override
  Future<UserProfile?> getUserAccount(
      {required Map<String, String> httpHeaders}) async {
    final decodedResponse = await RemoteClient.makeGetRequestAndReturnResponse(
        endpointWithPath: WikiFollowableType.USER.endpoint + '/public/myProfile',
        httpHeaders: httpHeaders,
      );
    return decodedResponse == null ? null : UserProfile.fromJson(decodedResponse); //todo check response for null
  }

  @override
  Future<void> createUserProfile(
      {required Map<String, String> httpHeaders,
      required UserProfileToWrite userAccountToCreate}) async {
    try {
      final response = await RemoteClient.makePostRequestAndReturnResponse(
        endpointWithPath: WikiFollowableType.USER.endpoint + '/public/myProfile',
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
            WikiFollowableType.USER.endpoint + '/public/nicknameCheck/$nickname',
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
    required UserProfileToWrite updatedUserProfile,
  }) async {
    try {
      await RemoteClient.makePutRequestAndReturnResponse(
        endpointWithPath: WikiFollowableType.USER.endpoint + '/myProfile',
        httpHeaders: httpHeaders,
        body: updatedUserProfile.toJson(),
      );
    } on Exception {
      throw ServerException();
    }
    return;
  }
}
