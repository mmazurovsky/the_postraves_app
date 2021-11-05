import 'package:the_postraves_app/src/common/utils/remote_request_wrapper.dart';
import 'package:the_postraves_package/client/request_wrapper.dart';
import 'package:the_postraves_package/client/response_sealed.dart';
import 'package:the_postraves_package/errors/exceptions.dart';
import 'package:the_postraves_package/errors/failures.dart';
import 'package:the_postraves_package/models/geo/country.dart';

import '../local_data_sources/country_local_data_source.dart';
import '../local_data_sources/country_remote_data_source.dart';

abstract class CountryRepository {
  Future<ResponseSealed<List<Country>>> fetchCountriesFromRemote();
  Future<ResponseSealed<List<Country>>> fetchCountriesFromLocal();
  Future<ResponseSealed<void>> saveCountriesToLocalAndDeletePrevious(
      List<Country> countries);
  Future<ResponseSealed<void>> removeCountriesFromLocal();
}

class CountryRepositoryImpl implements CountryRepository {
  final RemoteRequestWrapper<List<Country>> remoteRequestWrapperListCountry;
  final CountryRemoteDataSource countryRemoteDataSource;
  final CountryLocalDataSource countryLocalDataSource;

  CountryRepositoryImpl({
    required this.remoteRequestWrapperListCountry,
    required this.countryRemoteDataSource,
    required this.countryLocalDataSource,
  });

  @override
  Future<ResponseSealed<List<Country>>> fetchCountriesFromRemote() async {
    return await remoteRequestWrapperListCountry(
        (httpHeaders) => countryRemoteDataSource.fetchCountries(
              httpHeaders: httpHeaders,
            ));
  }

  @override
  Future<ResponseSealed<List<Country>>> fetchCountriesFromLocal() async {
    try {
      List<Country> foundInCache =
          await countryLocalDataSource.fetchCountries();
      return ResponseSealed.success(foundInCache);
    } on MyCacheException catch (e) {
      return ResponseSealed.failure(CacheFailure(e.message));
    }
  }

  @override
  Future<ResponseSealed<void>> saveCountriesToLocalAndDeletePrevious(
      List<Country> countries) async {
    try {
      await countryLocalDataSource.deleteCountries();
      await countryLocalDataSource.saveCountries(countries);
      return const ResponseSealed.success(null);
    } on MyCacheException catch (e) {
      return ResponseSealed.failure(CacheFailure(e.message));
    }
  }

  @override
  Future<ResponseSealed<void>> removeCountriesFromLocal() async {
    try {
      await countryLocalDataSource.deleteCountries();
      return const ResponseSealed.success(null);
    } on MyCacheException catch (e) {
      return ResponseSealed.failure(CacheFailure(e.message));
    }
  }
}
