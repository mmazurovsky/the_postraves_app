import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_switcher_cubit_state.dart';
part 'view_switcher_cubit_cubit.freezed.dart';

class ViewSwitcherCubit extends Cubit<ViewSwitcherState> {
  ViewSwitcherCubit() : super(ViewSwitcherState.byDate());

  void showByDateView() {
    emit(ViewSwitcherState.byDate());
  }

  void showByRatingView() {
    emit(ViewSwitcherState.byRating());
  }
}
