import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:the_postraves_app/main.dart';
import 'package:the_postraves_app/src/common/authentication/repository/firebase_auth_repository.dart';
import 'package:the_postraves_app/src/common/geo_repository/city_local_repository.dart';
import 'package:the_postraves_app/src/common/navigation/navigation_scaffold.dart';
import 'package:the_postraves_app/src/dependency_injection.dart';
import 'package:the_postraves_app/src/features/chart/ui/screens/charts_screen.dart';
import 'package:the_postraves_app/src/features/profile/ui/screen/profile_screen.dart';
import 'package:the_postraves_app/src/features/profile/ui/screen/sign_in_methods_screen.dart';
import 'package:the_postraves_app/src/features/search/ui/screens/search_screen.dart';
import 'package:the_postraves_app/src/features/shows/ui/screens/shows_screen.dart';
import 'package:the_postraves_app/src/initial_scaffold_resolver.dart';
import 'package:the_postraves_package/client/response_sealed.dart';
import 'package:the_postraves_package/models/geo/city.dart';
import 'package:the_postraves_package/models/geo/country.dart';

import 'app_test.mocks.dart';

@GenerateMocks([CityLocalRepository, FirebaseAuthRepository])
void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await dotenv.load();

  group('General app tests', () {
    late EasyLocalization _appWithLocalization;
    late MockCityLocalRepository _mockCityLocalRepo;
    late MockFirebaseAuthRepository _mockFirebaseAuthRepo;

    setUpAll(() async {
      await Firebase.initializeApp();

      _appWithLocalization = EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ru')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: const MyApp(),
      );
    });

    setUp(() {
      serviceLocator.pushNewScope();
      setupServiceLocatorInjection();

      _mockCityLocalRepo = MockCityLocalRepository();
      _mockFirebaseAuthRepo = MockFirebaseAuthRepository();

      serviceLocator.unregister<CityLocalRepository>();
      serviceLocator.unregister<FirebaseAuthRepository>();

      serviceLocator
          .registerLazySingleton<CityLocalRepository>(() => _mockCityLocalRepo);
      serviceLocator.registerLazySingleton<FirebaseAuthRepository>(
          () => _mockFirebaseAuthRepo);
    });

    testWidgets(
        'Given first load of app without city When app is initialized Then city selector must open',
        (WidgetTester tester) async {
      when(_mockCityLocalRepo.fetchCitiesFromLocal())
          .thenAnswer((_) async => const ResponseSealed.success([]));
      when(_mockCityLocalRepo.fetchCurrentCityFromLocal())
          .thenAnswer((_) async => const ResponseSealed.success(null));
      when(_mockCityLocalRepo.saveCitiesToLocalAndDeletePrevious(any))
          .thenAnswer((_) async => const ResponseSealed.success(null));
      when(_mockFirebaseAuthRepo.currentUser).thenReturn(null);

      await tester.pumpWidget(_appWithLocalization);
      await tester.pumpAndSettle();

      expect(find.byType(CityPickerScaffold), findsOneWidget);
      expect(find.byType(NavigationScaffold), findsNothing);
    });

    testWidgets(
        'Given load of app with current city When app is initialized Then shows screen must return',
        (WidgetTester tester) async {
      when(_mockCityLocalRepo.fetchCitiesFromLocal())
          .thenAnswer((_) async => const ResponseSealed.success([]));
      when(_mockCityLocalRepo.fetchCurrentCityFromLocal()).thenAnswer(
        (_) async => const ResponseSealed.success(
          City(
            name: 'RU_Moscow',
            localName: 'Moscow',
            timeOffset: 3,
            country: Country(
              name: 'RU',
              localName: 'Russia',
              emojiCode: '🇷🇺',
            ),
          ),
        ),
      );
      when(_mockCityLocalRepo.saveCitiesToLocalAndDeletePrevious(any))
          .thenAnswer((_) async => const ResponseSealed.success(null));
      when(_mockCityLocalRepo.saveCurrentCityToLocalAndDeletePrevious(any))
          .thenAnswer((_) async => const ResponseSealed.success(null));
      when(_mockFirebaseAuthRepo.currentUser).thenReturn(null);

      await tester.pumpWidget(_appWithLocalization);
      await tester.pumpAndSettle();

      expect(find.byType(ShowsScreen), findsOneWidget);
      expect(find.byType(ChartsScreen), findsOneWidget);
      expect(find.byType(SignInMethodsScreen), findsOneWidget);
      expect(find.byType(ProfileScreen), findsNothing);
      expect(find.byType(SearchScreen), findsNothing);
    });
  });
}
