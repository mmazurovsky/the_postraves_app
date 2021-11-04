import 'package:the_postraves_app/src/common/utils/localized_get_request.dart';
import 'package:the_postraves_package/client/followable_client_helper.dart';
import 'package:the_postraves_package/models/geo/city.dart';
import 'package:the_postraves_package/models/interfaces/data_interfaces.dart';


abstract class ChartsRemoteDataSource<
    SHORTFOLLOWABLE extends GeneralFollowableInterface> {
  Future<List<SHORTFOLLOWABLE>> fetchOverallChart(
      {required City city, required Map<String, String> httpHeaders});
  Future<List<SHORTFOLLOWABLE>> fetchWeeklyChart(
      {required City city, required Map<String, String> httpHeaders});
  Future<SHORTFOLLOWABLE?> fetchWeeklyBest(
      {required City city, required Map<String, String> httpHeaders});
}

class ChartsRemoteDataSourceImpl<
        SHORTFOLLOWABLE extends GeneralFollowableInterface>
    implements ChartsRemoteDataSource<SHORTFOLLOWABLE> {
  final FollowableClientHelper<SHORTFOLLOWABLE> followableClientHelper;

  ChartsRemoteDataSourceImpl(this.followableClientHelper);

  @override
  Future<List<SHORTFOLLOWABLE>> fetchWeeklyChart(
      {required City city, required Map<String, String> httpHeaders}) async {
    final response = await LocalizedGetRequest.makeGetRequestAndReturnResponse(
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
    final response = await LocalizedGetRequest.makeGetRequestAndReturnResponse(
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
    final response = await LocalizedGetRequest.makeGetRequestAndReturnResponse(
      endpointWithPath: followableClientHelper.getEndpointForFollowable() +
          '/public/weeklyBest',
      queryParameters: {'cityName': city.name},
      httpHeaders: httpHeaders,
    );

    final weeklyBest = response != null
        ? followableClientHelper.deserializeFollowable(response)
        : null;
    return weeklyBest;
  }
}
