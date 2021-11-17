import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_postraves_package/followable/repository/followable_repository.dart';
import 'package:the_postraves_package/models/interfaces/data_interfaces.dart';

part 'follow_state.dart';
part 'follow_cubit.freezed.dart';

class FollowCubit<FULLFOLLOWABLE extends GeneralFollowableInterface,
        SHORTFOLLOWABLE extends GeneralFollowableInterface>
    extends Cubit<FollowState> {
  final FollowableRepository<FULLFOLLOWABLE, SHORTFOLLOWABLE> _followableRepository;
  int? _weeklyFollowers;
  int? _overallFollowers;
  bool? _isFollowed;
  FollowCubit(this._followableRepository)
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

  void toggleFollow(FULLFOLLOWABLE followable) {
    if (_isFollowed!) {
      _isFollowed = false;
      _overallFollowers = _overallFollowers! - 1;
      _weeklyFollowers = _weeklyFollowers! - 1;
      _followableRepository.unfollowFollowable(followable.id);
    } else {
      _isFollowed = true;
      _overallFollowers = _overallFollowers! + 1;
      _weeklyFollowers = _weeklyFollowers! + 1;
      _followableRepository.followFollowable(followable.id);
    }
    emit(FollowState(
        overallFollowers: _overallFollowers,
        weeklyFollowers: _weeklyFollowers,
        isFollowed: _isFollowed));
  }
}
