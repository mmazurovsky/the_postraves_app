import 'package:the_postraves_package/client/localized_request.dart';
import 'package:the_postraves_package/models/geo/city.dart';

import '../utils/localized_get_request.dart';

abstract class CityRemoteDataSource {
  Future<List<City>> fetchCities({required Map<String, String> httpHeaders});
}

class CityRemoteDataSourceImpl implements CityRemoteDataSource {
  final LocalizedGetRequest _localizedGetRequest;

  CityRemoteDataSourceImpl(this._localizedGetRequest);
  
  @override
  Future<List<City>> fetchCities(
      {required Map<String, String> httpHeaders}) async {
    final response = await _localizedGetRequest(
      endpointWithPath: 'city/public/all',
      httpHeaders: httpHeaders,
    );

    return response.map<City>((json) => City.fromJson(json)).toList();
  }
}
