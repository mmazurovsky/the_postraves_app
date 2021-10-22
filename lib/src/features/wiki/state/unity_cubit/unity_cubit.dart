import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/client/data_sealed/response_sealed.dart';
import '../../repository/unity_repository.dart';
import '../../repository/wiki_repository.dart';
import '../../../../models/fulls/unity_full.dart';
import '../../../../models/shorts/artist_short.dart';
import '../../../../models/shorts/event_short.dart';

part 'unity_state.dart';
part 'unity_cubit.freezed.dart';

class UnityCubit extends Cubit<UnityState> {
  final WikiRepository<UnityFull> _wikiRepository;
  final UnityRepository _unityRepository;
  UnityCubit(this._wikiRepository, this._unityRepository)
      : super(UnityState.loading());

  void loadUnity(int id) async {
    emit(UnityState.loading());
    final responseBasicRequest = _wikiRepository.fetchBasicDataById(id);
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
    } else {} //TODO:
  }
}
