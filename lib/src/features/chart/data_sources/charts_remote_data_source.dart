import '../../../core/utils/followable_client_helper.dart';
import '../../../models/geo/city.dart';
import '../../../models/interfaces/data_interfaces.dart';
import '../../../core/client/remote_client.dart';

abstract class ChartsRemoteDataSource<SHORTFOLLOWABLE extends FollowableInterface> {
  Future<List<SHORTFOLLOWABLE>> fetchOverallChart(
      {required City city, required Map<String, String> httpHeaders});
  Future<List<SHORTFOLLOWABLE>> fetchWeeklyChart(
      {required City city, required Map<String, String> httpHeaders});
  Future<SHORTFOLLOWABLE?> fetchWeeklyBest(
      {required City city, required Map<String, String> httpHeaders});
}

class ChartsRemoteDataSourceImpl<SHORTFOLLOWABLE extends FollowableInterface>
    implements ChartsRemoteDataSource<SHORTFOLLOWABLE> {
  final FollowableClientHelper<SHORTFOLLOWABLE> followableClientHelper;

  ChartsRemoteDataSourceImpl(this.followableClientHelper);

  @override
  Future<List<SHORTFOLLOWABLE>> fetchWeeklyChart(
      {required City city, required Map<String, String> httpHeaders}) async {
    final response = await RemoteClient.makeGetRequestAndReturnResponse(
      endpointWithPath: followableClientHelper.getEndpointForFollowable() +
          '/public/weeklyRating',
      queryParameters: {'cityName': city.name, 'maxQuantity': 50.toString()},
      httpHeaders: httpHeaders,
    ) as List<dynamic>;

    return response
        .map((json) => followableClientHelper.deserializeFollowable(json))
        .toList();
  }

  @override
  Future<List<SHORTFOLLOWABLE>> fetchOverallChart(
      {required City city, required Map<String, String> httpHeaders}) async {
    final response = await RemoteClient.makeGetRequestAndReturnResponse(
      endpointWithPath: followableClientHelper.getEndpointForFollowable() +
          '/public/overallRating',
      queryParameters: {'cityName': city.name, 'maxQuantity': 50.toString()},
      httpHeaders: httpHeaders,
    ) as List<dynamic>;

    return response
        .map((json) => followableClientHelper.deserializeFollowable(json))
        .toList();
  }

  @override
  Future<SHORTFOLLOWABLE?> fetchWeeklyBest(
      {required City city, required Map<String, String> httpHeaders}) async {
    final response = await RemoteClient.makeGetRequestAndReturnResponse(
      endpointWithPath: followableClientHelper.getEndpointForFollowable() +
          '/public/weeklyBest',
      queryParameters: {'cityName': city.name},
      httpHeaders: httpHeaders,
    );

    final weeklyBest = response != null ? followableClientHelper.deserializeFollowable(response) : null;
    return weeklyBest;
  }
}
