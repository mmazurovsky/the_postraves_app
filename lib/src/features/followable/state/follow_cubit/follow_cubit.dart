import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_postraves_app/src/features/shows/state/shows_cubit/shows_cubit.dart';
import 'package:the_postraves_package/followable/repository/followable_repository.dart';
import 'package:the_postraves_package/models/fulls/event_full.dart';
import 'package:the_postraves_package/models/fulls/place_full.dart';
import 'package:the_postraves_package/models/interfaces/data_interfaces.dart';

part 'follow_state.dart';
part 'follow_cubit.freezed.dart';

class FollowCubit<FULLFOLLOWABLE extends GeneralFollowableInterface,
        SHORTFOLLOWABLE extends GeneralFollowableInterface>
    extends Cubit<FollowState> {
  final FollowableRepository<FULLFOLLOWABLE, SHORTFOLLOWABLE>
      _followableRepository;
  final ShowsCubit _showsCubit;
  int? _weeklyFollowers;
  int? _overallFollowers;
  bool? _isFollowed;
  FollowCubit(this._followableRepository, this._showsCubit)
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
    if (followable is EventFull) {
      _showsCubit.toggleFollowShow(followable.id);
    } else if (followable is PlaceFull) {
      _showsCubit.toggleFollowPlace(followable.id);
    }
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
