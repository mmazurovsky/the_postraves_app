part of 'unity_cubit.dart';

@freezed
abstract class UnityState with _$UnityState {
  const factory UnityState.loading() = UnityLoadingState;
  const factory UnityState.loaded(UnityFull unity, List<ArtistShort> artists, List<EventShort> events) = UnityLoadedState;
  const factory UnityState.failure() = UnityFailureState;
}
