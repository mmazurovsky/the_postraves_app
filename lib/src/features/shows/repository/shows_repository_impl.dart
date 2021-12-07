import 'package:the_postraves_package/client/request_wrapper.dart';
import 'package:the_postraves_package/client/response_sealed.dart';
import 'package:the_postraves_package/models/geo/city.dart';
import 'package:the_postraves_package/models/related_to_event/shows_by_date.dart';
import 'package:the_postraves_package/models/shorts/event_short.dart';

import '../data_sources/shows_remote_data_source.dart';


abstract class ShowsRepository {
  Future<ResponseSealed<List<EventShort>>> fetchEventsByRatingFromRemote(City city);
  Future<ResponseSealed<List<EventShort>>> fetchEventsByDateFromRemote(City city);
}

class ShowsRepositoryImpl implements ShowsRepository {
  final ShowsRemoteDataSource showsRemoteDataSource;
  final RemoteRequestWrapper<List<EventShort>> remoteRequestWrapper;

  ShowsRepositoryImpl({
    required this.showsRemoteDataSource,
    required this.remoteRequestWrapper,
  });

  @override
  Future<ResponseSealed<List<EventShort>>> fetchEventsByDateFromRemote(
      City city) async {
    return await remoteRequestWrapper((httpHeaders) =>
        showsRemoteDataSource.fetchEventsByDate(
            city: city, httpHeaders: httpHeaders));
  }

  @override
  Future<ResponseSealed<List<EventShort>>> fetchEventsByRatingFromRemote(
      City city) async {
    return await remoteRequestWrapper((httpHeaders) =>
        showsRemoteDataSource.fetchEventsByRating(
            city: city, httpHeaders: httpHeaders));
  }
}
