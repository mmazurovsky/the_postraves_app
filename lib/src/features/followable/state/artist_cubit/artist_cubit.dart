import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_postraves_package/followable/complete_entities_loader/complete_entities_loader.dart';
import 'package:the_postraves_package/followable/complete_entities_loader/complete_full_entities.dart';
import 'package:the_postraves_package/models/fulls/artist_full.dart';
import 'package:the_postraves_package/models/shorts/event_short.dart';
import 'package:the_postraves_package/models/shorts/unity_short.dart';

part 'artist_cubit.freezed.dart';
part 'artist_state.dart';

class ArtistCubit extends Cubit<ArtistState> {
  final CompleteEntitiesLoader _completeEntitiesLoader;
  ArtistCubit(this._completeEntitiesLoader)
      : super(const ArtistState.loading());

  void loadArtist(int id) async {
    emit(const ArtistState.loading());
    final completeArtistResponse =
        await _completeEntitiesLoader.loadCompleteArtist(id: id);
    completeArtistResponse.when(
      success: (data) {
        CompleteArtistEntity completeArtist = data;
        emit(
          ArtistState.loaded(completeArtist.artistFull, completeArtist.unions,
              completeArtist.events),
        );
      },
      failure: (failure) {}, //TODO Exception:
    );
  }
}
