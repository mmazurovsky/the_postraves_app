part of 'place_cubit.dart';

@freezed
abstract class PlaceState with _$PlaceState {
  const factory PlaceState.loading() = PlaceLoadingState;
  const factory PlaceState.loaded(PlaceFull place, List<Scene> scenes, List<EventShort> events) = PlaceLoadedState;
  const factory PlaceState.failure() = PlaceFailureState;
}
