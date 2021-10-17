part of 'charts_cubit.dart';

@freezed
class ChartsState with _$ChartsState {
  const factory ChartsState.loading() = ChartsStateLoading;
  const factory ChartsState.refreshing() = ChartsStateRefreshing;
  const factory ChartsState.loaded(
    ArtistShort? bestArtist,
    List<ArtistShort> weeklyArtists,
    List<ArtistShort> overallArtists,
  ) = ChartsStateLoaded;
  const factory ChartsState.error(String error) = ChartsStateError;
}
