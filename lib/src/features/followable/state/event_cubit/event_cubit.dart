import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_postraves_package/client/response_sealed.dart';
import 'package:the_postraves_package/followable/repository/event_repository.dart';
import 'package:the_postraves_package/followable/repository/wiki_repository.dart';
import 'package:the_postraves_package/models/fulls/event_full.dart';
import 'package:the_postraves_package/models/related_to_event/timetable_for_scene.dart';
import 'package:the_postraves_package/models/shorts/artist_short.dart';
import 'package:the_postraves_package/models/shorts/unity_short.dart';
import '../../../timetable/dto/timetable_for_scene_dto.dart';

part 'event_cubit.freezed.dart';
part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  final FollowableRepository<EventFull> _followableRepository;
  final EventRepository _eventRepository;
  EventCubit(
    this._followableRepository,
    this._eventRepository,
  ) : super(EventState.loading());

  void loadEvent(int eventId) {
    emit(EventState.loading());
    _loadEventAllInfo(eventId);
  }

  void refreshEvent(int eventId) {
    emit(EventState.refreshing());
    _loadEventAllInfo(eventId);
  }

  void _loadEventAllInfo(int eventId) async {
    final eventBasicInfoRequest = _followableRepository.fetchBasicDataById(eventId);
    final eventOrganizersRequest =
        _eventRepository.fetchOrganizersForEventById(eventId);
    final eventLineupRequest =
        _eventRepository.fetchLineupForEventById(eventId);
    final eventTimetableRequest =
        _eventRepository.fetchTimetableForEventById(eventId);

    final basicInfoResponse = await eventBasicInfoRequest;
    final organizersResponse = await eventOrganizersRequest;
    final lineupResponse = await eventLineupRequest;
    final timetableResponse = await eventTimetableRequest;

    if (basicInfoResponse is SuccessResponse &&
        organizersResponse is SuccessResponse &&
        lineupResponse is SuccessResponse &&
        timetableResponse is SuccessResponse) {
      final basicInfo = basicInfoResponse as SuccessResponse;
      final basicInfoData = basicInfo.data as EventFull;

      final organizers = organizersResponse as SuccessResponse;
      final organizersData = organizers.data as List<UnityShort>;

      final lineup = lineupResponse as SuccessResponse;
      final lineupData = lineup.data as List<ArtistShort>;

      final timetable = timetableResponse as SuccessResponse;
      final timetableData = timetable.data as List<TimetableForScene>;

      final timetableDataDtoList = timetableData
          .map((model) => TimetableForSceneDto.fromModel(model))
          .toList();

      emit(EventState.loaded(
          event: basicInfoData,
          orgs: organizersData,
          lineup: lineupData,
          timetable: timetableDataDtoList));
    } else {} //TODO Exception:
  }
}
