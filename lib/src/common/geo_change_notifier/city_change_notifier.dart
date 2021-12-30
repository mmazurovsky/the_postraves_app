import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:the_postraves_package/models/geo/city.dart';

import '../geo_repository/city_local_repository.dart';

class CityListChangeNotifier extends ChangeNotifier {
  final CityLocalRepository _cityRepository;
  List<City> _myCityList = [];
  final Completer<List<City>> _citiesCompleter = Completer();

  CityListChangeNotifier(
    this._cityRepository,
  );

  void changeCityList(List<City> cities, bool isFromRemote) async {
    if (isFromRemote) {
      _myCityList = cities;
      notifyListeners();
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
