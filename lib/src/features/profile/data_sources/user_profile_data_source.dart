import 'package:the_postraves_package/client/http_method_enum.dart';
import 'package:the_postraves_package/client/localized_request.dart';
import 'package:the_postraves_package/client/remote_request.dart';
import 'package:the_postraves_package/constants/server_constants.dart';
import 'package:the_postraves_package/dto/followable_type.dart';
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
  final RemoteRequest _remoteRequest;
  final LocalizedGetRequest _localizedGetRequest;
  final ServerConstantsAbstract _serverConstantsAbstract;

  UserProfileDataSourceImpl(
    this._remoteRequest,
    this._localizedGetRequest,
    this._serverConstantsAbstract,
  );

  @override
  Future<UserProfile?> getUserAccount(
      {required Map<String, String> httpHeaders}) async {
    final decodedResponse = await _localizedGetRequest(
      endpointWithPath: FollowableType.USER.path + '/public/myProfile',
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
    await _remoteRequest(
      isHttps: _serverConstantsAbstract.isHttps,
      httpMethod: HttpMethod.post,
      host: _serverConstantsAbstract.apiHost,
      hostPath: _serverConstantsAbstract.apiPath,
      endpointWithPath: FollowableType.USER.path + '/public/myProfile',
      httpHeaders: httpHeaders,
      body: userAccountToCreate.toJson(),
    );
    return;
  }

  @override
  Future<bool> checkNicknameIsFree(
      {required Map<String, String> httpHeaders,
      required String nickname}) async {
    dynamic decodedResponse = await _localizedGetRequest(
      endpointWithPath:
          FollowableType.USER.path + '/public/nicknameCheck/$nickname',
      httpHeaders: httpHeaders,
    );
    return decodedResponse;
  }

  @override
  Future<void> updateUserProfile({
    required Map<String, String> httpHeaders,
    required UserProfileToWrite updatedUserProfile,
  }) async {
    await _remoteRequest(
      isHttps: _serverConstantsAbstract.isHttps,
      httpMethod: HttpMethod.put,
      host: _serverConstantsAbstract.apiHost,
      hostPath: _serverConstantsAbstract.apiPath,
      endpointWithPath: FollowableType.USER.path + '/myProfile',
      httpHeaders: httpHeaders,
      body: updatedUserProfile.toJson(),
    );
    return;
  }
}
