import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'src/core/service/logger.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'src/app.dart';
import 'src/core/utils/my_colors.dart';
import 'src/dependency_injection.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocatorInjection();
  final firebaseApp = await Firebase.initializeApp();
  HttpOverrides.global = MyHttpOverrides();
  setupLogger();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
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
        accentColor: MyColors.accent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        canvasColor: Colors.transparent,
        textSelectionTheme:
            const TextSelectionThemeData(cursorColor: MyColors.accent),
        cupertinoOverrideTheme: const CupertinoThemeData(brightness: Brightness.dark),
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
