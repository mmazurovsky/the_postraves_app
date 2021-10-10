part of 'follow_cubit.dart';

@freezed
abstract class FollowState with _$FollowState {
  const factory FollowState(int? followers, bool? isFollowed) = _FollowState;
  }
