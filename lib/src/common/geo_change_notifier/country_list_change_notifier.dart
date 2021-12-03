import 'package:the_postraves_package/models/geo/country.dart';

import '../geo_repository/country_local_repository.dart';

class CountryListChangeNotifier {
  final CountryLocalRepository _countryRepository;
  List<Country> _myCountryList = [];

  CountryListChangeNotifier(
    this._countryRepository,
  );

  void changeCountryList(List<Country> countries, bool isFromRemote) async {
    if (isFromRemote) {
      _myCountryList = countries;
      await _countryRepository.saveCountriesToLocalAndDeletePrevious(countries);
    } else {
      if (_myCountryList.isEmpty) {
        _myCountryList = countries;
      }
    }
  }

  List<Country> get countryList {
    return _myCountryList;
  }
}
