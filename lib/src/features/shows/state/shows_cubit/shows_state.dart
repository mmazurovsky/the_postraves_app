part of 'shows_cubit.dart';

@freezed
abstract class ShowsState with _$ShowsState {
  const factory ShowsState.loading() = ShowsLoadingState;
  const factory ShowsState.refreshing() = ShowsRefreshingState;
  const factory ShowsState.loaded(List<EventShort> showsByRating) = ShowsLoadedByRatingState;
  const factory ShowsState.failure() = ShowsFailureState;
}
