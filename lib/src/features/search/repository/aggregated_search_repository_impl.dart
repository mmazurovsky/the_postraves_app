import '../../../core/client/data_sealed/response_sealed.dart';
import '../../../models/interfaces/data_interfaces.dart';
import '../../../models/related_to_search/aggregated_search_model.dart';
import '../../../models/related_to_search/unified_search_model.dart';
import '../../../models/shorts/artist_short.dart';
import '../../../models/shorts/event_short.dart';
import '../../../models/shorts/place_short.dart';
import '../../../models/shorts/unity_short.dart';
import '../../../core/client/remote_request_wrapper.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../data_sources/search_local_data_source.dart';
import '../data_sources/search_remote_data_source.dart';

abstract class AggregatedSearchRepository {
  Future<ResponseSealed<AggregatedSearchModel>> searchByAllRatingModels(
      String searchValue);
  Future<ResponseSealed<List<UnifiedSearchModel>>> findPreviousSearches();
  Future<ResponseSealed<void>>
      saveOrUpdateSearchRecordInHistory<T extends FollowableInterface>(T entity);
  Future<ResponseSealed<void>> updateTimeOfPreviousSearchRecord(
      UnifiedSearchModel entity);
  Future<ResponseSealed<void>> deleteSearchRecordFromHistory(
      UnifiedSearchModel entity);
  Future<ResponseSealed<void>> deleteAllSearchRecords();
}

class AggregatedSearchRepositoryImpl implements AggregatedSearchRepository {
  final SearchLocalDataSource searchLocalDataSource;
  final SearchRemoteDataSource searchRemoteDataSource;
  final RemoteRequestWrapper<AggregatedSearchModel> remoteRequestWrapper;

  AggregatedSearchRepositoryImpl({
    required this.searchLocalDataSource,
    required this.searchRemoteDataSource,
    required this.remoteRequestWrapper,
  });

  @override
  Future<ResponseSealed<AggregatedSearchModel>> searchByAllRatingModels(
      String searchValue) async {
    return await remoteRequestWrapper((httpHeaders) =>
        searchRemoteDataSource.searchByAllFollowables(
            searchValue: searchValue, httpHeaders: httpHeaders));
  }

  @override
  Future<ResponseSealed<List<UnifiedSearchModel>>> findPreviousSearches() async {
    try {
      List<UnifiedSearchModel> foundInCache =
          await searchLocalDataSource.getSearchHistory();
      return ResponseSealed.success(foundInCache);
    } on CacheException {
      return ResponseSealed.failure(CacheFailure());
    }
  }

  @override
  Future<ResponseSealed<void>>
      saveOrUpdateSearchRecordInHistory<T extends FollowableInterface>(
          T entity) async {
    UnifiedSearchModel entityToSaveOrUpdate;
    if (entity is ArtistShort) {
      entityToSaveOrUpdate =
          UnifiedSearchModel.fromShortArtist(entity, DateTime.now());
    } else if (entity is UnityShort) {
      entityToSaveOrUpdate =
          UnifiedSearchModel.fromShortUnity(entity, DateTime.now());
    } else if (entity is PlaceShort) {
      entityToSaveOrUpdate =
          UnifiedSearchModel.fromShortPlace(entity, DateTime.now());
    } else {
      entityToSaveOrUpdate =
          UnifiedSearchModel.fromShortEvent(entity as EventShort, DateTime.now());
    }
    final previousSearches = await searchLocalDataSource.getSearchHistory();
    final setOfIds =
        previousSearches.map((persistedEntity) => persistedEntity.id).toSet();
    try {
      setOfIds.contains(entityToSaveOrUpdate.id) 
      ? await searchLocalDataSource.updateSearchRecordInHistory(entityToSaveOrUpdate.copyWith(updatedDateTime: DateTime.now())) 
      : searchLocalDataSource.saveSearchRecordToHistory(entityToSaveOrUpdate);
      return ResponseSealed.success(null);
    } on CacheException {
      return ResponseSealed.failure(CacheFailure());
    }
  }

  @override
  Future<ResponseSealed<void>> updateTimeOfPreviousSearchRecord(
      UnifiedSearchModel entity) async {
    final updatedEntity = entity.copyWith(updatedDateTime: DateTime.now());
    try {
      await searchLocalDataSource.updateSearchRecordInHistory(updatedEntity);
      return ResponseSealed.success(null);
    } on CacheException {
      return ResponseSealed.failure(CacheFailure());
    }
  }

  @override
  Future<ResponseSealed<void>> deleteSearchRecordFromHistory(
      UnifiedSearchModel entity) async {
    try {
      return ResponseSealed.success(
          await searchLocalDataSource.deleteSearchRecordFromHistory(entity));
    } on CacheException {
      return ResponseSealed.failure(CacheFailure());
    }
  }

  @override
  Future<ResponseSealed<void>> deleteAllSearchRecords() async {
    try {
      return ResponseSealed.success(await searchLocalDataSource.deleteAllSearchRecords());
    } on CacheException {
      return ResponseSealed.failure(CacheFailure());
    }
  }
}
