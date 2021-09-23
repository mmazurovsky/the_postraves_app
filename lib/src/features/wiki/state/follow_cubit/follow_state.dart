part of 'follow_cubit.dart';

@freezed
abstract class FollowState with _$FollowState {
  const factory FollowState.unclear() = UnclearFollowState;
  const factory FollowState.followed() = FollowedFollowState;
  const factory FollowState.unfollowed() = UnfollowedFollowState;
}
