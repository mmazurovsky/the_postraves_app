import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_postraves_package/client/response_sealed.dart';
import 'package:the_postraves_package/followable/repository/unity_repository.dart';
import 'package:the_postraves_package/followable/repository/wiki_repository.dart';
import 'package:the_postraves_package/models/fulls/unity_full.dart';
import 'package:the_postraves_package/models/shorts/artist_short.dart';
import 'package:the_postraves_package/models/shorts/event_short.dart';

part 'unity_state.dart';
part 'unity_cubit.freezed.dart';

class UnityCubit extends Cubit<UnityState> {
  final FollowableRepository<UnityFull> _followableRepository;
  final UnityRepository _unityRepository;
  UnityCubit(this._followableRepository, this._unityRepository)
      : super(UnityState.loading());

  void loadUnity(int id) async {
    emit(UnityState.loading());
    final responseBasicRequest = _followableRepository.fetchBasicDataById(id);
    final responseArtistsRequest =
        _unityRepository.fetchArtistsForUnityById(id);
    final responseEventsRequest = _unityRepository.fetchEventsForArtistById(id);

    final responseBasic = await responseBasicRequest;
    final responseArtists = await responseArtistsRequest;
    final responseEvents = await responseEventsRequest;

    if (responseBasic is SuccessResponse &&
        responseArtists is SuccessResponse &&
        responseEvents is SuccessResponse) {
      final responseBasicResolved = responseBasic as SuccessResponse;
      final responseBasicData = responseBasicResolved.data as UnityFull;

      final responseArtistsResolved = responseArtists as SuccessResponse;
      final responseUnitiesData =
          responseArtistsResolved.data as List<ArtistShort>;

      final responseEventsResolved = responseEvents as SuccessResponse;
      final responseEventsData =
          responseEventsResolved.data as List<EventShort>;

      emit(UnityState.loaded(
          responseBasicData, responseUnitiesData, responseEventsData));
    } else {} //TODO Exception:
  }
}
