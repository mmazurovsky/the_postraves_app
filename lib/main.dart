import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:the_postraves_app/src/common/authentication/state/cubit/authentication_cubit.dart';
import 'package:the_postraves_app/src/common/bottom_navigation_bar/bottom_navigation_tab_item.dart';
import 'package:the_postraves_app/src/common/geo_change_notifier/city_change_notifier.dart';
import 'package:the_postraves_app/src/common/geo_change_notifier/country_list_change_notifier.dart';
import 'package:the_postraves_app/src/common/geo_change_notifier/current_city_change_notifier.dart';
import 'package:the_postraves_app/src/common/geo_change_notifier/current_tab_change_notifier.dart';
import 'package:the_postraves_app/src/common/geo_repository/city_local_repository.dart';
import 'package:the_postraves_app/src/common/geo_repository/country_local_repository.dart';
import 'package:the_postraves_app/src/features/chart/state/cubit/charts_cubit.dart';
import 'package:the_postraves_app/src/features/profile/state/following_cubit/following_cubit.dart';
import 'package:the_postraves_app/src/features/profile/state/profile_cubit/profile_cubit.dart';
import 'package:the_postraves_app/src/features/search/state/cubit/search_cubit.dart';
import 'package:the_postraves_app/src/features/shows/state/date_filter_change_notifier.dart';
import 'package:the_postraves_app/src/features/shows/state/shows_cubit/shows_cubit.dart';
import 'package:the_postraves_app/src/features/shows/state/view_switcher_cubit/view_switcher_cubit.dart';
import 'package:the_postraves_app/src/features/timetable/timetable_cubit/timetable_cubit.dart';
import 'package:the_postraves_package/constants/my_colors.dart';

import 'src/app_configurations.dart';
import 'src/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocatorInjection();
  await Firebase.initializeApp();
  await dotenv.load(fileName: ".env");
  await EasyLocalization.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: MyColors.screenBackground,
    systemNavigationBarColor: MyColors.bottomNavBar,
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ru')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: const MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        builder: (context, child) => MaterialApp(
          title: 'Postraves',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            canvasColor: Colors.transparent,
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: MyColors.accent,
              selectionColor: MyColors.main.withOpacity(0.2),
              selectionHandleColor: MyColors.accent,
            ),
            cupertinoOverrideTheme: const CupertinoThemeData(
              brightness: Brightness.dark,
              primaryColor: MyColors.main,
            ),
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: MyColors.accent),
          ),
          home: const AppConfigurations(),
        ),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
