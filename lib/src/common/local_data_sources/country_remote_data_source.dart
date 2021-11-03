import 'package:the_postraves_package/models/geo/country.dart';

import '../utils/localized_get_request.dart';


abstract class CountryRemoteDataSource {
  Future<List<Country>> fetchCountries(
      {required Map<String, String> httpHeaders});
}

class CountryRemoteDataSourceImpl implements CountryRemoteDataSource {
  @override
  Future<List<Country>> fetchCountries(
      {required Map<String, String> httpHeaders}) async {
    final response = await LocalizedGetRequest.makeGetRequestAndReturnResponse(
      endpointWithPath: 'country/public/all',
      httpHeaders: httpHeaders,
    );

    return response.map<Country>((json) => Country.fromJson(json)).toList();
  }
}
