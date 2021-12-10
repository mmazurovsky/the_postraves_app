import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_postraves_app/src/features/shows/state/date_filter_change_notifier.dart';
import '../../../../common/data/view_mode.dart';
import 'package:the_postraves_package/client/response_sealed.dart';
import 'package:the_postraves_package/models/geo/city.dart';
import 'package:the_postraves_package/models/related_to_event/shows_by_date.dart';
import 'package:the_postraves_package/models/shorts/event_short.dart';
import '../../repository/shows_repository_impl.dart';
import '../view_switcher_cubit/view_switcher_cubit.dart';

part 'shows_state.dart';
part 'shows_cubit.freezed.dart';

class ShowsCubit extends Cubit<ShowsState> {
  final ShowsRepository showsRepository;
  final DateTimeFilterChangeNotifier dateFilterChangeNotifier;
  List<EventShort>? _eventsByDate;
  // final ViewSwitcherCubit viewSwitcherBloc;
  // late StreamSubscription _viewSwitcherBlocSubscription;
  // ViewMode? _currentView;

  ShowsCubit({
    required this.showsRepository,
    required this.dateFilterChangeNotifier,
    // required this.viewSwitcherBloc,
  }) : super(const ShowsState.loading());
  // _viewSwitcherBlocSubscription =
  //     viewSwitcherBloc.stream.listen((viewSwitcherState) {
  //   if (viewSwitcherState is ByDateViewState) {
  //     _currentView = ViewMode.SORT_BY_DATE;
  //     showByDateView();
  //   } else if (viewSwitcherState is ByRatingViewState) {
  //     _currentView = ViewMode.SORT_BY_RATING;
  //     showByRatingView();
  //   }
  // });

  // @override
  // Future<void> close() async {
  //   _viewSwitcherBlocSubscription.cancel();
  //   return super.close();
  // }

  void fullyLoadShows(City currentCity) {
    emit(const ShowsState.loading());
    _loadShows(currentCity);
  }

  void refreshShows(City currentCity) {
    emit(const ShowsState.refreshing());
    _loadShows(currentCity);
  }

  // void showByDateView() {
  //   emit(ShowsState.loadedByDate(_eventsByDate!));
  // }

  // void showByRatingView() {
  //   emit(ShowsState.loaded(_eventsByRating!));
  // }

  void _loadShows(City currentCity) async {
    await _loadShowsFromRemote(currentCity);
    emit(ShowsState.loaded(_eventsByDate!));
  }

  void loadFilteredShows() {
    final startDate = dateFilterChangeNotifier.startDateTimeWithTimezone;
    late DateTime endDate;
    List<EventShort> eventsFiltered = [];
    if (_eventsByDate != null && startDate != null) {
      emit(const ShowsState.loading());
      if (dateFilterChangeNotifier.endDateTimeWithTimezone != null) {
        endDate = dateFilterChangeNotifier.endDateTimeWithTimezone!
            .add(const Duration(days: 1));
      } else {
        endDate = startDate.add(const Duration(days: 1));
      }
      eventsFiltered = _eventsByDate!
          .where((e) =>
              (e.startDateTime.isAtSameMomentAs(startDate) ||
                  e.startDateTime.isAfter(startDate)) &&
              e.startDateTime.isBefore(endDate))
          .toList();
      dateFilterChangeNotifier.applyFilter();
      emit(ShowsState.loaded(eventsFiltered));
    }
  }

  void dropFilter() {
    emit(const ShowsState.loading());
    dateFilterChangeNotifier.dropFilter();
    emit(ShowsState.loaded(_eventsByDate!));
  }

  Future<void> _loadShowsFromRemote(City currentCity) async {
    final Future<ResponseSealed<List<EventShort>>> byDateRequest =
        showsRepository.fetchEventsByDateFromRemote(currentCity);

    final resolvedByDate = await byDateRequest;

    resolvedByDate.when(
        success: (data) {
          _eventsByDate = data;
        },
        failure: (failure) {}); //TODO Exception:

    return;
  }
}
