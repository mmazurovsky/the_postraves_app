import 'package:the_postraves_app/src/common/utils/remote_request_wrapper.dart';
import 'package:the_postraves_package/client/request_wrapper.dart';
import 'package:the_postraves_package/client/response_sealed.dart';
import 'package:the_postraves_package/errors/exceptions.dart';
import 'package:the_postraves_package/errors/failures.dart';
import 'package:the_postraves_package/models/geo/city.dart';

import '../local_data_sources/city_local_data_source.dart';
import '../local_data_sources/city_remote_data_source.dart';

abstract class CityRepository {
  Future<ResponseSealed<List<City>>> fetchCitiesFromRemote();
  Future<ResponseSealed<List<City>>> fetchCitiesFromLocal();
  Future<ResponseSealed<City?>> fetchCurrentCityFromLocal();
  Future<ResponseSealed<void>> saveCitiesToLocalAndDeletePrevious(
      List<City> cities);
  Future<ResponseSealed<void>> saveCurrentCityToLocalAndDeletePrevious(
      City city);
  Future<ResponseSealed<void>> removeCurrentCityFromLocal();
  Future<ResponseSealed<void>> removeCitiesFromLocal();
}

class CityRepositoryImpl implements CityRepository {
  final RemoteRequestWrapper<List<City>> remoteRequestWrapperListCity;
  final CityRemoteDataSource cityRemoteDataSource;
  final CityLocalDataSource cityLocalDataSource;

  CityRepositoryImpl({
    required this.remoteRequestWrapperListCity,
    required this.cityRemoteDataSource,
    required this.cityLocalDataSource,
  });

  @override
  Future<ResponseSealed<List<City>>> fetchCitiesFromRemote() async {
    return await remoteRequestWrapperListCity(
        (httpHeaders) => cityRemoteDataSource.fetchCities(
              httpHeaders: httpHeaders,
            ));
  }

  @override
  Future<ResponseSealed<List<City>>> fetchCitiesFromLocal() async {
    try {
      List<City> foundInCache = await cityLocalDataSource.fetchCities();
      return ResponseSealed.success(foundInCache);
    } on MyCacheException catch (e) {
      return ResponseSealed.failure(CacheFailure(e.message));
    }
  }

  @override
  Future<ResponseSealed<City?>> fetchCurrentCityFromLocal() async {
    try {
      City? foundInCache = await cityLocalDataSource.fetchCurrentCity();
      return ResponseSealed.success(foundInCache);
    } on MyCacheException catch (e) {
      return ResponseSealed.failure(CacheFailure(e.message));
    }
  }

  @override
  Future<ResponseSealed<void>> saveCitiesToLocalAndDeletePrevious(
      List<City> cities) async {
    try {
      await cityLocalDataSource.deleteCities();
      await cityLocalDataSource.saveCities(cities);
      return const ResponseSealed.success(null);
    } on MyCacheException catch (e) {
      return ResponseSealed.failure(CacheFailure(e.message));
    }
  }

  @override
  Future<ResponseSealed<void>> saveCurrentCityToLocalAndDeletePrevious(
      City city) async {
    try {
      await cityLocalDataSource.deleteCurrentCity();
      await cityLocalDataSource.saveCurrentCity(city);
      return const ResponseSealed.success(null);
    } on MyCacheException catch (e) {
      return ResponseSealed.failure(CacheFailure(e.message));
    }
  }

  @override
  Future<ResponseSealed<void>> removeCitiesFromLocal() async {
    try {
      await cityLocalDataSource.deleteCities();
      return const ResponseSealed.success(null);
    } on MyCacheException catch (e) {
      return ResponseSealed.failure(CacheFailure(e.message));
    }
  }

  @override
  Future<ResponseSealed<void>> removeCurrentCityFromLocal() async {
    try {
      await cityLocalDataSource.deleteCurrentCity();
      return const ResponseSealed.success(null);
    } on MyCacheException catch (e) {
      return ResponseSealed.failure(CacheFailure(e.message));
    }
  }
}
