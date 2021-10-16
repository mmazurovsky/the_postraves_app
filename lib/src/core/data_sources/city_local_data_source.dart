import 'package:sembast/sembast.dart';

import '../../models/geo/city.dart';
import '../data/data_storage/app_database.dart';

abstract class CityLocalDataSource {
  Future<List<City>> fetchCities();
  Future<void> saveCities(List<City> cities);
  Future<City?> fetchCurrentCity();
  Future<void> saveCurrentCity(City city);
  Future<void> deleteCities();
  Future<void> deleteCurrentCity();
}

class CityLocalDataSourceImpl implements CityLocalDataSource {
  static const String citiesStore = 'cities';
  static const String currentCityStore = 'current_city';
  final _citiesStore = stringMapStoreFactory.store(citiesStore);
  final _currentCityStore = stringMapStoreFactory.store(currentCityStore);

  Future<Database> get _db async => await AppDatabase.instance.database;

  @override
  Future<void> deleteCities() async {
    await _citiesStore.delete(await _db);
  }

  @override
  Future<void> deleteCurrentCity() async {
    await _currentCityStore.delete(await _db);
  }

  @override
  Future<List<City>> fetchCities() async {
    final records = await _currentCityStore.find(await _db);
    final cities =
        records.map((element) => City.fromJson(element.value)).toList();
    return cities;
  }

  @override
  Future<City?> fetchCurrentCity() async {
    final record = await _currentCityStore.findFirst(await _db);
    return record != null ? City.fromJson(record.value) : null;
  }

  @override
  Future<void> saveCities(List<City> cities) async {
    for (var element in cities) {
      await _citiesStore.record(element.name).add(
            await _db,
            element.toJson(),
          );
    }
  }

  @override
  Future<void> saveCurrentCity(City city) async {
    await _currentCityStore.record(city.name).add(
          await _db,
          city.toJson(),
        );
  }
}
