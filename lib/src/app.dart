import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/provider/country_list_provider.dart';
import 'cities_cleaner.dart';
import 'core/authentication/state/cubit/authentication_cubit.dart';
import 'core/provider/city_list_provider.dart';
import 'core/provider/current_city_provider.dart';
import 'core/repository/country_repository.dart';
import 'core/utils/screen_size.dart';
import 'features/chart/state/cubit/charts_cubit.dart';
import 'features/profile/state/cubit/profile_cubit.dart';
import 'features/search/state/cubit/search_cubit.dart';
import 'features/shows/state/shows_cubit/shows_cubit.dart';
import 'features/shows/state/view_switcher_cubit/view_switcher_cubit_cubit.dart';
import 'features/wiki/state/artist_cubit/artist_cubit.dart';
import 'features/wiki/state/event_cubit/event_cubit.dart';
import 'features/wiki/state/follow_cubit/follow_cubit.dart';
import 'features/wiki/state/place_cubit/place_cubit.dart';
import 'features/wiki/state/unity_cubit/unity_cubit.dart';
import 'initial_scaffold_resolver.dart';
import 'package:provider/provider.dart';
import 'core/configs/my_refresh_configuration.dart';
import 'core/repository/city_repository.dart';
import 'core/service/dynamic_link_service.dart';
import 'core/provider/current_tab_provider.dart';
import 'core/navigation_bar/bottom_navigation_tab_item.dart';

import 'dependency_injection.dart';

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
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => CurrentTabProvider(TabItem.shows),
          ),
          ChangeNotifierProvider(
            create: (_) => CurrentCityProvider(
              serviceLocator<CityRepository>(),
              serviceLocator<ProfileCubit>(),
            ),
          ),
          ChangeNotifierProvider(
            create: (_) => CityListProvider(
              serviceLocator<CityRepository>(),
            ),
          ),
          Provider(
            create: (_) => CountryListProvider(
              serviceLocator<CountryRepository>(),
            ),
          ),
        ],
        child: CitiesCleaner(
          cityRepository: serviceLocator(),
          child: DynamicLinksConfigurer(
            child: MyRefreshConfiguration(
              child: WillPopScope(
                onWillPop: () async => !await context
                    .watch<CurrentTabProvider>()
                    .currentTab
                    .tabNavigatorKey
                    .currentState!
                    .maybePop(),
                child: InitialScaffoldResolver(
                  countryRepository: serviceLocator<CountryRepository>(),
                  cityRepository: serviceLocator<CityRepository>(),
                  authenticationBloc: serviceLocator<AuthenticationCubit>(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
