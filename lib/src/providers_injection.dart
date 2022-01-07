import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'common/authentication/state/cubit/authentication_cubit.dart';
import 'common/bottom_navigation_bar/bottom_navigation_tab_item.dart';
import 'common/geo_change_notifier/city_change_notifier.dart';
import 'common/geo_change_notifier/country_list_change_notifier.dart';
import 'common/geo_change_notifier/current_city_change_notifier.dart';
import 'common/geo_change_notifier/current_tab_change_notifier.dart';
import 'common/geo_repository/city_local_repository.dart';
import 'common/geo_repository/country_local_repository.dart';
import 'dependency_injection.dart';
import 'features/chart/state/cubit/charts_cubit.dart';
import 'features/followable/state/followable_change_notifier.dart';
import 'features/profile/state/following_cubit/following_cubit.dart';
import 'features/profile/state/profile_cubit/profile_cubit.dart';
import 'features/search/state/cubit/search_cubit.dart';
import 'features/shows/state/date_filter_change_notifier.dart';
import 'features/shows/state/shows_cubit/shows_cubit.dart';
import 'features/shows/state/view_switcher_cubit/view_switcher_cubit.dart';
import 'features/timetable/timetable_cubit/timetable_cubit.dart';

class ProvidersInjection extends StatelessWidget {
  final Widget child;
  const ProvidersInjection({
    Key? key,
    required this.child,
  }) : super(key: key);

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
            create: (_) => serviceLocator<FollowableChangeNotifier>(),
          ),
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
        child: child,
      ),
    );
  }
}
