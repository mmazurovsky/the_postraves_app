import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_postraves_package/dto/timetable_for_scene_by_day.dart';
import 'package:the_postraves_package/followable/repository/event_repository.dart';

part 'timetable_cubit.freezed.dart';
part 'timetable_state.dart';

class TimetableCubit extends Cubit<TimetableState> {
  final EventRepository _eventRepository;
  TimetableCubit(
    this._eventRepository,
  ) : super(const TimetableState.initial());

  void initTimetable(List<TimetableForSceneByDay> timetable) {
    emit(TimetableState.loaded(timetable: timetable));
  }

  void refreshTimetable(int eventId) async {
    emit(const TimetableState.refreshing());
    final eventTimetableRequest =
        _eventRepository.fetchTimetableForEventById(eventId);
    final timetableResponse = await eventTimetableRequest;
    timetableResponse.when(
        success: (data) {
          final timetableDataDtoList = data
              .map((model) => TimetableForSceneByDay.fromModel(model))
              .toList();
          emit(TimetableState.loaded(timetable: timetableDataDtoList));
        },
        failure: (failure) {}); //TODO exception
  }
}
