import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../repository/wiki_repository.dart';
import '../../../../models/interfaces/data_interfaces.dart';

part 'follow_state.dart';
part 'follow_cubit.freezed.dart';

class FollowCubit<T extends GeneralFollowableInterface> extends Cubit<FollowState> {
  final WikiRepository<T> _wikiRepository;
  int? _followers;
  bool? _isFollowed;
  FollowCubit(this._wikiRepository) : super(const FollowState(null, false));

  void defineFollowState(int followers, bool isFollowed) {
    _followers = followers;
    _isFollowed = isFollowed;
    emit(FollowState(_followers, _isFollowed));
  }

  void toggleFollow(T followable) {
    if (_isFollowed!) { //todo
      _isFollowed = false;
      _followers = _followers! - 1;
      _wikiRepository.unfollowFollowable(followable.id);
    } else {
      _isFollowed = true;
      _followers = _followers! + 1;
      _wikiRepository.followFollowable(followable.id);
    }
    emit(FollowState(_followers, _isFollowed));
  }
}
