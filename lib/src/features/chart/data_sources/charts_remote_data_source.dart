import 'package:the_postraves_package/client/client_helper.dart';
import 'package:the_postraves_package/client/localized_request.dart';
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
  final LocalizedGetRequest _localizedGetRequest;
  final ClientHelper<SHORTFOLLOWABLE> _clientHelper;

  ChartsRemoteDataSourceImpl(
    this._localizedGetRequest,
    this._clientHelper,
  );

  @override
  Future<List<SHORTFOLLOWABLE>> fetchWeeklyChart(
      {required City city, required Map<String, String> httpHeaders}) async {
    final response = await _localizedGetRequest(
      endpointWithPath: _clientHelper.getEndpoint() + '/public/weeklyRating',
      queryParameters: {'cityName': city.name, 'maxQuantity': 50.toString()},
      httpHeaders: httpHeaders,
    ) as List<dynamic>?;

    return response?.map((json) => _clientHelper.deserialize(json)).toList() ??
        [];
  }

  @override
  Future<List<SHORTFOLLOWABLE>> fetchOverallChart(
      {required City city, required Map<String, String> httpHeaders}) async {
    final response = await _localizedGetRequest(
      endpointWithPath: _clientHelper.getEndpoint() + '/public/overallRating',
      queryParameters: {'cityName': city.name, 'maxQuantity': 50.toString()},
      httpHeaders: httpHeaders,
    ) as List<dynamic>?;

    return response?.map((json) => _clientHelper.deserialize(json)).toList() ??
        [];
  }

  @override
  Future<SHORTFOLLOWABLE?> fetchWeeklyBest(
      {required City city, required Map<String, String> httpHeaders}) async {
    final response = await _localizedGetRequest(
      endpointWithPath: _clientHelper.getEndpoint() + '/public/weeklyBest',
      queryParameters: {'cityName': city.name},
      httpHeaders: httpHeaders,
    );

    final weeklyBest =
        response != null ? _clientHelper.deserialize(response) : null;
    return weeklyBest;
  }
}
