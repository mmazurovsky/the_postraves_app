part of 'artist_cubit.dart';

@freezed
abstract class ArtistState with _$ArtistState {
  const factory ArtistState.loading() = ArtistLoadingState;
  const factory ArtistState.loaded(ArtistFull artist, List<UnityShort> unities, List<EventShort> events) = ArtistLoadedState;
  const factory ArtistState.failure() = ArtistFailureState;
}
