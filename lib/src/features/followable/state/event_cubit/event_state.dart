part of 'event_cubit.dart';

@freezed
abstract class EventState with _$EventState {
  const factory EventState.loading() = EventLoadingState;
  const factory EventState.refreshing() = EventRefreshingState;
  const factory EventState.failure() = EventFailureState;
  const factory EventState.loaded(
          {required EventFull event,
          required List<UnityShort> orgs,
          required List<ArtistShort> lineup,
          required List<TimetableForSceneDto> timetable}) =
      EventLoadedState;
}
