import '../../models/geo/country.dart';

import '../data/data_storage/app_database.dart';
import 'package:sembast/sembast.dart';

abstract class CountryLocalDataSource {
  Future<List<Country>> fetchCountries();
  Future<void> saveCountries(List<Country> countries);
  Future<void> deleteCountries();
}

class CountryLocalDataSourceImpl implements CountryLocalDataSource {
  static const String countriesStore = 'countries';
  final _countriesStore = stringMapStoreFactory.store(countriesStore);

  Future<Database> get _db async => await AppDatabase.instance.database;

  @override
  Future<void> deleteCountries() async {
    await _countriesStore.delete(await _db);
  }

  @override
  Future<List<Country>> fetchCountries() async {
    final records = await _countriesStore.find(await _db);
    final countries =
        records.map((element) => Country.fromJson(element.value)).toList();
    return countries;
  }

  @override
  Future<void> saveCountries(List<Country> countries) async {
    await deleteCountries();
    for (var element in countries) {
      await _countriesStore.record(element.name).add(
            await _db,
            element.toJson(),
          );
    }
  }
}
