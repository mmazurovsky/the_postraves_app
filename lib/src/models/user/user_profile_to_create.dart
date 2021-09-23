import 'package:freezed_annotation/freezed_annotation.dart';
import '../geo/city.dart';

part 'user_profile_to_create.freezed.dart';
part 'user_profile_to_create.g.dart';

@freezed
class UserProfileToCreate with _$UserProfileToCreate {
  const factory UserProfileToCreate({
    required String name,
    String? imageLink,
    required City currentCity,
  }) = _UserProfileToCreate;

  factory UserProfileToCreate.fromJson(Map<String, dynamic> json) =>
      _$UserProfileToCreateFromJson(json);
}
