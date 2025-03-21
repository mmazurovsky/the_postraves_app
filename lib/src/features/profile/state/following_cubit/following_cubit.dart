import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_postraves_package/models/shorts/artist_short.dart';
import 'package:the_postraves_package/models/shorts/event_short.dart';
import 'package:the_postraves_package/models/shorts/place_short.dart';
import 'package:the_postraves_package/models/shorts/unity_short.dart';
import '../../repository/user_following_repository.dart';

part 'following_state.dart';
part 'following_cubit.freezed.dart';

class FollowingCubit extends Cubit<FollowingState> {
  final UserFollowingRepository<EventShort> eventFollowingRepository;
  final UserFollowingRepository<ArtistShort> artistFollowingRepository;
  final UserFollowingRepository<PlaceShort> placeFollowingRepository;
  final UserFollowingRepository<UnityShort> unityFollowingRepository;
  FollowingCubit(
    this.eventFollowingRepository,
    this.artistFollowingRepository,
    this.placeFollowingRepository,
    this.unityFollowingRepository,
  ) : super(const FollowingState.loading());

  void loadFollowing() async {
    emit(const FollowingState.loading());
    final eventsFollowedFuture = eventFollowingRepository.getFollowing();
    final artistsFollowedFuture = artistFollowingRepository.getFollowing();
    final placesFollowedFuture = placeFollowingRepository.getFollowing();
    final unitiesFollowedFuture = unityFollowingRepository.getFollowing();

    final eventsFollowedResolved = await eventsFollowedFuture;
    final artistsFollowedResolved = await artistsFollowedFuture;
    final placesFollowedResolved = await placesFollowedFuture;
    final unitiesFollowedResolved = await unitiesFollowedFuture;

    List<EventShort> eventsFollowed = [];
    List<ArtistShort> artistsFollowed = [];
    List<PlaceShort> placesFollowed = [];
    List<UnityShort> unitiesFollowed = [];

    eventsFollowedResolved.when(
        success: (data) => eventsFollowed = data,
        failure: (failure) => {}); //TODO Exception:

    artistsFollowedResolved.when(
        success: (data) => artistsFollowed = data,
        failure: (failure) => {}); //TODO Exception:

    placesFollowedResolved.when(
        success: (data) => placesFollowed = data,
        failure: (failure) => {}); //TODO Exception:

    unitiesFollowedResolved.when(
        success: (data) => unitiesFollowed = data,
        failure: (failure) => {}); //TODO Exception:

    emit(FollowingState.loaded(
      events: eventsFollowed,
      artists: artistsFollowed,
      places: placesFollowed,
      unities: unitiesFollowed,
    ));
  }
}
