import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../models/geo/city.dart';
import '../repository/city_repository.dart';

class CityListProvider extends ChangeNotifier {
  final CityRepository _cityRepository;
  List<City> _myCityList = [];
  final Completer<List<City>> _citiesCompleter = Completer();

  CityListProvider(
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
        // notifyListeners(); // I don't know about here
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
