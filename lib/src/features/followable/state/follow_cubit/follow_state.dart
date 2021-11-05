part of 'follow_cubit.dart';

@freezed
abstract class FollowState with _$FollowState {
  const factory FollowState(
      {int? overallFollowers,
      int? weeklyFollowers,
      bool? isFollowed}) = _FollowState;
}
