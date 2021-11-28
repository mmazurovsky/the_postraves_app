import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_postraves_app/src/common/data/view_mode.dart';
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
  final ViewSwitcherCubit viewSwitcherBloc;
  late StreamSubscription _viewSwitcherBlocSubscription;
  List<EventShort>? _eventsByRating;
  List<ShowsByDate>? _eventsByDate;
  ViewMode? _currentView;

  ShowsCubit({
    required this.showsRepository,
    required this.viewSwitcherBloc,
  }) : super(ShowsState.loading()) {
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
  }

  @override
  Future<void> close() async {
    _viewSwitcherBlocSubscription.cancel();
    return super.close();
  }

  void fullyLoadShows(City currentCity) {
    emit(const ShowsState.loading());
    _loadShowsAndResolveView(currentCity);
  }

  void refreshShows(City currentCity) {
    emit(const ShowsState.refreshing());
    _loadShowsAndResolveView(currentCity);
  }

  // void showByDateView() {
  //   emit(ShowsState.loadedByDate(_eventsByDate!));
  // }

  // void showByRatingView() {
  //   emit(ShowsState.loaded(_eventsByRating!));
  // }

  void _loadShowsAndResolveView(City currentCity) async {
    await _loadShowsFromRemote(currentCity);
    emit(ShowsState.loaded(_eventsByRating!));
  }

  Future<void> _loadShowsFromRemote(City currentCity) async {
    final Future<ResponseSealed<List<EventShort>>> byRatingRequest =
        showsRepository.fetchEventsByRatingFromRemote(currentCity);

    final Future<ResponseSealed<List<ShowsByDate>>> byDateRequest =
        showsRepository.fetchEventsByDateFromRemote(currentCity);

    final resolvedByRating = await byRatingRequest;
    final resolvedByDate = await byDateRequest;

    // if (resolvedByDate is SuccessResponse && resolvedByRating is SuccessResponse) {

    resolvedByDate.when(
        success: (data) {
          _eventsByDate = data;
        },
        failure: (failure) {}); //TODO Exception:

    resolvedByRating.when(
        success: (data) {
          _eventsByRating = data;
        },
        failure: (failure) {}); // TODO Exception:

    return;
  }
}
