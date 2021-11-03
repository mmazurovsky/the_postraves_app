import 'dart:async';

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import 'package:the_postraves_package/models/geo/city.dart';
import 'package:the_postraves_package/models/geo/country.dart';

import 'common/authentication/state/cubit/authentication_cubit.dart';
import 'common/constants/my_text_styles.dart';
import 'common/geo_provider/city_list_provider.dart';
import 'common/geo_provider/country_list_provider.dart';
import 'common/geo_provider/current_city_provider.dart';
import 'common/geo_repository/city_repository.dart';
import 'common/geo_repository/country_repository.dart';
import 'common/widgets/other/loading_container.dart';
import 'common/widgets/other/select_location_list_view.dart';
import 'common/widgets/spacers/my_horizontal_padding.dart';
import 'common/widgets/spacers/my_spacers.dart';
import 'navigation_scaffold.dart';

class InitialScaffoldResolver extends StatefulWidget {
  final CityRepository cityRepository;
  final CountryRepository countryRepository;
  final AuthenticationCubit authenticationBloc;

  const InitialScaffoldResolver({
    Key? key,
    required this.cityRepository,
    required this.countryRepository,
    required this.authenticationBloc,
  }) : super(key: key);

  @override
  _InitialScaffoldResolverState createState() =>
      _InitialScaffoldResolverState();
}

class _InitialScaffoldResolverState extends State<InitialScaffoldResolver> {
  @override
  void initState() {
    super.initState();
    widget.authenticationBloc.stream.listen((state) {
      state.maybeWhen(
          authenticated: (userProfile) => context
              .read<CurrentCityProvider>()
              .changeCurrentCity(userProfile.currentCity),
          orElse: () {}); //TODO Exception
    });

    CurrentCityProvider currentCityProvider =
        context.read<CurrentCityProvider>();

    widget.cityRepository.fetchCurrentCityFromLocal().then((value) {
      value.when(
          success: (data) {
            final currentCityFromLocal = data as City?;
            if (currentCityFromLocal != null) {
              currentCityProvider.changeCurrentCity(currentCityFromLocal);
            }
          },
          failure: (failure, failureMessage) => {}); //TODO Exception
    });

    CityListProvider cityListProvider = context.read<CityListProvider>();

    widget.cityRepository.fetchCitiesFromLocal().then((value) {
      value.when(
          success: (data) {
            final citiesFromLocal = data as List<City>?;
            if (citiesFromLocal != null && citiesFromLocal.isNotEmpty) {
              cityListProvider.changeCityList(citiesFromLocal, false);
              if (!cityListProvider.citiesFutureCompleter.isCompleted) {
                cityListProvider.citiesFutureCompleter
                    .complete(citiesFromLocal);
              }
            }
          },
          failure: (failure, failureMessage) {});
    });

    widget.cityRepository.fetchCitiesFromRemote().then((value) {
      value.when(
          success: (data) {
            final citiesFromRemote = data as List<City>?;
            if (citiesFromRemote != null && citiesFromRemote.isNotEmpty) {
              cityListProvider.changeCityList(citiesFromRemote, true);
              if (!cityListProvider.citiesFutureCompleter.isCompleted) {
                cityListProvider.citiesFutureCompleter
                    .complete(citiesFromRemote);
              }
            }
          },
          failure: (failure, failureMessage) {});
    });

    CountryListProvider countryListProvider =
        context.read<CountryListProvider>();

    widget.countryRepository.fetchCountriesFromRemote().then((value) {
      value.when(
          success: (data) {
            final countriesFromRemote = data as List<Country>?;
            if (countriesFromRemote != null && countriesFromRemote.isNotEmpty) {
              countryListProvider.changeCountryList(countriesFromRemote, true);
            }
          },
          failure: (failure, failureMessage) {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // check if there is current city in local storage or user is authenticated
    // and it has been assigned to current city
    City? currentCity = context.watch<CurrentCityProvider>().currentCity;
    return currentCity == null
        ? CityPickerScaffold()
        : NavigationScaffold();
  }
}

class CityPickerScaffold extends StatefulWidget {
  const CityPickerScaffold({Key? key}) : super(key: key);

  @override
  _CityPickerScaffoldState createState() => _CityPickerScaffoldState();
}

class _CityPickerScaffoldState extends State<CityPickerScaffold> {
  City? activeCity;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 2),
          () => context.read<CityListProvider>().citiesFuture),
      builder: (context, snapshot) {
        return Scaffold(
          backgroundColor: MyColors.screenBackground,
          body: SafeArea(
            child: snapshot.hasData
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyHorizontalPadding(
                        child: const Text(
                          'selectCityTitle',
                          style: MyTextStyles.fullEventCardTitle,
                        ).tr(),
                      ),
                      const MyMediumSpacer(),
                      SelectLocationListView<City>(
                        isShrinkWrap: true,
                        locations: context.read<CityListProvider>().cityList,
                        activeLocation: activeCity,
                        onLocationTap: (City cityTapped) {
                          setState(() {
                            activeCity = cityTapped;
                          });
                          context
                              .read<CurrentCityProvider>()
                              .changeCurrentCity(cityTapped);
                        },
                      ),
                    ],
                  )
                : const LoadingContainer(),
          ),
        );
      },
    );
  }
}
