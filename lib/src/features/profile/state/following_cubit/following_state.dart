part of 'following_cubit.dart';

@freezed
class FollowingState with _$FollowingState {
  const factory FollowingState.loading() = FollowingLoadingState;
  const factory FollowingState.loaded({
    required List<EventShort> events,
    required List<ArtistShort> artists,
    required List<PlaceShort> places,
    required List<UnityShort> unities,
  }) = FollowingLoadedState;
}
