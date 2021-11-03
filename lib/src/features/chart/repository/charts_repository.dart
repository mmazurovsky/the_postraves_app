import 'package:the_postraves_app/src/common/utils/remote_request_wrapper.dart';
import 'package:the_postraves_package/client/response_sealed.dart';
import 'package:the_postraves_package/models/geo/city.dart';
import 'package:the_postraves_package/models/interfaces/data_interfaces.dart';

import '../data_sources/charts_remote_data_source.dart';

abstract class ChartsRepository<SHORTFOLLOWABLE extends GeneralFollowableInterface> {
  Future<ResponseSealed<List<SHORTFOLLOWABLE>>> fetchOverallChart(City city);
  Future<ResponseSealed<List<SHORTFOLLOWABLE>>> fetchWeeklyChart(City city);
  Future<ResponseSealed<SHORTFOLLOWABLE?>> fetchWeeklyBest(City city);
}

class ChartsRepositoryImpl<SHORTFOLLOWABLE extends GeneralFollowableInterface>
    implements ChartsRepository<SHORTFOLLOWABLE> {
  final ChartsRemoteDataSource<SHORTFOLLOWABLE> chartsRemoteDataSource;
  final RemoteRequestWrapper<List<SHORTFOLLOWABLE>> remoteRequestWrapperForList;
  final RemoteRequestWrapper<SHORTFOLLOWABLE?> remoteRequestWrapperForSingle;

  ChartsRepositoryImpl(
      {
      required this.chartsRemoteDataSource,
      required this.remoteRequestWrapperForList,
      required this.remoteRequestWrapperForSingle,
      });

  @override
  Future<ResponseSealed<List<SHORTFOLLOWABLE>>> fetchWeeklyChart(City city) async {
    return await remoteRequestWrapperForList((httpHeaders) => chartsRemoteDataSource
        .fetchWeeklyChart(city: city, httpHeaders: httpHeaders));
  }

  @override
  Future<ResponseSealed<List<SHORTFOLLOWABLE>>> fetchOverallChart(City city) async {
    return await remoteRequestWrapperForList((httpHeaders) => chartsRemoteDataSource
        .fetchOverallChart(city: city, httpHeaders: httpHeaders));
  }

  @override
  Future<ResponseSealed<SHORTFOLLOWABLE?>> fetchWeeklyBest(City city) async {
    return await remoteRequestWrapperForSingle((httpHeaders) => chartsRemoteDataSource
        .fetchWeeklyBest(city: city, httpHeaders: httpHeaders));
  }
}
