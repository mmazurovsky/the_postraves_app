import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:the_postraves_app/src/common/geo_change_notifier/city_change_notifier.dart';
import 'package:the_postraves_app/src/features/shows/state/date_filter_change_notifier.dart';
import 'common/authentication/state/cubit/authentication_cubit.dart';
import 'package:the_postraves_package/followable/repository/general_repository.dart';
import 'package:the_postraves_package/models/geo/city.dart';
import 'package:the_postraves_package/models/geo/country.dart';
import 'common/configs/cities_cleaner.dart';
import 'common/bottom_navigation_bar/bottom_navigation_tab_item.dart';
import 'common/configs/my_refresh_configuration.dart';
import 'common/geo_change_notifier/country_list_change_notifier.dart';
import 'common/geo_change_notifier/current_city_change_notifier.dart';
import 'common/geo_change_notifier/current_tab_change_notifier.dart';
import 'common/geo_repository/city_local_repository.dart';
import 'common/geo_repository/country_local_repository.dart';
import 'common/configs/dynamic_link_configurer.dart';
import 'common/utils/screen_size.dart';
import 'dependency_injection.dart';
import 'features/chart/state/cubit/charts_cubit.dart';
import 'features/profile/state/following_cubit/following_cubit.dart';
import 'features/profile/state/profile_cubit/profile_cubit.dart';
import 'features/search/state/cubit/search_cubit.dart';
import 'features/shows/state/shows_cubit/shows_cubit.dart';
import 'features/shows/state/view_switcher_cubit/view_switcher_cubit.dart';
import 'features/timetable/timetable_cubit/timetable_cubit.dart';
import 'initial_scaffold_resolver.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> with WidgetsBindingObserver {
  @override
  void didChangeDependencies() {
    ScreenSize.setSize(
      MediaQuery.of(context).size.height,
      MediaQuery.of(context).size.width,
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceLocator<AuthenticationCubit>(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<ShowsCubit>(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<SearchCubit>(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<ChartsCubit>(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<ViewSwitcherCubit>(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<ProfileCubit>(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<TimetableCubit>(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<FollowingCubit>(),
        ),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => CurrentTabChangeNotifier(TabItem.shows),
          ),
          ChangeNotifierProvider(
            create: (_) => serviceLocator<CurrentCityChangeNotifier>(),
          ),
          ChangeNotifierProvider(
            create: (_) => CityListChangeNotifier(
              serviceLocator<CityLocalRepository>(),
            ),
          ),
          ChangeNotifierProvider(
            create: (_) => serviceLocator<DateTimeFilterChangeNotifier>(),
          ),
          Provider(
            create: (_) => CountryListChangeNotifier(
              serviceLocator<CountryLocalRepository>(),
            ),
          ),
        ],
        builder: (context, child) => CitiesCleaner(
          cityRepository: serviceLocator(),
          child: DynamicLinksConfigurer(
            child: MyRefreshConfiguration(
              child: WillPopScope(
                onWillPop: () async {
                  final currentTab =
                      context.read<CurrentTabChangeNotifier>().currentTab;
                  final navigatorCurrentState =
                      currentTab.tabNavigatorKey.currentState!;
                  final canPop = navigatorCurrentState.canPop();
                  if (canPop) {
                    navigatorCurrentState.pop();
                    return false;
                  } else {
                    if (currentTab.index != 0) {
                      context
                          .read<CurrentTabChangeNotifier>()
                          .changeCurrentTab(TabItem.values.first);
                      return false;
                    } else {
                      SystemChannels.platform
                          .invokeMethod('SystemNavigator.pop'); // close the app
                      return true;
                    }
                  }
                },
                child: InitialScaffoldResolver(
                  countryLocalRepository:
                      serviceLocator<CountryLocalRepository>(),
                  cityLocalRepository: serviceLocator<CityLocalRepository>(),
                  authenticationBloc: serviceLocator<AuthenticationCubit>(),
                  cityRemoteRepository:
                      serviceLocator<GeneralRepository<City>>(),
                  countryRemoteRepository:
                      serviceLocator<GeneralRepository<Country>>(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
