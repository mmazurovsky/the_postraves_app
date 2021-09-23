import '../repository/country_repository.dart';
import '../../models/geo/country.dart';

class CountryListProvider {
  final CountryRepository _countryRepository;
  List<Country> _myCountryList = [];

  CountryListProvider(
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
