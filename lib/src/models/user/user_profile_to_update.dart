import 'package:freezed_annotation/freezed_annotation.dart';
import '../geo/city.dart';


part 'user_profile_to_update.freezed.dart';
part 'user_profile_to_update.g.dart';

@freezed
class UserProfileToUpdate with _$UserProfileToUpdate {
  const factory UserProfileToUpdate({
    required String name,
    required City currentCity,
    String? about,
    String? imageLink,
    String? instagramLink,
    String? telegramLink,
  }) = _UserProfileToUpdate;

  factory UserProfileToUpdate.fromJson(Map<String, dynamic> json) =>
      _$UserProfileToUpdateFromJson(json);
}
