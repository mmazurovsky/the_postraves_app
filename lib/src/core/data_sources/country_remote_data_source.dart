import '../../models/geo/country.dart';
import '../client/remote_client.dart';

abstract class CountryRemoteDataSource {
  Future<List<Country>> fetchCountries({required Map<String, String> httpHeaders});
}

class CountryRemoteDataSourceImpl implements CountryRemoteDataSource {
  @override
  Future<List<Country>> fetchCountries(
      {required Map<String, String> httpHeaders}) async {
    final response = await RemoteClient.makeGetRequestAndReturnResponse(
      endpointWithPath: 'country/public/all',
      httpHeaders: httpHeaders,
    );

    return response.map<Country>((json) => Country.fromJson(json)).toList();
  }
}
