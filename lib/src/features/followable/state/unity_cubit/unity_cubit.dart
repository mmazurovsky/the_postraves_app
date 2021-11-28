import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_postraves_package/followable/complete_entities_loader/complete_entities_loader.dart';
import 'package:the_postraves_package/followable/complete_entities_loader/complete_full_entities.dart';
import 'package:the_postraves_package/models/fulls/unity_full.dart';
import 'package:the_postraves_package/models/shorts/artist_short.dart';
import 'package:the_postraves_package/models/shorts/event_short.dart';

part 'unity_state.dart';
part 'unity_cubit.freezed.dart';

class UnityCubit extends Cubit<UnityState> {
  final CompleteEntitiesLoader _completeEntitiesLoader;
  UnityCubit(this._completeEntitiesLoader) : super(const UnityState.loading());

  void loadUnity(int id) async {
    emit(const UnityState.loading());
    final completeUnityResponse =
        await _completeEntitiesLoader.loadCompleteUnity(id: id);
    completeUnityResponse.when(
      success: (data) {
        CompleteUnityEntity completeUnity = data;
        emit(UnityState.loaded(completeUnity.unityFull, completeUnity.artists,
            completeUnity.events));
      },
      failure: (failure) {}, //TODO Exception:
    );
  }
}
