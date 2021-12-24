import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:the_postraves_app/src/common/authentication/repository/firebase_auth_repository.dart';
import 'package:the_postraves_app/src/common/geo_repository/city_local_repository.dart';
import 'package:the_postraves_app/src/common/navigation/navigation_scaffold.dart';
import 'package:the_postraves_app/src/dependency_injection.dart';
import 'package:the_postraves_app/src/features/profile/state/profile_cubit/profile_cubit.dart';
import 'package:the_postraves_app/src/initial_scaffold_resolver.dart';
import 'package:the_postraves_package/client/response_sealed.dart';
import 'app_test.mocks.dart';

@GenerateMocks([CityLocalRepository, FirebaseAuthRepository, ProfileCubit])
void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  // await EasyLocalization.ensureInitialized();
  // await dotenv.load();

  // // group('General app boot tests', () {
  // late EasyLocalization _appWithLocalization;
  late MockCityLocalRepository _mockCityLocalRepo;
  late MockFirebaseAuthRepository _mockFirebaseAuthRepo;
  late MockProfileCubit _mockProfileCubit;

  // // setUpAll(() async {

  // _appWithLocalization = EasyLocalization(
  //   supportedLocales: const [Locale('en'), Locale('ru')],
  //   path: 'assets/translations',
  //   fallbackLocale: const Locale('en'),
  //   child: const MyApp(),
  // );
  // // });

  setUp(() {
    serviceLocator.pushNewScope();
    setupServiceLocatorInjection();

    _mockCityLocalRepo = MockCityLocalRepository();
    _mockFirebaseAuthRepo = MockFirebaseAuthRepository();
    _mockProfileCubit = MockProfileCubit();

    serviceLocator.unregister<CityLocalRepository>();
    serviceLocator.unregister<FirebaseAuthRepository>();
    serviceLocator.unregister<ProfileCubit>();

    serviceLocator
        .registerLazySingleton<CityLocalRepository>(() => _mockCityLocalRepo);
    serviceLocator.registerLazySingleton<FirebaseAuthRepository>(
        () => _mockFirebaseAuthRepo);
    serviceLocator.registerLazySingleton<ProfileCubit>(() => _mockProfileCubit);
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

    // await tester.pumpWidget(_appWithLocalization);
    await tester.pumpWidget(Container());
    await tester.pumpAndSettle();

    expect(find.byType(Container), findsOneWidget);
    expect(find.byType(NavigationScaffold), findsNothing);
  });

  // testWidgets(
  //     'Given load of app with current city When app is initialized Then shows screen must return',
  //     (WidgetTester tester) async {
  //   when(_mockCityLocalRepo.fetchCitiesFromLocal())
  //       .thenAnswer((_) async => const ResponseSealed.success([]));
  //   when(_mockCityLocalRepo.fetchCurrentCityFromLocal()).thenAnswer(
  //     (_) async => const ResponseSealed.success(
  //       City(
  //         name: 'RU_Moscow',
  //         localName: 'Moscow',
  //         timeOffset: 3,
  //         country: Country(
  //           name: 'RU',
  //           localName: 'Russia',
  //           emojiCode: '🇷🇺',
  //         ),
  //       ),
  //     ),
  //   );
  //   when(_mockCityLocalRepo.saveCitiesToLocalAndDeletePrevious(any))
  //       .thenAnswer((_) async => const ResponseSealed.success(null));
  //   when(_mockCityLocalRepo.saveCurrentCityToLocalAndDeletePrevious(any))
  //       .thenAnswer((_) async => const ResponseSealed.success(null));
  //   when(_mockFirebaseAuthRepo.currentUser).thenReturn(null);

  //   await tester.pumpWidget(_appWithLocalization);
  //   await tester.pumpAndSettle();

  //   expect(find.byType(ShowsScreen), findsOneWidget);
  //   expect(find.byType(ChartsScreen), findsOneWidget);
  //   expect(find.byType(SignInMethodsScreen), findsOneWidget);
  //   expect(find.byType(ProfileScreen), findsNothing);
  //   expect(find.byType(SearchScreen), findsNothing);
  // });
// }

  // group('App screens tests', () {
  //   late EasyLocalization _appWithLocalization;
  //   late MockCityLocalRepository _mockCityLocalRepo;
  //   late MockFirebaseAuthRepository _mockFirebaseAuthRepo;

  //   setUpAll(() async {
  //     await Firebase.initializeApp();

  //     _appWithLocalization = EasyLocalization(
  //       supportedLocales: const [Locale('en'), Locale('ru')],
  //       path: 'assets/translations',
  //       fallbackLocale: const Locale('en'),
  //       child: const MyApp(),
  //     );
  //   });

  //     _mockCityLocalRepo = MockCityLocalRepository();
  //     _mockFirebaseAuthRepo = MockFirebaseAuthRepository();

  //     when(_mockCityLocalRepo.fetchCitiesFromLocal())
  //         .thenAnswer((_) async => const ResponseSealed.success([]));
  //     when(_mockCityLocalRepo.fetchCurrentCityFromLocal()).thenAnswer(
  //       (_) async => const ResponseSealed.success(
  //         City(
  //           name: 'RU_Moscow',
  //           localName: 'Moscow',
  //           timeOffset: 3,
  //           country: Country(
  //             name: 'RU',
  //             localName: 'Russia',
  //             emojiCode: '🇷🇺',
  //           ),
  //         ),
  //       ),
  //     );
  //     when(_mockCityLocalRepo.saveCitiesToLocalAndDeletePrevious(any))
  //         .thenAnswer((_) async => const ResponseSealed.success(null));
  //     when(_mockCityLocalRepo.saveCurrentCityToLocalAndDeletePrevious(any))
  //         .thenAnswer((_) async => const ResponseSealed.success(null));
  //     when(_mockFirebaseAuthRepo.currentUser).thenReturn(null);

  //   setUp(() {
  //     serviceLocator.pushNewScope();
  //     setupServiceLocatorInjection();

  //     serviceLocator.unregister<CityLocalRepository>();
  //     serviceLocator.unregister<FirebaseAuthRepository>();

  //     serviceLocator
  //         .registerLazySingleton<CityLocalRepository>(() => _mockCityLocalRepo);
  //     serviceLocator.registerLazySingleton<FirebaseAuthRepository>(
  //         () => _mockFirebaseAuthRepo);
  //   });

  //   testWidgets(
  //       'Given shows screen When city button tapped Then city selector must open',
  //       (WidgetTester tester) async {
  //     await tester.pumpWidget(_appWithLocalization);
  //     await tester.pumpAndSettle();

  //     expect(find.byType(ShowsScreen), findsOneWidget);

  //     final button = find.byType(ShowsTitleButton);
  //     await tester.tap(button);
  //     await tester.pumpAndSettle();
  //     expect(find.byType(CurrentCitySelector), findsOneWidget);
  //   });

//   testWidgets(
//       'Given shows screen When date filter tapped Then date filter must open',
//       (WidgetTester tester) async {
//     when(_mockCityLocalRepo.fetchCitiesFromLocal())
//         .thenAnswer((_) async => const ResponseSealed.success([]));
//     when(_mockCityLocalRepo.fetchCurrentCityFromLocal()).thenAnswer(
//       (_) async => const ResponseSealed.success(
//         City(
//           name: 'RU_Moscow',
//           localName: 'Moscow',
//           timeOffset: 3,
//           country: Country(
//             name: 'RU',
//             localName: 'Russia',
//             emojiCode: '🇷🇺',
//           ),
//         ),
//       ),
//     );
//     when(_mockCityLocalRepo.saveCitiesToLocalAndDeletePrevious(any))
//         .thenAnswer((_) async => const ResponseSealed.success(null));
//     when(_mockCityLocalRepo.saveCurrentCityToLocalAndDeletePrevious(any))
//         .thenAnswer((_) async => const ResponseSealed.success(null));
//     when(_mockFirebaseAuthRepo.currentUser).thenReturn(null);

//     await tester.pumpWidget(_appWithLocalization);
//     await tester.pumpAndSettle();

//     expect(find.byType(ShowsScreen), findsOneWidget);

//     final button = find.byKey(
//       const Key('shows-date-filter-button'),
//     );
//     await tester.tap(button);
//     await tester.pumpAndSettle();
//     expect(find.byType(ShowsDateFilterSelector), findsOneWidget);
//   });
}
// });
