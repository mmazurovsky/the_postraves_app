import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../follow_cubit/follow_cubit.dart';

import '../../../../core/client/data_sealed/response_sealed.dart';
import '../../../../models/fulls/artist_full.dart';
import '../../../../models/shorts/event_short.dart';
import '../../../../models/shorts/unity_short.dart';
import '../../repository/artist_repository.dart';
import '../../repository/wiki_repository.dart';

part 'artist_cubit.freezed.dart';
part 'artist_state.dart';

class ArtistCubit extends Cubit<ArtistState> {
  final WikiRepository<ArtistFull> _wikiRepository;
  final ArtistRepository _artistRepository;
  ArtistCubit(this._wikiRepository, this._artistRepository)
      : super(ArtistState.loading());

  void loadArtist(int id) async {
    emit(ArtistState.loading());
    final responseBasicRequest = _wikiRepository.fetchBasicDataById(id);
    final responseUnitiesRequest =
        _artistRepository.fetchUnitiesForArtistById(id);
    final responseEventsRequest =
        _artistRepository.fetchEventsForArtistById(id);

    final responseBasic = await responseBasicRequest;
    final responseUnities = await responseUnitiesRequest;
    final responseEvents = await responseEventsRequest;

    if (responseBasic is SuccessResponse &&
        responseUnities is SuccessResponse &&
        responseEvents is SuccessResponse) {
      final responseBasicResolved = responseBasic as SuccessResponse;
      final responseBasicData = responseBasicResolved.data as ArtistFull;

      final responseUnitiesResolved = responseUnities as SuccessResponse;
      final responseUnitiesData =
          responseUnitiesResolved.data as List<UnityShort>;

      final responseEventsResolved = responseEvents as SuccessResponse;
      final responseEventsData =
          responseEventsResolved.data as List<EventShort>;

      emit(ArtistState.loaded(
          responseBasicData, responseUnitiesData, responseEventsData));
    } else {} //TODO:
  }
}
