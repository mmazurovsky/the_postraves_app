import 'package:freezed_annotation/freezed_annotation.dart';
import '../geo/city.dart';
import 'user_profile_to_update.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const UserProfile._();
  const factory UserProfile({
    required int id,
    required String name,
    required City currentCity,
    required int overallFollowers,
    required int weeklyFollowers,
    String? about,
    String? imageLink,
    String? instagramLink,
    String? telegramLink,
  }) = _UserProfile;

  // factory UserProfile.empty() => UserProfile(
  //       id: 0,
  //       name: 'Guest',
  //       imageLink: null,
  //       about: null,
  //       instagramLink: null,
  //       telegramLink: null,
  //       currentCity:
  //     );

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  UserProfileToUpdate createUserProfileToUpdate() {
    return UserProfileToUpdate(
      name: name,
      about: about,
      imageLink: imageLink,
      instagramLink: instagramLink,
      telegramLink: telegramLink,
      currentCity: currentCity,
    );
  }
}
