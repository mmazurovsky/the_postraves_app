import 'package:freezed_annotation/freezed_annotation.dart';


part 'user_profile_to_write.freezed.dart';
part 'user_profile_to_write.g.dart';

@freezed
class UserProfileToWrite with _$UserProfileToWrite {
  const factory UserProfileToWrite({
    required String name,
    required String currentCity,
    String? about,
    String? imageLink,
    String? instagramUsername,
    String? telegramUsername,
  }) = _UserProfileToWrite;

  factory UserProfileToWrite.fromJson(Map<String, dynamic> json) =>
      _$UserProfileToWriteFromJson(json);
}
