import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../repository/wiki_repository.dart';
import '../../../../models/interfaces/data_interfaces.dart';

part 'follow_state.dart';
part 'follow_cubit.freezed.dart';

class FollowCubit<T extends GeneralFollowableInterface>
    extends Cubit<FollowState> {
  final WikiRepository<T> _wikiRepository;
  int? _weeklyFollowers;
  int? _overallFollowers;
  bool? _isFollowed;
  FollowCubit(this._wikiRepository)
      : super(const FollowState(
            overallFollowers: null, weeklyFollowers: null, isFollowed: false));

  void defineFollowState(
      {required int overallFollowers,
      required int weeklyFollowers,
      required bool isFollowed}) {
    _overallFollowers = overallFollowers;
    _weeklyFollowers = weeklyFollowers;
    _isFollowed = isFollowed;
    emit(FollowState(
        overallFollowers: _overallFollowers,
        weeklyFollowers: _weeklyFollowers,
        isFollowed: _isFollowed));
  }

  void toggleFollow(T followable) {
    if (_isFollowed!) {
      //TODO:
      _isFollowed = false;
      _overallFollowers = _overallFollowers! - 1;
      _weeklyFollowers = _weeklyFollowers! - 1;
      _wikiRepository.unfollowFollowable(followable.id);
    } else {
      _isFollowed = true;
      _overallFollowers = _overallFollowers! + 1;
      _weeklyFollowers = _weeklyFollowers! + 1;
      _wikiRepository.followFollowable(followable.id);
    }
    emit(FollowState(
        overallFollowers: _overallFollowers,
        weeklyFollowers: _weeklyFollowers,
        isFollowed: _isFollowed));
  }
}
