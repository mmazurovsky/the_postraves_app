import 'package:the_postraves_package/models/geo/city.dart';

import '../utils/localized_get_request.dart';


abstract class CityRemoteDataSource {
  Future<List<City>> fetchCities({required Map<String, String> httpHeaders});
}

class CityRemoteDataSourceImpl implements CityRemoteDataSource {
  @override
  Future<List<City>> fetchCities(
      {required Map<String, String> httpHeaders}) async {
    final response = await LocalizedGetRequest.makeGetRequestAndReturnResponse(
      endpointWithPath: 'city/public/all',
      httpHeaders: httpHeaders,
    );

    return response.map<City>((json) => City.fromJson(json)).toList();
  }
}
