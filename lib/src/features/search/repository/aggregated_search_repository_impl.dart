import 'package:the_postraves_app/src/common/utils/remote_request_wrapper.dart';
import 'package:the_postraves_app/src/common/data/unified_search_model.dart';
import 'package:the_postraves_package/client/request_wrapper.dart';
import 'package:the_postraves_package/client/response_sealed.dart';
import 'package:the_postraves_package/errors/exceptions.dart';
import 'package:the_postraves_package/errors/failures.dart';
import 'package:the_postraves_package/models/interfaces/data_interfaces.dart';
import 'package:the_postraves_package/models/related_to_search/aggregated_search_model.dart';

import '../data_sources/search_local_data_source.dart';
import '../data_sources/search_remote_data_source.dart';

abstract class AggregatedSearchRepository {
  Future<ResponseSealed<AggregatedSearchModel>> searchByAllRatingModels(
      String searchValue);
  Future<ResponseSealed<List<UnifiedSearchModel>>> findPreviousSearches();
  Future<ResponseSealed<void>>
      saveOrUpdateSearchRecordInHistory<T extends GeneralFollowableInterface>(
          T entity);
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
  Future<ResponseSealed<List<UnifiedSearchModel>>>
      findPreviousSearches() async {
    try {
      List<UnifiedSearchModel> foundInCache =
          await searchLocalDataSource.getSearchHistory();
      return ResponseSealed.success(foundInCache);
    } on MyCacheException {
      return ResponseSealed.failure(CacheFailure('Cache exception on trying to find previous searches'));
    }
  }

  @override
  Future<ResponseSealed<void>>
      saveOrUpdateSearchRecordInHistory<T extends GeneralFollowableInterface>(
          T entity) async {
    // maybe better to save image dimensions, but it is possible not to do that
    final FollowableData = entity.convertToFollowableData(null);

    final entityToSaveOrUpdate = UnifiedSearchModel(
        followableData: FollowableData, updatedDateTime: DateTime.now());
    final previousSearches = await searchLocalDataSource.getSearchHistory();
    final setOfIds =
        previousSearches.map((persistedEntity) => persistedEntity.id).toSet();
    try {
      setOfIds.contains(entityToSaveOrUpdate.id)
          ? await searchLocalDataSource.updateSearchRecordInHistory(
              entityToSaveOrUpdate.copyWith(updatedDateTime: DateTime.now()))
          : searchLocalDataSource
              .saveSearchRecordToHistory(entityToSaveOrUpdate);
      return const ResponseSealed.success(null);
    } on MyCacheException {
      return ResponseSealed.failure(CacheFailure('Cache exception on trying to save or update search record in history'));
    }
  }

  @override
  Future<ResponseSealed<void>> updateTimeOfPreviousSearchRecord(
      UnifiedSearchModel entity) async {
    final updatedEntity = entity.copyWith(updatedDateTime: DateTime.now());
    try {
      await searchLocalDataSource.updateSearchRecordInHistory(updatedEntity);
      return const ResponseSealed.success(null);
    } on MyCacheException {
      return ResponseSealed.failure(CacheFailure('Cache exception on update time of search record'));
    }
  }

  @override
  Future<ResponseSealed<void>> deleteSearchRecordFromHistory(
      UnifiedSearchModel entity) async {
    try {
      return ResponseSealed.success(
          await searchLocalDataSource.deleteSearchRecordFromHistory(entity));
    } on MyCacheException {
      return ResponseSealed.failure(CacheFailure('Cache exception on trying to delete search record from history'));
    }
  }

  @override
  Future<ResponseSealed<void>> deleteAllSearchRecords() async {
    try {
      return ResponseSealed.success(
          await searchLocalDataSource.deleteAllSearchRecords());
    } on MyCacheException {
      return ResponseSealed.failure(CacheFailure('Cache exception on trying to delete all search records'));
    }
  }
}
