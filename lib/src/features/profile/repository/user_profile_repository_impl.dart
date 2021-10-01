import '../../../core/client/data_sealed/response_sealed.dart';
import '../../../models/user/user_profile.dart';
import '../../../models/user/user_profile_to_write.dart';

import '../../../core/client/remote_request_wrapper.dart';
import '../data_sources/user_profile_data_source.dart';

abstract class UserProfileRepository {
  Future<ResponseSealed<UserProfile?>> getUserAccount();
  Future<ResponseSealed<void>> createUserAccount(
      UserProfileToWrite userAccountToCreate);
  Future<ResponseSealed<void>> updateUserAccount(
      UserProfileToWrite updatedUserAccount);
  Future<ResponseSealed<bool>> checkNicknameIsFree(String nickname);
}

class UserProfileRepositoryImpl implements UserProfileRepository {
  final RemoteRequestWrapper<UserProfile?> remoteRequestWrapperUserAccount;
  final RemoteRequestWrapper<bool> remoteRequestWrapperNicknameChecking;
  final UserProfileDataSource userAccountDataSource;

  UserProfileRepositoryImpl(
    this.remoteRequestWrapperUserAccount,
    this.remoteRequestWrapperNicknameChecking,
    this.userAccountDataSource,
  );

  @override
  Future<ResponseSealed<UserProfile?>> getUserAccount() async {
    return await remoteRequestWrapperUserAccount(
        (httpHeaders) => userAccountDataSource.getUserAccount(
              httpHeaders: httpHeaders,
            ));
  }

  @override
  Future<ResponseSealed<bool>> checkNicknameIsFree(String nickname) async {
    return await remoteRequestWrapperNicknameChecking((httpHeaders) =>
        userAccountDataSource.checkNicknameIsFree(
            httpHeaders: httpHeaders, nickname: nickname));
  }

  @override
  Future<ResponseSealed<void>> createUserAccount(
      UserProfileToWrite userAccountToCreate) async {
    return await remoteRequestWrapperUserAccount(
        (httpHeaders) => userAccountDataSource.createUserProfile(
              httpHeaders: httpHeaders,
              userAccountToCreate: userAccountToCreate,
            ));
  }

  @override
  Future<ResponseSealed<void>> updateUserAccount(
      UserProfileToWrite updatedUserAccount) async {
    return await remoteRequestWrapperUserAccount(
        (httpHeaders) => userAccountDataSource.updateUserProfile(
              httpHeaders: httpHeaders,
              updatedUserProfile: updatedUserAccount,
            ));
  }
}
