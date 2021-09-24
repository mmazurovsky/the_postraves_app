part of 'view_switcher_cubit_cubit.dart';

@freezed
abstract class ViewSwitcherState with _$ViewSwitcherState {
  const factory ViewSwitcherState.initial() = InitialViewState;
  const factory ViewSwitcherState.byDate() = ByDateViewState;
  const factory ViewSwitcherState.byRating() = ByRatingViewState;
}
