import 'package:the_postraves_package/client/response_sealed.dart';
import 'package:the_postraves_package/errors/failures.dart';
import 'package:the_postraves_package/models/geo/country.dart';

import '../local_data_sources/country_local_data_source.dart';

abstract class CountryLocalRepository {
  Future<ResponseSealed<List<Country>>> fetchCountriesFromLocal();
  Future<ResponseSealed<void>> saveCountriesToLocalAndDeletePrevious(
      List<Country> countries);
  Future<ResponseSealed<void>> removeCountriesFromLocal();
}

class CountryRepositoryImpl implements CountryLocalRepository {
  final CountryLocalDataSource _countryLocalDataSource;

  CountryRepositoryImpl(
    this._countryLocalDataSource,
  );

  @override
  Future<ResponseSealed<List<Country>>> fetchCountriesFromLocal() async {
    try {
      List<Country> foundInCache =
          await _countryLocalDataSource.fetchCountries();
      return ResponseSealed.success(foundInCache);
    } on Exception catch (e) {
      return ResponseSealed.failure(
        Failure(
          FailureType.cacheFailure,
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<ResponseSealed<void>> saveCountriesToLocalAndDeletePrevious(
      List<Country> countries) async {
    try {
      await _countryLocalDataSource.deleteCountries();
      await _countryLocalDataSource.saveCountries(countries);
      return const ResponseSealed.success(null);
    } on Exception catch (e) {
      return ResponseSealed.failure(
        Failure(
          FailureType.cacheFailure,
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<ResponseSealed<void>> removeCountriesFromLocal() async {
    try {
      await _countryLocalDataSource.deleteCountries();
      return const ResponseSealed.success(null);
    } on Exception catch (e) {
      return ResponseSealed.failure(
        Failure(
          FailureType.cacheFailure,
          e.toString(),
        ),
      );
    }
  }
}
