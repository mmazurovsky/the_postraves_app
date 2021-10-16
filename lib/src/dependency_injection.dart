import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'features/timetable/timetable_cubit/timetable_cubit.dart';
import 'features/wiki/data_sources/artist_remote_data_source.dart';
import 'features/wiki/data_sources/event_remote_data_source.dart';
import 'features/wiki/data_sources/place_remote_data_source.dart';
import 'features/wiki/data_sources/unity_remote_data_source.dart';
import 'features/wiki/repository/artist_repository.dart';
import 'features/wiki/repository/event_repository.dart';
import 'features/wiki/repository/place_repository.dart';
import 'features/wiki/repository/unity_repository.dart';
import 'models/related_to_place/scene.dart';
import 'core/authentication/state/cubit/authentication_cubit.dart';
import 'core/data_sources/country_local_data_source.dart';
import 'core/data_sources/country_remote_data_source.dart';
import 'core/repository/country_repository.dart';
import 'core/utils/followable_client_helper.dart';
import 'features/chart/state/cubit/charts_cubit.dart';
import 'features/profile/state/cubit/profile_cubit.dart';
import 'features/search/state/cubit/search_cubit.dart';
import 'features/shows/state/view_switcher_cubit/view_switcher_cubit_cubit.dart';
import 'features/wiki/state/artist_cubit/artist_cubit.dart';
import 'features/wiki/state/event_cubit/event_cubit.dart';
import 'features/wiki/state/follow_cubit/follow_cubit.dart';
import 'features/wiki/state/place_cubit/place_cubit.dart';
import 'models/related_to_search/aggregated_search_model.dart';
import 'models/shorts/event_short.dart';
import 'core/data_sources/city_local_data_source.dart';
import 'core/data_sources/city_remote_data_source.dart';
import 'core/repository/city_repository.dart';
import 'core/authentication/repository/firebase_auth_repository.dart';
import 'core/client/remote_request_wrapper.dart';
import 'core/service/dynamic_link_service.dart';
import 'core/client/network_info.dart';
import 'features/chart/data_sources/charts_remote_data_source.dart';
import 'features/chart/repository/charts_repository.dart';
import 'features/profile/data_sources/user_profile_data_source.dart';
import 'features/profile/repository/firebase_image_repository_impl.dart';
import 'features/profile/repository/user_profile_repository_impl.dart';
import 'features/search/data_sources/search_local_data_source.dart';
import 'features/search/data_sources/search_remote_data_source.dart';
import 'features/search/repository/aggregated_search_repository_impl.dart';
import 'features/shows/data_sources/shows_remote_data_source.dart';
import 'features/shows/repository/shows_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'features/shows/state/shows_cubit/shows_cubit.dart';
import 'features/wiki/data_sources/wiki_remote_data_source.dart';
import 'features/wiki/repository/wiki_repository.dart';
import 'features/wiki/state/unity_cubit/unity_cubit.dart';
import 'models/fulls/artist_full.dart';
import 'models/fulls/event_full.dart';
import 'models/fulls/place_full.dart';
import 'models/fulls/unity_full.dart';
import 'models/geo/city.dart';
import 'models/geo/country.dart';
import 'models/related_to_event/shows_by_date.dart';
import 'models/related_to_event/timetable_for_scene.dart';
import 'models/shorts/artist_short.dart';
import 'models/shorts/place_short.dart';
import 'models/shorts/unity_short.dart';
import 'models/user/user_profile.dart';

final serviceLocator = GetIt.instance;

void setupServiceLocatorInjection() async {
  //* Core

  serviceLocator.registerLazySingleton<CityRepository>(() => CityRepositoryImpl(
        cityRemoteDataSource: serviceLocator(),
        cityLocalDataSource: serviceLocator(),
        remoteRequestWrapperListCity: serviceLocator(),
      ));

  serviceLocator
      .registerLazySingleton<CountryRepository>(() => CountryRepositoryImpl(
            countryRemoteDataSource: serviceLocator(),
            countryLocalDataSource: serviceLocator(),
            remoteRequestWrapperListCountry: serviceLocator(),
          ));

  serviceLocator.registerLazySingleton<CityRemoteDataSource>(
      () => CityRemoteDataSourceImpl());

  serviceLocator.registerLazySingleton<CountryRemoteDataSource>(
      () => CountryRemoteDataSourceImpl());

  serviceLocator.registerLazySingleton<CityLocalDataSource>(
      () => CityLocalDataSourceImpl());

  serviceLocator.registerLazySingleton<CountryLocalDataSource>(
      () => CountryLocalDataSourceImpl());

  serviceLocator.registerLazySingleton<RemoteRequestWrapper<List<City>>>(() =>
      RemoteRequestWrapperImpl<List<City>>(serviceLocator(), serviceLocator()));

  serviceLocator.registerLazySingleton<RemoteRequestWrapper<List<Country>>>(
      () => RemoteRequestWrapperImpl<List<Country>>(
          serviceLocator(), serviceLocator()));

  serviceLocator
      .registerLazySingleton<DynamicLinkService>(() => DynamicLinkService());

  serviceLocator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  serviceLocator.registerLazySingleton<RemoteRequestWrapper<List<ShowsByDate>>>(
      () => RemoteRequestWrapperImpl<List<ShowsByDate>>(
          serviceLocator(), serviceLocator()));

  serviceLocator.registerLazySingleton<RemoteRequestWrapper<List<EventFull>>>(
      () => RemoteRequestWrapperImpl<List<EventFull>>(
          serviceLocator(), serviceLocator()));

  serviceLocator.registerLazySingleton<RemoteRequestWrapper<List<ArtistShort>>>(
      () => RemoteRequestWrapperImpl<List<ArtistShort>>(
          serviceLocator(), serviceLocator()));

  serviceLocator.registerLazySingleton<RemoteRequestWrapper<List<UnityShort>>>(
      () => RemoteRequestWrapperImpl<List<UnityShort>>(
          serviceLocator(), serviceLocator()));

  serviceLocator.registerLazySingleton<RemoteRequestWrapper<List<PlaceShort>>>(
      () => RemoteRequestWrapperImpl<List<PlaceShort>>(
          serviceLocator(), serviceLocator()));

  //* Firebase

  serviceLocator
      .registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  serviceLocator
      .registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance);

  serviceLocator.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);

  serviceLocator.registerLazySingleton<FirebaseMessaging>(
      () => FirebaseMessaging.instance);

  //* Auth
  serviceLocator.registerLazySingleton<AuthenticationCubit>(
      () => AuthenticationCubit(serviceLocator(), serviceLocator()));

  serviceLocator.registerLazySingleton<FirebaseAuthRepository>(
      () => FirebaseAuthRepositioryImpl(serviceLocator()));

  serviceLocator.registerLazySingleton<UserProfileRepository>(() =>
      UserProfileRepositoryImpl(
          serviceLocator(), serviceLocator(), serviceLocator()));

  serviceLocator.registerLazySingleton<RemoteRequestWrapper<bool>>(
      () => RemoteRequestWrapperImpl<bool>(serviceLocator(), serviceLocator()));

  serviceLocator.registerLazySingleton<UserProfileDataSource>(
      () => UserProfileDataSourceImpl());

  serviceLocator.registerLazySingleton<RemoteRequestWrapper<UserProfile?>>(() =>
      RemoteRequestWrapperImpl<UserProfile?>(
          serviceLocator(), serviceLocator()));

  //* Features - Profile
  serviceLocator.registerLazySingleton(
      () => ProfileCubit(serviceLocator(), serviceLocator(), serviceLocator()));

  serviceLocator.registerLazySingleton<FirebaseImageRepository>(
      () => FirebaseImageRepositoryImpl());

  //* Features - Shows
  serviceLocator.registerLazySingleton(() => ShowsCubit(
        showsRepository: serviceLocator(),
        viewSwitcherBloc: serviceLocator(),
      ));

  serviceLocator.registerLazySingleton(() => ViewSwitcherCubit());

  serviceLocator
      .registerLazySingleton<ShowsRepository>(() => ShowsRepositoryImpl(
            showsRemoteDataSource: serviceLocator(),
            remoteRequestWrapperByDate: serviceLocator(),
            remoteRequestWrapperByRating: serviceLocator(),
          ));

  serviceLocator.registerLazySingleton<ShowsRemoteDataSource>(
      () => ShowsRemoteDataSourceImpl());

  serviceLocator.registerLazySingleton<RemoteRequestWrapper<List<EventShort>>>(
      () => RemoteRequestWrapperImpl<List<EventShort>>(
          serviceLocator(), serviceLocator()));

  //* Features - Search
  serviceLocator.registerLazySingleton(() => SearchCubit(
        serviceLocator(),
      ));

  serviceLocator.registerLazySingleton<AggregatedSearchRepository>(
      () => AggregatedSearchRepositoryImpl(
            searchLocalDataSource: serviceLocator(),
            searchRemoteDataSource: serviceLocator(),
            remoteRequestWrapper: serviceLocator(),
          ));

  serviceLocator.registerLazySingleton<SearchRemoteDataSource>(
      () => SearchRemoteDataSourceImpl());

  serviceLocator.registerLazySingleton<SearchLocalDataSource>(
      () => SearchLocalDataSourceImpl());

  serviceLocator
      .registerLazySingleton<RemoteRequestWrapper<AggregatedSearchModel>>(() =>
          RemoteRequestWrapperImpl<AggregatedSearchModel>(
              serviceLocator(), serviceLocator()));

  //* Features - Charts
  serviceLocator.registerLazySingleton(() => ChartsCubit(
        serviceLocator(),
      ));

  //* Rating ArtistFull
  serviceLocator.registerLazySingleton<ChartsRepository<ArtistShort>>(
      () => ChartsRepositoryImpl<ArtistShort>(
            chartsRemoteDataSource: serviceLocator(),
            remoteRequestWrapperForList: serviceLocator(),
            remoteRequestWrapperForSingle: serviceLocator(),
          ));

  serviceLocator.registerLazySingleton<FollowableClientHelper<ArtistShort>>(
      () => ArtistShortClientHelper());
  serviceLocator.registerLazySingleton<FollowableClientHelper<ArtistFull>>(
      () => ArtistFullClientHelper());
  serviceLocator.registerLazySingleton<FollowableClientHelper<UnityShort>>(
      () => UnityShortClientHelper());
  serviceLocator.registerLazySingleton<FollowableClientHelper<UnityFull>>(
      () => UnityFullClientHelper());
  serviceLocator.registerLazySingleton<FollowableClientHelper<PlaceShort>>(
      () => PlaceShortClientHelper());
  serviceLocator.registerLazySingleton<FollowableClientHelper<PlaceFull>>(
      () => PlaceFullClientHelper());
  serviceLocator.registerLazySingleton<FollowableClientHelper<EventFull>>(
      () => EventFullClientHelper());
  serviceLocator.registerLazySingleton<FollowableClientHelper<EventShort>>(
      () => EventShortClientHelper());

  serviceLocator.registerLazySingleton<ChartsRemoteDataSource<ArtistShort>>(
      () => ChartsRemoteDataSourceImpl<ArtistShort>(serviceLocator()));

  serviceLocator.registerLazySingleton<RemoteRequestWrapper<ArtistShort>>(() =>
      RemoteRequestWrapperImpl<ArtistShort>(
          serviceLocator(), serviceLocator()));

  serviceLocator.registerLazySingleton<RemoteRequestWrapper<ArtistShort?>>(() =>
      RemoteRequestWrapperImpl<ArtistShort?>(
          serviceLocator(), serviceLocator()));

  //* Features - Wiki

  serviceLocator.registerLazySingleton<RemoteRequestWrapper<void>>(
      () => RemoteRequestWrapperImpl<void>(serviceLocator(), serviceLocator()));

  //* Wiki EventFull
  serviceLocator
      .registerFactory(() => EventCubit(serviceLocator(), serviceLocator()));

  serviceLocator
      .registerFactory(() => FollowCubit<EventFull>(serviceLocator()));

  serviceLocator.registerLazySingleton<WikiRepository<EventFull>>(
      () => WikiRepositoryImpl<EventFull>(
            wikiRemoteDataSource: serviceLocator(),
            remoteRequestWrapper: serviceLocator(),
            remoteRequestWrapperVoid: serviceLocator(),
          ));

  serviceLocator.registerLazySingleton<WikiRemoteDataSource<EventFull>>(
      () => WikiRemoteDataSourceImpl<EventFull>(serviceLocator()));

  serviceLocator.registerLazySingleton<EventRepository>(() =>
      EventRepositoryImpl(serviceLocator(), serviceLocator(), serviceLocator(),
          serviceLocator()));

  serviceLocator.registerLazySingleton<RemoteRequestWrapper<EventFull>>(() =>
      RemoteRequestWrapperImpl<EventFull>(serviceLocator(), serviceLocator()));

  serviceLocator.registerLazySingleton<EventRemoteDataSource>(
      () => EventRemoteDataSourceImpl());

  //* Wiki ArtistFull
  serviceLocator
      .registerFactory(() => ArtistCubit(serviceLocator(), serviceLocator()));

  serviceLocator
      .registerFactory(() => FollowCubit<ArtistFull>(serviceLocator()));

  serviceLocator.registerLazySingleton<WikiRepository<ArtistFull>>(
      () => WikiRepositoryImpl<ArtistFull>(
            wikiRemoteDataSource: serviceLocator(),
            remoteRequestWrapper: serviceLocator(),
            remoteRequestWrapperVoid: serviceLocator(),
          ));

  serviceLocator.registerLazySingleton<ArtistRepository>(() =>
      ArtistRepositoryImpl(
          artistRemoteDataSource: serviceLocator(),
          remoteRequestWrapperEvents: serviceLocator(),
          remoteRequestWrapperUnities: serviceLocator()));

  serviceLocator.registerLazySingleton<WikiRemoteDataSource<ArtistFull>>(
      () => WikiRemoteDataSourceImpl<ArtistFull>(serviceLocator()));

  serviceLocator.registerLazySingleton<ArtistRemoteDataSource>(
      () => ArtistRemoteDataSourceImpl());

  serviceLocator.registerLazySingleton<RemoteRequestWrapper<ArtistFull>>(() =>
      RemoteRequestWrapperImpl<ArtistFull>(serviceLocator(), serviceLocator()));

  //* Wiki PlaceFull
  serviceLocator
      .registerFactory(() => PlaceCubit(serviceLocator(), serviceLocator()));
  serviceLocator
      .registerFactory(() => FollowCubit<PlaceFull>(serviceLocator()));

  serviceLocator.registerLazySingleton<WikiRepository<PlaceFull>>(
      () => WikiRepositoryImpl<PlaceFull>(
            wikiRemoteDataSource: serviceLocator(),
            remoteRequestWrapper: serviceLocator(),
            remoteRequestWrapperVoid: serviceLocator(),
          ));

  serviceLocator.registerLazySingleton<PlaceRepository>(() =>
      PlaceRepositoryImpl(
          placeRemoteDataSource: serviceLocator(),
          remoteRequestWrapperEvents: serviceLocator(),
          remoteRequestWrapperScenes: serviceLocator()));

  serviceLocator.registerLazySingleton<WikiRemoteDataSource<PlaceFull>>(
      () => WikiRemoteDataSourceImpl<PlaceFull>(serviceLocator()));

  serviceLocator.registerLazySingleton<PlaceRemoteDataSource>(
      () => PlaceRemoteDataSourceImpl());

  serviceLocator.registerLazySingleton<RemoteRequestWrapper<PlaceFull>>(() =>
      RemoteRequestWrapperImpl<PlaceFull>(serviceLocator(), serviceLocator()));

  serviceLocator.registerLazySingleton<RemoteRequestWrapper<List<Scene>>>(() =>
      RemoteRequestWrapperImpl<List<Scene>>(
          serviceLocator(), serviceLocator()));

  //* Wiki UnityFull
  serviceLocator
      .registerFactory(() => UnityCubit(serviceLocator(), serviceLocator()));
  serviceLocator
      .registerFactory(() => FollowCubit<UnityFull>(serviceLocator()));

  serviceLocator.registerLazySingleton<WikiRepository<UnityFull>>(
      () => WikiRepositoryImpl<UnityFull>(
            wikiRemoteDataSource: serviceLocator(),
            remoteRequestWrapper: serviceLocator(),
            remoteRequestWrapperVoid: serviceLocator(),
          ));

  serviceLocator.registerLazySingleton<UnityRepository>(() =>
      UnityRepositoryImpl(
          unityRemoteDataSource: serviceLocator(),
          remoteRequestWrapperEvents: serviceLocator(),
          remoteRequestWrapperArtists: serviceLocator()));

  serviceLocator.registerLazySingleton<WikiRemoteDataSource<UnityFull>>(
      () => WikiRemoteDataSourceImpl<UnityFull>(serviceLocator()));

  serviceLocator.registerLazySingleton<UnityRemoteDataSource>(
      () => UnityRemoteDataSourceImpl());

  serviceLocator.registerLazySingleton<RemoteRequestWrapper<UnityFull>>(() =>
      RemoteRequestWrapperImpl<UnityFull>(serviceLocator(), serviceLocator()));

  //* Features - Timetable

  serviceLocator
      .registerLazySingleton<RemoteRequestWrapper<List<TimetableForScene>>>(
          () => RemoteRequestWrapperImpl<List<TimetableForScene>>(
              serviceLocator(), serviceLocator()));

  serviceLocator
      .registerFactory(() => TimetableCubit(serviceLocator()));
}
