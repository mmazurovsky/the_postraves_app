import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_postraves_package/client/response_sealed.dart';
import 'package:the_postraves_package/models/related_to_event/timetable_for_scene.dart';
import '../../wiki/repository/event_repository.dart';
import '../dto/timetable_for_scene_dto.dart';

part 'timetable_cubit.freezed.dart';
part 'timetable_state.dart';

class TimetableCubit extends Cubit<TimetableState> {
  final EventRepository _eventRepository;
  TimetableCubit(
    this._eventRepository,
  ) : super(const TimetableState.initial());

  void initTimetable(List<TimetableForSceneDto> timetable) {
    emit(TimetableState.loaded(timetable: timetable));
  }

  void refreshTimetable(int eventId) async {
    emit(const TimetableState.refreshing());
    final eventTimetableRequest =
        _eventRepository.fetchTimetableForEventById(eventId);
    final timetableResponse = await eventTimetableRequest;
    if (timetableResponse is SuccessResponse) {
      final timetable = timetableResponse as SuccessResponse;
      final timetableData = timetable.data as List<TimetableForScene>;
      final timetableDataDtoList = timetableData
          .map((model) => TimetableForSceneDto.fromModel(model))
          .toList();
      emit(TimetableState.loaded(timetable: timetableDataDtoList));
    }
  }
}
