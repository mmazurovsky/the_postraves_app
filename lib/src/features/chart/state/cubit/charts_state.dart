part of 'charts_cubit.dart';

@freezed
class ChartsState with _$ChartsState {
  factory ChartsState.initial() = _Initial;
  const factory ChartsState.loading() = _Loading;
  const factory ChartsState.loaded(ArtistShort? bestArtist, List<ArtistShort>? weeklyArtists, List<ArtistShort>? overallArtists, ) = _Loaded;
  const factory ChartsState.error(String error) = _Error;
}