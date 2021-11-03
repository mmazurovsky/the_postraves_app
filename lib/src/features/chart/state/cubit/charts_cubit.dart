import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_postraves_package/models/geo/city.dart';
import 'package:the_postraves_package/models/shorts/artist_short.dart';
import '../../repository/charts_repository.dart';

part 'charts_state.dart';
part 'charts_cubit.freezed.dart';

class ChartsCubit extends Cubit<ChartsState> {
  final ChartsRepository<ArtistShort> artistChartsRepository;

  ChartsCubit(this.artistChartsRepository) : super(const ChartsState.loading());

  void refreshCharts(City currentCity) async {
    emit(const ChartsState.refreshing());
    _loadCharts(currentCity);
  }

  void showCharts(City currentCity) async {
    emit(const ChartsState.loading());
    _loadCharts(currentCity);
  }

  void _loadCharts(City currentCity) async {
    final overallArtists =
        artistChartsRepository.fetchOverallChart(currentCity);
    final weeklyArtists = artistChartsRepository.fetchWeeklyChart(currentCity);
    final bestArtist = artistChartsRepository.fetchWeeklyBest(currentCity);

    final resolvedOverallArtists = await overallArtists;
    final resolvedWeeklyArtists = await weeklyArtists;
    final resolvedBestArtist = await bestArtist;

    List<ArtistShort> stateOverallArtists = [];
    List<ArtistShort> stateWeeklyArtists = [];
    ArtistShort? stateBestArtist;

    resolvedOverallArtists.when(
        success: (data) => stateOverallArtists = data,
        failure: (failure, data) => {}); //TODO Exception:

    resolvedWeeklyArtists.when(
        success: (data) => stateWeeklyArtists = data,
        failure: (failure, data) => {}); //TODO Exception:

    resolvedBestArtist.when(
        success: (data) => stateBestArtist = data,
        failure: (failure, data) => {}); //TODO Exception:

    emit(ChartsState.loaded(
        stateBestArtist, stateWeeklyArtists, stateOverallArtists));
  }
}
