part of 'timetable_cubit.dart';

@freezed
abstract class TimetableState with _$TimetableState {
  const factory TimetableState.initial() = TimetableInitialState;
  const factory TimetableState.refreshing() = TimetableRefreshingState;
  const factory TimetableState.loaded({
          required List<TimetableForSceneByDay> timetable}) =
      TimetableLoadedState;
}
