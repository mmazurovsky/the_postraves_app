import 'dart:ffi';

import '../client/data_sealed/response_sealed.dart';
import '../../models/geo/city.dart';
import '../client/remote_request_wrapper.dart';
import '../data_sources/city_local_data_source.dart';
import '../data_sources/city_remote_data_source.dart';
import '../error/exceptions.dart';
import '../error/failures.dart';

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
    } on CacheException {
      return ResponseSealed.failure(CacheFailure());
    }
  }

  @override
  Future<ResponseSealed<City?>> fetchCurrentCityFromLocal() async {
    try {
      City? foundInCache = await cityLocalDataSource.fetchCurrentCity();
      return ResponseSealed.success(foundInCache);
    } on CacheException {
      return ResponseSealed.failure(CacheFailure());
    }
  }

  @override
  Future<ResponseSealed<void>> saveCitiesToLocalAndDeletePrevious(
      List<City> cities) async {
    try {
      await cityLocalDataSource.deleteCities();
      await cityLocalDataSource.saveCities(cities);
      return ResponseSealed.success(Void);
    } on CacheException {
      return ResponseSealed.failure(CacheFailure());
    }
  }

  @override
  Future<ResponseSealed<void>> saveCurrentCityToLocalAndDeletePrevious(
      City city) async {
    try {
      await cityLocalDataSource.deleteCurrentCity();
      await cityLocalDataSource.saveCurrentCity(city);
      return ResponseSealed.success(Void);
    } on CacheException {
      return ResponseSealed.failure(CacheFailure());
    }
  }

  @override
  Future<ResponseSealed<void>> removeCitiesFromLocal() async {
    try {
      await cityLocalDataSource.deleteCities();
      return ResponseSealed.success(Void);
    } on CacheException {
      return ResponseSealed.failure(CacheFailure());
    }
  }

  @override
  Future<ResponseSealed<void>> removeCurrentCityFromLocal() async {
    try {
      await cityLocalDataSource.deleteCurrentCity();
      return ResponseSealed.success(Void);
    } on CacheException {
      return ResponseSealed.failure(CacheFailure());
    }
  }
}
