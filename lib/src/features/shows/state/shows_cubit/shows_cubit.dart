import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_postraves_app/src/features/followable/state/followable_change_notifier.dart';
import 'package:the_postraves_package/client/response_sealed.dart';
import 'package:the_postraves_package/models/geo/city.dart';
import 'package:the_postraves_package/models/shorts/event_short.dart';
import 'package:the_postraves_package/models/shorts/place_short.dart';

import '../../repository/shows_repository_impl.dart';
import '../date_filter_change_notifier.dart';

part 'shows_cubit.freezed.dart';
part 'shows_state.dart';

class ShowsCubit extends Cubit<ShowsState> {
  final ShowsRepository showsRepository;
  final DateTimeFilterChangeNotifier dateFilterChangeNotifier;
  final FollowableVariablesService followableChangeNotifier;
  List<EventShort>? _eventsByDate;

  ShowsCubit({
    required this.showsRepository,
    required this.dateFilterChangeNotifier,
    required this.followableChangeNotifier,
  }) : super(const ShowsState.loading());

  void fullyLoadShows(City currentCity) {
    emit(const ShowsState.loading());
    _loadShows(currentCity);
  }

  // void toggleFollowShow(int id) {
  //   final eventIndex = _eventsByDate?.indexWhere((event) => event.id == id);
  //   if (eventIndex != null && eventIndex > -1) {
  //     final previousIsFollowed = _eventsByDate![eventIndex].isFollowed;
  //     final newEvent =
  //         _eventsByDate![eventIndex].copyWith(isFollowed: !previousIsFollowed);
  //     _eventsByDate![eventIndex] = newEvent;
  //     emit(const ShowsState.refreshing());
  //     emit(ShowsState.loaded(_eventsByDate!));
  //   }
  // }

  // void toggleFollowPlace(int id) {
  //   Map<int, EventShort> mapOfUpdatedEvents = {};
  //   int i = 0;
  //   _eventsByDate?.forEach((e) {
  //     if (e.place.id == id) {
  //       final updatedEvent = e.copyWith(
  //           place: e.place.copyWith(isFollowed: !e.place.isFollowed));
  //       mapOfUpdatedEvents[i] = updatedEvent;
  //     }
  //     i++;
  //   });

  //   for (var element in mapOfUpdatedEvents.entries) {
  //     _eventsByDate![element.key] = element.value;
  //   }

  //   emit(const ShowsState.refreshing());
  //   emit(ShowsState.loaded(_eventsByDate!));
  // }

  void refreshShows(City currentCity) {
    emit(const ShowsState.refreshing());
    _loadShows(currentCity);
  }

  void _loadShows(City currentCity) async {
    await _loadShowsFromRemote(currentCity);
    if (_eventsByDate != null) {
      followableChangeNotifier
          .updateFollowablesBasedOnEventList(_eventsByDate!);
    }
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
