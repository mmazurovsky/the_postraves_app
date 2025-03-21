import 'dart:async';

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:the_postraves_app/src/common/geo_change_notifier/city_change_notifier.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import 'package:the_postraves_package/followable/repository/general_repository.dart';
import 'package:the_postraves_package/models/geo/city.dart';
import 'package:the_postraves_package/models/geo/country.dart';

import 'common/authentication/state/cubit/authentication_cubit.dart';
import 'common/constants/my_text_styles.dart';
import 'common/geo_change_notifier/country_list_change_notifier.dart';
import 'common/geo_change_notifier/current_city_change_notifier.dart';
import 'common/geo_repository/city_local_repository.dart';
import 'common/geo_repository/country_local_repository.dart';
import 'common/widgets/other/loading_container.dart';
import 'common/widgets/other/select_location_list_view.dart';
import 'common/widgets/spacers/my_horizontal_padding.dart';
import 'common/widgets/spacers/my_spacers.dart';
import 'common/navigation/navigation_scaffold.dart';

class InitialScaffoldResolver extends StatefulWidget {
  final CityLocalRepository cityLocalRepository;
  final CountryLocalRepository countryLocalRepository;
  final GeneralRepository<Country> countryRemoteRepository;
  final GeneralRepository<City> cityRemoteRepository;
  final AuthenticationCubit authenticationBloc;

  const InitialScaffoldResolver({
    Key? key,
    required this.cityLocalRepository,
    required this.countryLocalRepository,
    required this.authenticationBloc,
    required this.cityRemoteRepository,
    required this.countryRemoteRepository,
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
              .read<CurrentCityChangeNotifier>()
              .changeCurrentCity(userProfile.currentCity),
          orElse: () {}); //TODO Exception
    });

    CurrentCityChangeNotifier currentCityProvider =
        context.read<CurrentCityChangeNotifier>();

    widget.cityLocalRepository.fetchCurrentCityFromLocal().then((value) {
      value.when(success: (data) {
        final currentCityFromLocal = data;
        if (currentCityFromLocal != null) {
          currentCityProvider.changeCurrentCity(currentCityFromLocal);
        }
      }, failure: (failure) {
        widget.cityLocalRepository.removeCurrentCityFromLocal();
      }); //TODO Exception
    });

    CityListChangeNotifier cityListProvider =
        context.read<CityListChangeNotifier>();

    widget.cityLocalRepository.fetchCitiesFromLocal().then((value) {
      value.when(success: (data) {
        final citiesFromLocal = data;
        if (citiesFromLocal.isNotEmpty) {
          cityListProvider.changeCityList(citiesFromLocal, false);
          if (!cityListProvider.citiesFutureCompleter.isCompleted) {
            cityListProvider.citiesFutureCompleter.complete(citiesFromLocal);
          }
        }
      }, failure: (failure) {
        widget.cityLocalRepository.removeCitiesFromLocal();
      });
    });

    widget.cityRemoteRepository.fetchAllFromRemote().then((value) {
      value.when(
          success: (data) {
            final citiesFromRemote = data;
            if (citiesFromRemote.isNotEmpty) {
              cityListProvider.changeCityList(citiesFromRemote, true);
              if (!cityListProvider.citiesFutureCompleter.isCompleted) {
                cityListProvider.citiesFutureCompleter
                    .complete(citiesFromRemote);
              }
            }
          },
          failure: (failure) {});
    });

    CountryListChangeNotifier countryListChangeNotifier =
        context.read<CountryListChangeNotifier>();

    widget.countryRemoteRepository.fetchAllFromRemote().then((value) {
      value.when(
          success: (data) {
            if (data.isNotEmpty) {
              countryListChangeNotifier.changeCountryList(data, true);
            }
          },
          failure: (failure) {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // check if there is current city in local storage or user is authenticated
    // and it has been assigned to current city
    City? currentCity = context.watch<CurrentCityChangeNotifier>().currentCity;
    return currentCity == null
        ? const CityPickerScaffold()
        : const NavigationScaffold();
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
      future: Future.delayed(const Duration(seconds: 2),
          () => context.read<CityListChangeNotifier>().citiesFuture),
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
                        locations:
                            context.read<CityListChangeNotifier>().cityList,
                        activeLocation: activeCity,
                        onLocationTap: (City cityTapped) {
                          setState(() {
                            activeCity = cityTapped;
                          });
                          context
                              .read<CurrentCityChangeNotifier>()
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
