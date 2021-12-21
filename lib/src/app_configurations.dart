import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'common/authentication/state/cubit/authentication_cubit.dart';
import 'package:the_postraves_package/followable/repository/general_repository.dart';
import 'package:the_postraves_package/models/geo/city.dart';
import 'package:the_postraves_package/models/geo/country.dart';
import 'common/configs/cities_cleaner.dart';
import 'common/bottom_navigation_bar/bottom_navigation_tab_item.dart';
import 'common/configs/my_refresh_configuration.dart';
import 'common/geo_change_notifier/current_tab_change_notifier.dart';
import 'common/geo_repository/city_local_repository.dart';
import 'common/geo_repository/country_local_repository.dart';
import 'common/configs/dynamic_link_configurer.dart';
import 'common/utils/screen_size.dart';
import 'dependency_injection.dart';
import 'initial_scaffold_resolver.dart';

class AppConfigurations extends StatefulWidget {
  const AppConfigurations({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AppConfigurationsState();
}

class AppConfigurationsState extends State<AppConfigurations> with WidgetsBindingObserver {
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
    return CitiesCleaner(
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
              countryLocalRepository: serviceLocator<CountryLocalRepository>(),
              cityLocalRepository: serviceLocator<CityLocalRepository>(),
              authenticationBloc: serviceLocator<AuthenticationCubit>(),
              cityRemoteRepository: serviceLocator<GeneralRepository<City>>(),
              countryRemoteRepository:
                  serviceLocator<GeneralRepository<Country>>(),
            ),
          ),
        ),
      ),
    );
  }
}
