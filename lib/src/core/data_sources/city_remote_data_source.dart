import '../../models/geo/city.dart';
import '../client/remote_client.dart';

abstract class CityRemoteDataSource {
  Future<List<City>> fetchCities({required Map<String, String> httpHeaders});
}

class CityRemoteDataSourceImpl implements CityRemoteDataSource {
  @override
  Future<List<City>> fetchCities(
      {required Map<String, String> httpHeaders}) async {
    final response = await RemoteClient.makeGetRequestAndReturnResponse(
      endpointWithPath: 'city/public/all',
      httpHeaders: httpHeaders,
    );

    return response.map<City>((json) => City.fromJson(json)).toList();
  }
}
