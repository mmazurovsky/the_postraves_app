import 'package:the_postraves_app/src/common/utils/localized_get_request.dart';
import 'package:the_postraves_package/client/remote_client.dart';
import 'package:the_postraves_package/constants/server_constants.dart';
import 'package:the_postraves_package/dto/followable_type.dart';
import 'package:the_postraves_package/errors/exceptions.dart';
import 'package:the_postraves_package/models/user/user_profile.dart';
import 'package:the_postraves_package/models/user/user_profile_to_write.dart';

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
    final decodedResponse =
        await LocalizedGetRequest.makeGetRequestAndReturnResponse(
      endpointWithPath: FollowableType.USER.endpoint + '/public/myProfile',
      httpHeaders: httpHeaders,
    );
    return decodedResponse == null
        ? null
        : UserProfile.fromJson(decodedResponse);
  }

  @override
  Future<void> createUserProfile(
      {required Map<String, String> httpHeaders,
      required UserProfileToWrite userAccountToCreate}) async {
    await RemoteClient.makePostRequestAndReturnResponse(
      host: ServerConstants.apiHost,
      hostPath: ServerConstants.apiPath,
      endpointWithPath: FollowableType.USER.endpoint + '/public/myProfile',
      httpHeaders: httpHeaders,
      body: userAccountToCreate.toJson(),
    );
    return;
  }

  @override
  Future<bool> checkNicknameIsFree(
      {required Map<String, String> httpHeaders,
      required String nickname}) async {
    dynamic decodedResponse =
        await LocalizedGetRequest.makeGetRequestAndReturnResponse(
      endpointWithPath:
          FollowableType.USER.endpoint + '/public/nicknameCheck/$nickname',
      httpHeaders: httpHeaders,
    );
    return decodedResponse;
  }

  @override
  Future<void> updateUserProfile({
    required Map<String, String> httpHeaders,
    required UserProfileToWrite updatedUserProfile,
  }) async {
    await RemoteClient.makePutRequestAndReturnResponse(
      host: ServerConstants.apiHost,
      hostPath: ServerConstants.apiPath,
      endpointWithPath: FollowableType.USER.endpoint + '/myProfile',
      httpHeaders: httpHeaders,
      body: updatedUserProfile.toJson(),
    );
    return;
  }
}
