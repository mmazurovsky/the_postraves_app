import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_postraves_app/src/features/followable/state/followable_change_notifier.dart';
import 'package:the_postraves_package/dto/timetable_for_scene_by_day.dart';
import 'package:the_postraves_package/followable/complete_entities_loader/complete_entities_loader.dart';
import 'package:the_postraves_package/followable/complete_entities_loader/complete_full_entities.dart';
import 'package:the_postraves_package/models/fulls/event_full.dart';
import 'package:the_postraves_package/models/shorts/artist_short.dart';
import 'package:the_postraves_package/models/shorts/unity_short.dart';

part 'event_cubit.freezed.dart';
part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  final CompleteEntitiesLoader _completeEntitiesLoader;
  final FollowableChangeNotifier _followableChangeNotifier;

  EventCubit(
    this._completeEntitiesLoader,
    this._followableChangeNotifier,
  ) : super(const EventState.loading());

  void loadEvent(int eventId) {
    emit(const EventState.loading());
    _loadCompleteEvent(eventId);
  }

  void refreshEvent(int eventId) {
    emit(const EventState.refreshing());
    _loadCompleteEvent(eventId);
  }

  void _loadCompleteEvent(int id) async {
    final completeEventResponse =
        await _completeEntitiesLoader.loadCompleteEvent(id: id);
    completeEventResponse.when(
      success: (data) {
        CompleteEventEntity completeEvent = data;
        _followableChangeNotifier
            .updateFollowablesBasedOnCompleteEvent(completeEvent);
        emit(
          EventState.loaded(
            event: completeEvent.eventFull,
            lineup: completeEvent.lineup,
            orgs: completeEvent.orgs,
            timetable: completeEvent.timetable,
          ),
        );
      },
      failure: (failure) {}, //TODO Exception:
    );
  }
}
