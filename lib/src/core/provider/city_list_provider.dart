import 'dart:async';

import '../../models/geo/city.dart';

import '../repository/city_repository.dart';

class CityListProvider {
  final CityRepository _cityRepository;
  List<City> _myCityList = [];
  Completer<List<City>> _citiesCompleter = Completer();

  CityListProvider(
    this._cityRepository,
  );

  void changeCityList(List<City> cities, bool isFromRemote) async {
    if (isFromRemote) {
      _myCityList = cities;
      await _cityRepository.saveCitiesToLocalAndDeletePrevious(cities);
    } else {
      if (_myCityList.isEmpty) {
        _myCityList = cities;
      }
    }
  }

  List<City> get cityList {
    return _myCityList;
  }

  Completer get citiesFutureCompleter => _citiesCompleter;

  Future<List<City>> get citiesFuture {
    return _citiesCompleter.future;
  }
}
