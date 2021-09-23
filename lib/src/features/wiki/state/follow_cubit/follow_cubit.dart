import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../repository/wiki_repository.dart';
import '../../../../models/interfaces/data_interfaces.dart';

part 'follow_state.dart';
part 'follow_cubit.freezed.dart';

class FollowCubit<T extends FollowableInterface> extends Cubit<FollowState> {
  final WikiRepository<T> _wikiRepository;
  FollowCubit(this._wikiRepository) : super(FollowState.unclear());

  void initFollow(bool isFollowed) {
    if (isFollowed) {
      emit(FollowState.followed());
    } else {
      emit(FollowState.unfollowed());
    }
  }

  void toggleFollow(T followable) {
    if (followable.isFollowed) {
      _wikiRepository.unfollowFollowable(followable.id);
      emit(FollowState.unfollowed());
    } else {
      _wikiRepository.followFollowable(followable.id);
      emit(FollowState.followed());
    }
  }
}
