import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'src/app.dart';
import 'src/core/utils/my_colors.dart';
import 'src/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocatorInjection();
  await Firebase.initializeApp();
  // if (kDebugMode) {
  //   // Force disable Crashlytics collection while doing every day development.
  //   // Temporarily toggle this to true if you want to test crash reporting in your app.
  //   await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  // }
  HttpOverrides.global = MyHttpOverrides();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Postraves',
      debugShowCheckedModeBanner: false,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      // localeResolutionCallback: (userLocale, supportedLocales) {
      //   supportedLocales.forEach((supportedLocale) {
      //     if (userLocale != null &&
      //         supportedLocale.languageCode == userLocale.languageCode) {
      //       return supportedLocale;
      //     }
      //   });
      //   return supportedLocales.first;
      // },
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        canvasColor: Colors.transparent,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: MyColors.accent,
          selectionColor: MyColors.accent,
          selectionHandleColor: MyColors.accent,
        ),
        cupertinoOverrideTheme: const CupertinoThemeData(
          brightness: Brightness.dark,
          primaryColor: MyColors.main,
        ),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: MyColors.accent),
      ),
      home: const App(),
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
