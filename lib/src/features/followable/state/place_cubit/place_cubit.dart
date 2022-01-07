import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_postraves_package/followable/complete_entities_loader/complete_entities_loader.dart';
import 'package:the_postraves_package/followable/complete_entities_loader/complete_full_entities.dart';
import 'package:the_postraves_package/models/fulls/place_full.dart';
import 'package:the_postraves_package/models/related_to_place/scene.dart';
import 'package:the_postraves_package/models/shorts/event_short.dart';

import '../followable_change_notifier.dart';

part 'place_cubit.freezed.dart';
part 'place_state.dart';

class PlaceCubit extends Cubit<PlaceState> {
  final CompleteEntitiesLoader _completeEntitiesLoader;
  final FollowableChangeNotifier _followableChangeNotifier;

  PlaceCubit(
    this._completeEntitiesLoader,
    this._followableChangeNotifier,
  ) : super(const PlaceState.loading());

  void loadPlace(int id) async {
    emit(const PlaceState.loading());
    final completePlaceResponse =
        await _completeEntitiesLoader.loadCompletePlace(id: id);
    completePlaceResponse.when(
      success: (data) {
        CompletePlaceEntity completePlace = data;
        _followableChangeNotifier
            .updateFollowablesBasedOnCompletePlace(completePlace);
        emit(PlaceState.loaded(completePlace.placeFull, completePlace.scenes,
            completePlace.events));
      },
      failure: (failure) {}, //TODO Exception:
    );
  }
}
