import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/client/data_sealed/response_sealed.dart';
import '../../repository/shows_repository_impl.dart';
import '../view_switcher_cubit/view_switcher_cubit_cubit.dart';
import '../../../../models/enum/view_mode.dart';
import '../../../../models/geo/city.dart';
import '../../../../models/related_to_event/shows_by_date.dart';
import '../../../../models/shorts/event_short.dart';

part 'shows_state.dart';
part 'shows_cubit.freezed.dart';

class ShowsCubit extends Cubit<ShowsState> {
  final ShowsRepository showsRepository;
  final ViewSwitcherCubit viewSwitcherBloc;
  late StreamSubscription _viewSwitcherBlocSubscription;
  List<EventShort>? _eventsByRating;
  List<ShowsByDate>? _eventsByDate;
  ViewMode? _currentView;

  ShowsCubit({
    required this.showsRepository,
    required this.viewSwitcherBloc,
  }) : super(ShowsState.loading()) {
    _viewSwitcherBlocSubscription =
        viewSwitcherBloc.stream.listen((viewSwitcherState) {
      if (viewSwitcherState is ByDateViewState) {
        _currentView = ViewMode.SORT_BY_DATE;
        showByDateView();
      } else if (viewSwitcherState is ByRatingViewState) {
        _currentView = ViewMode.SORT_BY_RATING;
        showByRatingView();
      }
    });
  }

  @override
  Future<void> close() async {
    _viewSwitcherBlocSubscription.cancel();
    return super.close();
  }

  void fullyLoadShows(City currentCity) {
    emit(ShowsState.loading());
    _loadShowsAndResolveView(currentCity);
  }

  void refreshShows(City currentCity) {
    emit(ShowsState.refreshing());
    _loadShowsAndResolveView(currentCity);
  }

  void showByDateView() {
    emit(ShowsState.loadedByDate(_eventsByDate!));
  }

  void showByRatingView() {
    emit(ShowsState.loadedByRating(_eventsByRating!));
  }

  void _loadShowsAndResolveView(City currentCity) async {
    await _loadShowsFromRemote(currentCity);
    if (_currentView == null || _currentView == ViewMode.SORT_BY_DATE) {
      showByDateView();
    } else {
      showByRatingView();
    }
  }

  Future<void> _loadShowsFromRemote(City currentCity) async {
    final Future<ResponseSealed<List<EventShort>>> byRatingRequest =
        showsRepository.fetchEventsByRatingFromRemote(currentCity);

    final Future<ResponseSealed<List<ShowsByDate>>> byDateRequest =
        showsRepository.fetchEventsByDateFromRemote(currentCity);

    final resolvedByRating = await byRatingRequest;
    final resolvedByDate = await byDateRequest;

    // if (resolvedByDate is SuccessResponse && resolvedByRating is SuccessResponse) {

    List<ShowsByDate> stateShowsByDate = [];
    resolvedByDate.when(
        success: (data) {
          final showsByDate = data as List<ShowsByDate>;
          stateShowsByDate = showsByDate;
        },
        failure: (failure, failureMessage) {}); //todo

    List<EventShort> stateShowsByRating = [];
    resolvedByRating.when(
        success: (data) {
          final showsByRating = data as List<EventShort>;
          stateShowsByRating = showsByRating;
        },
        failure: (failure, failureMessage) {}); // todo

    _eventsByDate = stateShowsByDate;
    _eventsByRating = stateShowsByRating;

    return;
  }
}
