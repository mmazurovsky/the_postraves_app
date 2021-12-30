import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'src/common/utils/http_config.dart';
import 'src/providers_injection.dart';
import 'package:the_postraves_package/constants/my_colors.dart';

import 'src/app_configurations.dart';
import 'src/dependency_injection.dart';

void main() async {
  /* WidgetsFlutterBinding is the glue that binds the framework to the Flutter 
  engine. It must be initialized in order to init firebase which uses native 
  code */
  WidgetsFlutterBinding.ensureInitialized();
  /* Dependencies injection */
  setupServiceLocatorInjection();
  await Firebase.initializeApp();
  /* Load environment variables */
  await dotenv.load(fileName: ".env");
  /* Load savedLocale and use it from the start */
  await EasyLocalization.ensureInitialized();
  /* Enabling requests to http resources */
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
    return ProvidersInjection(
      child: MaterialApp(
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
    );
  }
}
