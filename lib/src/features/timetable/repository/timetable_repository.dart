import '../../../core/client/data_sealed/response_sealed.dart';
import '../../../core/client/remote_request_wrapper.dart';
import '../../../models/related_to_event/timetable_for_scene.dart';
import '../data_sources/timetable_remote_data_source.dart';

abstract class TimetableRepository {
  Future<ResponseSealed<List<TimetableForScene>>> fetchTimetableFromRemote(int eventId);
}

class TimetableRepositoryImpl extends TimetableRepository {
  final TimetableRemoteDataSource timetableRemoteDataSource;
  final RemoteRequestWrapper<List<TimetableForScene>> remoteRequestWrapper;

  TimetableRepositoryImpl({
    required this.timetableRemoteDataSource,
    required this.remoteRequestWrapper,
  });

  @override
  Future<ResponseSealed<List<TimetableForScene>>> fetchTimetableFromRemote(
      int eventId) async {
    return await remoteRequestWrapper((httpHeaders) => timetableRemoteDataSource
        .fetchTimetable(eventId: eventId, httpHeaders: httpHeaders));
  }
}
