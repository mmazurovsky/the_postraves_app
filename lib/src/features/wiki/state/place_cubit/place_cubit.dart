import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_postraves_package/client/response_sealed.dart';
import 'package:the_postraves_package/models/fulls/place_full.dart';
import 'package:the_postraves_package/models/related_to_place/scene.dart';
import 'package:the_postraves_package/models/shorts/event_short.dart';
import '../../repository/place_repository.dart';
import '../../repository/wiki_repository.dart';

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
    final responseScenesRequest = _placeRepository.fetchScenesForPlaceById(id);
    final responseEventsRequest = _placeRepository.fetchEventsForPlaceById(id);

    final responseBasic = await responseBasicRequest;
    final responseScenes = await responseScenesRequest;
    final responseEvents = await responseEventsRequest;

    if (responseBasic is SuccessResponse &&
        responseScenes is SuccessResponse &&
        responseEvents is SuccessResponse) {
      final responseBasicResolved = responseBasic as SuccessResponse;
      final responseBasicData = responseBasicResolved.data as PlaceFull;

      final responseScenesResolved = responseScenes as SuccessResponse;
      final responseScenesData = responseScenesResolved.data as List<Scene>;

      final responseEventsResolved = responseEvents as SuccessResponse;
      final responseEventsData =
          responseEventsResolved.data as List<EventShort>;

      emit(PlaceState.loaded(
          responseBasicData, responseScenesData, responseEventsData));
    } else {} //TODO Exception:
  }
}
