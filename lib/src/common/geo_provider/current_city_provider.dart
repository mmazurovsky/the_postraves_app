import 'package:flutter/foundation.dart';
import 'package:the_postraves_package/models/geo/city.dart';
import '../../features/profile/state/profile_cubit/profile_cubit.dart';
import '../geo_repository/city_repository.dart';

class CurrentCityProvider extends ChangeNotifier {
  final CityRepository _cityRepository;
  final ProfileCubit _userProfileCubit;
  City? _myCurrentCity;

  CurrentCityProvider(
    this._cityRepository,
    this._userProfileCubit,
  );

  void changeCurrentCity(City city) async {
    if (_myCurrentCity?.name != city.name) {
      final previousCity = _myCurrentCity;
      _myCurrentCity = city;
      await _cityRepository.saveCurrentCityToLocalAndDeletePrevious(_myCurrentCity!);
      notifyListeners();
      if (previousCity != null) {
        _userProfileCubit.updateOnlyCityInUserProfile(_myCurrentCity!);
      }
    }
  }

  City? get currentCity {
    return _myCurrentCity;
  }
}
