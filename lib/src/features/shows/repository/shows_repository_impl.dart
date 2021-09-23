import 'package:dartz/dartz.dart';
import '../../../core/client/data_sealed/response_sealed.dart';
import '../data_sources/shows_remote_data_source.dart';
import '../../../models/geo/city.dart';
import '../../../models/shorts/event_short.dart';
import '../../../core/client/remote_request_wrapper.dart';

import '../../../models/related_to_event/shows_by_date.dart';

abstract class ShowsRepository {
  Future<ResponseSealed<List<EventShort>>> fetchEventsByRatingFromRemote(City city);
  Future<ResponseSealed<List<ShowsByDate>>> fetchEventsByDateFromRemote(City city);
}

class ShowsRepositoryImpl implements ShowsRepository {
  final ShowsRemoteDataSource showsRemoteDataSource;
  final RemoteRequestWrapper<List<ShowsByDate>> remoteRequestWrapperByDate;
  final RemoteRequestWrapper<List<EventShort>> remoteRequestWrapperByRating;

  ShowsRepositoryImpl({
    required this.showsRemoteDataSource,
    required this.remoteRequestWrapperByDate,
    required this.remoteRequestWrapperByRating,
  });

  @override
  Future<ResponseSealed<List<ShowsByDate>>> fetchEventsByDateFromRemote(
      City city) async {
    return await remoteRequestWrapperByDate((httpHeaders) =>
        showsRemoteDataSource.fetchEventsByDate(
            city: city, httpHeaders: httpHeaders));
  }

  @override
  Future<ResponseSealed<List<EventShort>>> fetchEventsByRatingFromRemote(
      City city) async {
    return await remoteRequestWrapperByRating((httpHeaders) =>
        showsRemoteDataSource.fetchEventsByRating(
            city: city, httpHeaders: httpHeaders));
  }
}
