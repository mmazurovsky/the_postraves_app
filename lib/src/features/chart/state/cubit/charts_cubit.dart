import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_postraves_app/src/features/followable/state/followable_change_notifier.dart';
import 'package:the_postraves_package/models/geo/city.dart';
import 'package:the_postraves_package/models/shorts/artist_short.dart';

import '../../repository/charts_repository.dart';

part 'charts_cubit.freezed.dart';
part 'charts_state.dart';

class ChartsCubit extends Cubit<ChartsState> {
  final ChartsRepository<ArtistShort> artistChartsRepository;
  final FollowableChangeNotifier followableChangeNotifier;

  ChartsCubit(this.artistChartsRepository, this.followableChangeNotifier)
      : super(const ChartsState.loading());

  List<ArtistShort> _stateOverallArtists = [];
  List<ArtistShort> _stateWeeklyArtists = [];
  ArtistShort? _stateBestArtist;

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
    // final bestArtist = artistChartsRepository.fetchWeeklyBest(currentCity);

    final resolvedOverallArtists = await overallArtists;
    final resolvedWeeklyArtists = await weeklyArtists;
    // final resolvedBestArtist = await bestArtist;

    resolvedOverallArtists.when(
        success: (data) => _stateOverallArtists = data,
        failure: (failure) => {}); //TODO Exception:

    resolvedWeeklyArtists.when(
        success: (data) => _stateWeeklyArtists = data,
        failure: (failure) => {}); //TODO Exception:

    // resolvedBestArtist.when(
    //     success: (data) => _stateBestArtist = data,
    //     failure: (failure) => {}); //TODO Exception:

     _updateFollowableChangeNotifier();

    emit(ChartsState.loaded(
      _stateWeeklyArtists.first,
      _stateWeeklyArtists,
      _stateOverallArtists,
    ));
  }

  void _updateFollowableChangeNotifier() {
    followableChangeNotifier
        .updateFollowablesBasedOnArtistList(_stateOverallArtists);
    followableChangeNotifier
        .updateFollowablesBasedOnArtistList(_stateWeeklyArtists);
    // if (_stateBestArtist != null) {
    //   followableChangeNotifier
    //       .updateFollowablesBasedOnArtistList([_stateBestArtist!]);
    // }
  }
}
