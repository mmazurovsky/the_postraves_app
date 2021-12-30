import 'package:the_postraves_package/client/response_sealed.dart';
import 'package:the_postraves_package/errors/failures.dart';
import 'package:the_postraves_package/models/geo/city.dart';

import '../local_data_sources/city_local_data_source.dart';

abstract class CityLocalRepository {
  Future<ResponseSealed<List<City>>> fetchCitiesFromLocal();
  Future<ResponseSealed<City?>> fetchCurrentCityFromLocal();
  Future<ResponseSealed<void>> saveCitiesToLocalAndDeletePrevious(
      List<City> cities);
  Future<ResponseSealed<void>> saveCurrentCityToLocalAndDeletePrevious(
      City city);
  Future<ResponseSealed<void>> removeCurrentCityFromLocal();
  Future<ResponseSealed<void>> removeCitiesFromLocal();
}

class CityRepositoryImpl implements CityLocalRepository {
  final CityLocalDataSource _cityLocalDataSource;

  CityRepositoryImpl(
    this._cityLocalDataSource,
  );

  @override
  Future<ResponseSealed<List<City>>> fetchCitiesFromLocal() async {
    try {
      List<City> foundInCache = await _cityLocalDataSource.fetchCities();
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
  Future<ResponseSealed<City?>> fetchCurrentCityFromLocal() async {
    try {
      City? foundInCache = await _cityLocalDataSource.fetchCurrentCity();
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
  Future<ResponseSealed<void>> saveCitiesToLocalAndDeletePrevious(
      List<City> cities) async {
    try {
      await _cityLocalDataSource.deleteCities();
      await _cityLocalDataSource.saveCities(cities);
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
  Future<ResponseSealed<void>> saveCurrentCityToLocalAndDeletePrevious(
      City city) async {
    try {
      await _cityLocalDataSource.deleteCurrentCity();
      await _cityLocalDataSource.saveCurrentCity(city);
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
  Future<ResponseSealed<void>> removeCitiesFromLocal() async {
    try {
      await _cityLocalDataSource.deleteCities();
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
  Future<ResponseSealed<void>> removeCurrentCityFromLocal() async {
    try {
      await _cityLocalDataSource.deleteCurrentCity();
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
