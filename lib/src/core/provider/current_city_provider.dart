import 'package:flutter/foundation.dart';
import '../../models/geo/city.dart';
import '../repository/city_repository.dart';

class CurrentCityProvider extends ChangeNotifier {
  final CityRepository _cityRepository;
  City? _myCurrentCity;

  CurrentCityProvider(
    this._cityRepository,
  );

  void changeCurrentCity(City city) async {
    if (_myCurrentCity != city) {
      _myCurrentCity = city;
      await _cityRepository.saveCurrentCityToLocalAndDeletePrevious(city);
      notifyListeners();
    }
  }

  City? get currentCity {
    return _myCurrentCity;
  }
}
