import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/client/data_sealed/response_sealed.dart';
import '../../repository/artist_repository.dart';
import '../../repository/place_repository.dart';
import '../../repository/wiki_repository.dart';
import '../../../../models/fulls/artist_full.dart';
import '../../../../models/fulls/place_full.dart';
import '../../../../models/interfaces/data_interfaces.dart';
import '../../../../models/related_to_place/scene.dart';
import '../../../../models/shorts/event_short.dart';
import '../../../../models/shorts/unity_short.dart';

part 'place_state.dart';
part 'place_cubit.freezed.dart';

class PlaceCubit extends Cubit<PlaceState> {
  final WikiRepository<PlaceFull> _wikiRepository;
  final PlaceRepository _placeRepository;
  PlaceCubit(this._wikiRepository, this._placeRepository)
      : super(PlaceState.loading());

  void loadPlace(int id) async {
    emit(PlaceState.loading());
    final responseBasicRequest = _wikiRepository.fetchBasicDataById(id);
    final responseScenesRequest =
        _placeRepository.fetchScenesForPlaceById(id);
    final responseEventsRequest =
        _placeRepository.fetchEventsForPlaceById(id);

    final responseBasic = await responseBasicRequest;
    final responseScenes = await responseScenesRequest;
    final responseEvents = await responseEventsRequest;

    if (responseBasic is SuccessResponse &&
        responseScenes is SuccessResponse &&
        responseEvents is SuccessResponse) {
      final responseBasicResolved = responseBasic as SuccessResponse;
      final responseBasicData = responseBasicResolved.data as PlaceFull;

      final responseScenesResolved = responseScenes as SuccessResponse;
      final responseScenesData =
          responseScenesResolved.data as List<Scene>;

      final responseEventsResolved = responseEvents as SuccessResponse;
      final responseEventsData =
          responseEventsResolved.data as List<EventShort>;

      emit(PlaceState.loaded(
          responseBasicData, responseScenesData, responseEventsData));
    } else {} //todo
  }
}
