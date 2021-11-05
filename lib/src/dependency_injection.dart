import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:the_postraves_app/src/common/utils/localized_get_request.dart';
import 'package:the_postraves_package/client/followable_client_helper.dart';
import 'package:the_postraves_package/client/localized_request.dart';
import 'package:the_postraves_package/client/remote_request.dart';
import 'package:the_postraves_package/client/request_wrapper.dart';
import 'package:the_postraves_package/followable/data_sources/artist_remote_data_source.dart';
import 'package:the_postraves_package/followable/data_sources/event_remote_data_source.dart';
import 'package:the_postraves_package/followable/data_sources/place_remote_data_source.dart';
import 'package:the_postraves_package/followable/data_sources/unity_remote_data_source.dart';
import 'package:the_postraves_package/followable/data_sources/wiki_remote_data_source.dart';
import 'package:the_postraves_package/followable/repository/artist_repository.dart';
import 'package:the_postraves_package/followable/repository/event_repository.dart';
import 'package:the_postraves_package/followable/repository/place_repository.dart';
import 'package:the_postraves_package/followable/repository/unity_repository.dart';
import 'package:the_postraves_package/followable/repository/wiki_repository.dart';
import 'package:the_postraves_package/models/fulls/artist_full.dart';
import 'package:the_postraves_package/models/fulls/event_full.dart';
import 'package:the_postraves_package/models/fulls/place_full.dart';
import 'package:the_postraves_package/models/fulls/unity_full.dart';
import 'package:the_postraves_package/models/geo/city.dart';
import 'package:the_postraves_package/models/geo/country.dart';
import 'package:the_postraves_package/models/related_to_event/shows_by_date.dart';
import 'package:the_postraves_package/models/related_to_event/timetable_for_scene.dart';
import 'package:the_postraves_package/models/related_to_place/scene.dart';
import 'package:the_postraves_package/models/related_to_search/aggregated_search_model.dart';
import 'package:the_postraves_package/models/shorts/artist_short.dart';
import 'package:the_postraves_package/models/shorts/event_short.dart';
import 'package:the_postraves_package/models/shorts/place_short.dart';
import 'package:the_postraves_package/models/shorts/unity_short.dart';
import 'package:the_postraves_package/models/user/user_profile.dart';
import 'common/authentication/repository/firebase_auth_repository.dart';
import 'common/authentication/state/cubit/authentication_cubit.dart';
import 'common/configs/dynamic_link_configurer.dart';
import 'common/geo_repository/city_repository.dart';
import 'common/geo_repository/country_repository.dart';
import 'common/local_data_sources/city_local_data_source.dart';
import 'common/local_data_sources/city_remote_data_source.dart';
import 'common/local_data_sources/country_local_data_source.dart';
import 'common/local_data_sources/country_remote_data_source.dart';
import 'common/utils/network_info.dart';
import 'common/utils/remote_request_wrapper.dart';
import 'features/chart/data_sources/charts_remote_data_source.dart';
import 'features/chart/repository/charts_repository.dart';
import 'features/chart/state/cubit/charts_cubit.dart';
import 'features/followable/state/artist_cubit/artist_cubit.dart';
import 'features/followable/state/event_cubit/event_cubit.dart';
import 'features/followable/state/follow_cubit/follow_cubit.dart';
import 'features/followable/state/place_cubit/place_cubit.dart';
import 'features/followable/state/unity_cubit/unity_cubit.dart';
import 'features/profile/data_sources/user_following_data_source.dart';
import 'features/profile/data_sources/user_profile_data_source.dart';
import 'features/profile/repository/firebase_image_repository_impl.dart';
import 'features/profile/repository/user_following_repository.dart';
import 'features/profile/repository/user_profile_repository.dart';
import 'features/profile/state/following_cubit/following_cubit.dart';
import 'features/profile/state/profile_cubit/profile_cubit.dart';
import 'features/search/data_sources/search_local_data_source.dart';
import 'features/search/data_sources/search_remote_data_source.dart';
import 'features/search/repository/aggregated_search_repository_impl.dart';
import 'features/search/state/cubit/search_cubit.dart';
import 'features/shows/data_sources/shows_remote_data_source.dart';
import 'features/shows/repository/shows_repository_impl.dart';
import 'features/shows/state/shows_cubit/shows_cubit.dart';
import 'features/shows/state/view_switcher_cubit/view_switcher_cubit_cubit.dart';
import 'features/timetable/timetable_cubit/timetable_cubit.dart';

final serviceLocator = GetIt.instance;

void setupServiceLocatorInjection() async {
  // Services

  serviceLocator.registerLazySingleton<DynamicLinkService>(
    () => DynamicLinkService(),
  );

  serviceLocator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      InternetConnectionChecker(),
    ),
  );

  // Firebase

  serviceLocator
      .registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  serviceLocator
      .registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance);

  serviceLocator.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);

  serviceLocator.registerLazySingleton<FirebaseMessaging>(
      () => FirebaseMessaging.instance);

  // Request

  serviceLocator.registerLazySingleton<LocalizedGetRequest>(
    () => LocalizedGetRequestImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<RemoteRequest>(
    () => RemoteRequestImpl(),
  );

  serviceLocator.registerLazySingleton<FollowableClientHelper<ArtistShort>>(
    () => ArtistShortClientHelper(),
  );
  serviceLocator.registerLazySingleton<FollowableClientHelper<ArtistFull>>(
    () => ArtistFullClientHelper(),
  );
  serviceLocator.registerLazySingleton<FollowableClientHelper<UnityShort>>(
    () => UnityShortClientHelper(),
  );
  serviceLocator.registerLazySingleton<FollowableClientHelper<UnityFull>>(
    () => UnityFullClientHelper(),
  );
  serviceLocator.registerLazySingleton<FollowableClientHelper<PlaceShort>>(
    () => PlaceShortClientHelper(),
  );
  serviceLocator.registerLazySingleton<FollowableClientHelper<PlaceFull>>(
    () => PlaceFullClientHelper(),
  );
  serviceLocator.registerLazySingleton<FollowableClientHelper<EventFull>>(
    () => EventFullClientHelper(),
  );
  serviceLocator.registerLazySingleton<FollowableClientHelper<EventShort>>(
    () => EventShortClientHelper(),
  );

  // Request Wrapper

  serviceLocator.registerLazySingleton<RemoteRequestWrapper<List<City>>>(
    () => RemoteRequestWrapperImpl<List<City>>(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<RemoteRequestWrapper<List<Country>>>(
    () => RemoteRequestWrapperImpl<List<Country>>(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<RemoteRequestWrapper<List<ShowsByDate>>>(
    () => RemoteRequestWrapperImpl<List<ShowsByDate>>(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<RemoteRequestWrapper<List<EventFull>>>(
    () => RemoteRequestWrapperImpl<List<EventFull>>(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<RemoteRequestWrapper<List<ArtistShort>>>(
    () => RemoteRequestWrapperImpl<List<ArtistShort>>(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<RemoteRequestWrapper<List<UnityShort>>>(
    () => RemoteRequestWrapperImpl<List<UnityShort>>(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<RemoteRequestWrapper<List<PlaceShort>>>(
    () => RemoteRequestWrapperImpl<List<PlaceShort>>(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<RemoteRequestWrapper<bool>>(
    () => RemoteRequestWrapperImpl<bool>(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<RemoteRequestWrapper<UserProfile?>>(
    () => RemoteRequestWrapperImpl<UserProfile?>(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<RemoteRequestWrapper<List<EventShort>>>(
    () => RemoteRequestWrapperImpl<List<EventShort>>(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator
      .registerLazySingleton<RemoteRequestWrapper<AggregatedSearchModel>>(
    () => RemoteRequestWrapperImpl<AggregatedSearchModel>(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<RemoteRequestWrapper<ArtistShort>>(
    () => RemoteRequestWrapperImpl<ArtistShort>(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<RemoteRequestWrapper<ArtistShort?>>(
    () => RemoteRequestWrapperImpl<ArtistShort?>(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<RemoteRequestWrapper<void>>(
    () => RemoteRequestWrapperImpl<void>(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<RemoteRequestWrapper<EventFull>>(
    () => RemoteRequestWrapperImpl<EventFull>(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<RemoteRequestWrapper<ArtistFull>>(
    () => RemoteRequestWrapperImpl<ArtistFull>(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<RemoteRequestWrapper<PlaceFull>>(
    () => RemoteRequestWrapperImpl<PlaceFull>(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<RemoteRequestWrapper<List<Scene>>>(
    () => RemoteRequestWrapperImpl<List<Scene>>(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<RemoteRequestWrapper<UnityFull>>(
    () => RemoteRequestWrapperImpl<UnityFull>(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator
      .registerLazySingleton<RemoteRequestWrapper<List<TimetableForScene>>>(
    () => RemoteRequestWrapperImpl<List<TimetableForScene>>(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  // Local Data Source

  serviceLocator.registerLazySingleton<SearchLocalDataSource>(
    () => SearchLocalDataSourceImpl(),
  );

  serviceLocator.registerLazySingleton<CityLocalDataSource>(
    () => CityLocalDataSourceImpl(),
  );

  serviceLocator.registerLazySingleton<CountryLocalDataSource>(
    () => CountryLocalDataSourceImpl(),
  );

  // Remote Data Source

  serviceLocator.registerLazySingleton<CityRemoteDataSource>(
    () => CityRemoteDataSourceImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<CountryRemoteDataSource>(
    () => CountryRemoteDataSourceImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<UserProfileDataSource>(
    () => UserProfileDataSourceImpl(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<ShowsRemoteDataSource>(
    () => ShowsRemoteDataSourceImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<SearchRemoteDataSource>(
    () => SearchRemoteDataSourceImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<ChartsRemoteDataSource<ArtistShort>>(
    () => ChartsRemoteDataSourceImpl<ArtistShort>(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<WikiRemoteDataSource<EventFull>>(
    () => WikiRemoteDataSourceImpl<EventFull>(
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<EventRemoteDataSource>(
    () => EventRemoteDataSourceImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<UserFollowingDataSource<EventShort>>(
    () => UserFollowingDataSourceImpl<EventShort>(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<UserFollowingDataSource<ArtistShort>>(
    () => UserFollowingDataSourceImpl<ArtistShort>(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<UserFollowingDataSource<PlaceShort>>(
    () => UserFollowingDataSourceImpl<PlaceShort>(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<UserFollowingDataSource<UnityShort>>(
    () => UserFollowingDataSourceImpl<UnityShort>(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<WikiRemoteDataSource<ArtistFull>>(
    () => WikiRemoteDataSourceImpl<ArtistFull>(
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<ArtistRemoteDataSource>(
    () => ArtistRemoteDataSourceImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<WikiRemoteDataSource<PlaceFull>>(
    () => WikiRemoteDataSourceImpl<PlaceFull>(
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<PlaceRemoteDataSource>(
    () => PlaceRemoteDataSourceImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<WikiRemoteDataSource<UnityFull>>(
    () => WikiRemoteDataSourceImpl<UnityFull>(
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<UnityRemoteDataSource>(
    () => UnityRemoteDataSourceImpl(
      serviceLocator(),
    ),
  );

  // Repository

  serviceLocator.registerLazySingleton<CityRepository>(
    () => CityRepositoryImpl(
      cityRemoteDataSource: serviceLocator(),
      cityLocalDataSource: serviceLocator(),
      remoteRequestWrapperListCity: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<CountryRepository>(
    () => CountryRepositoryImpl(
      countryRemoteDataSource: serviceLocator(),
      countryLocalDataSource: serviceLocator(),
      remoteRequestWrapperListCountry: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<FirebaseAuthRepository>(
    () => FirebaseAuthRepositioryImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<UserProfileRepository>(
    () => UserProfileRepositoryImpl(
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<FirebaseImageRepository>(
    () => FirebaseImageRepositoryImpl(),
  );

  serviceLocator.registerLazySingleton<UserFollowingRepository<EventShort>>(
    () => UserFollowingRepositoryImpl<EventShort>(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<UserFollowingRepository<ArtistShort>>(
    () => UserFollowingRepositoryImpl<ArtistShort>(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<UserFollowingRepository<PlaceShort>>(
    () => UserFollowingRepositoryImpl<PlaceShort>(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<UserFollowingRepository<UnityShort>>(
    () => UserFollowingRepositoryImpl<UnityShort>(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<ShowsRepository>(
    () => ShowsRepositoryImpl(
      showsRemoteDataSource: serviceLocator(),
      remoteRequestWrapperByDate: serviceLocator(),
      remoteRequestWrapperByRating: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<AggregatedSearchRepository>(
    () => AggregatedSearchRepositoryImpl(
      searchLocalDataSource: serviceLocator(),
      searchRemoteDataSource: serviceLocator(),
      remoteRequestWrapper: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<ChartsRepository<ArtistShort>>(
    () => ChartsRepositoryImpl<ArtistShort>(
      chartsRemoteDataSource: serviceLocator(),
      remoteRequestWrapperForList: serviceLocator(),
      remoteRequestWrapperForSingle: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<FollowableRepository<EventFull>>(
    () => FollowableRepositoryImpl<EventFull>(
      wikiRemoteDataSource: serviceLocator(),
      remoteRequestWrapper: serviceLocator(),
      remoteRequestWrapperVoid: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<EventRepository>(
    () => EventRepositoryImpl(
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<FollowableRepository<ArtistFull>>(
    () => FollowableRepositoryImpl<ArtistFull>(
      wikiRemoteDataSource: serviceLocator(),
      remoteRequestWrapper: serviceLocator(),
      remoteRequestWrapperVoid: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<ArtistRepository>(
    () => ArtistRepositoryImpl(
      artistRemoteDataSource: serviceLocator(),
      remoteRequestWrapperEvents: serviceLocator(),
      remoteRequestWrapperUnities: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<FollowableRepository<PlaceFull>>(
    () => FollowableRepositoryImpl<PlaceFull>(
      wikiRemoteDataSource: serviceLocator(),
      remoteRequestWrapper: serviceLocator(),
      remoteRequestWrapperVoid: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<PlaceRepository>(
    () => PlaceRepositoryImpl(
      placeRemoteDataSource: serviceLocator(),
      remoteRequestWrapperEvents: serviceLocator(),
      remoteRequestWrapperScenes: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<FollowableRepository<UnityFull>>(
    () => FollowableRepositoryImpl<UnityFull>(
      wikiRemoteDataSource: serviceLocator(),
      remoteRequestWrapper: serviceLocator(),
      remoteRequestWrapperVoid: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<UnityRepository>(
    () => UnityRepositoryImpl(
      unityRemoteDataSource: serviceLocator(),
      remoteRequestWrapperEvents: serviceLocator(),
      remoteRequestWrapperArtists: serviceLocator(),
    ),
  );

  // State

  serviceLocator.registerLazySingleton<AuthenticationCubit>(
    () => AuthenticationCubit(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => ProfileCubit(
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => FollowingCubit(
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => ShowsCubit(
      showsRepository: serviceLocator(),
      viewSwitcherBloc: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => ViewSwitcherCubit(),
  );

  serviceLocator.registerLazySingleton(
    () => SearchCubit(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => ChartsCubit(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => EventCubit(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => FollowCubit<EventFull>(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => ArtistCubit(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => FollowCubit<ArtistFull>(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => PlaceCubit(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => FollowCubit<PlaceFull>(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => TimetableCubit(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => UnityCubit(
      serviceLocator(),
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => FollowCubit<UnityFull>(
      serviceLocator(),
    ),
  );
}
