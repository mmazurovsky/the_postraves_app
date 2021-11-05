import 'package:the_postraves_package/client/localized_request.dart';
import 'package:the_postraves_package/models/geo/country.dart';

import '../utils/localized_get_request.dart';


abstract class CountryRemoteDataSource {
  Future<List<Country>> fetchCountries(
      {required Map<String, String> httpHeaders});
}

class CountryRemoteDataSourceImpl implements CountryRemoteDataSource {
    final LocalizedGetRequest _localizedGetRequest;

  CountryRemoteDataSourceImpl(this._localizedGetRequest);

  @override
  Future<List<Country>> fetchCountries(
      {required Map<String, String> httpHeaders}) async {
    final response = await _localizedGetRequest(
      endpointWithPath: 'country/public/all',
      httpHeaders: httpHeaders,
    );

    return response.map<Country>((json) => Country.fromJson(json)).toList();
  }
}
