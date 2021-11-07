import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_postraves_package/followable/cubit_related/complete_entities_loader.dart';
import 'package:the_postraves_package/followable/cubit_related/complete_full_entities.dart';
import 'package:the_postraves_package/models/fulls/place_full.dart';
import 'package:the_postraves_package/models/related_to_place/scene.dart';
import 'package:the_postraves_package/models/shorts/event_short.dart';

part 'place_state.dart';
part 'place_cubit.freezed.dart';

class PlaceCubit extends Cubit<PlaceState> {
  final CompleteEntitiesLoader _completeEntitiesLoader;
  PlaceCubit(this._completeEntitiesLoader) : super(const PlaceState.loading());

  void loadPlace(int id) async {
    emit(const PlaceState.loading());
    final completePlaceResponse =
        await _completeEntitiesLoader.loadCompletePlace(id: id);
    completePlaceResponse.when(
      success: (data) {
        CompletePlaceEntity completePlace = data;
        emit(PlaceState.loaded(completePlace.placeFull, completePlace.scenes,
            completePlace.events));
      },
      failure: (failure) {}, //TODO Exception:
    );
  }
}
