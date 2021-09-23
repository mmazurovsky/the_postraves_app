
import '../../../models/related_to_search/unified_search_model.dart';

import '../../../core/data/data_storage/app_database.dart';
import 'package:sembast/sembast.dart';

abstract class SearchLocalDataSource {
  Future<List<UnifiedSearchModel>> getSearchHistory();
  Future<void> saveSearchRecordToHistory(UnifiedSearchModel entity);
  Future<void> updateSearchRecordInHistory(UnifiedSearchModel entity);
  Future<void> deleteSearchRecordFromHistory(UnifiedSearchModel entity);
  Future<void> deleteAllSearchRecords();
}

class SearchLocalDataSourceImpl implements SearchLocalDataSource {
  static const String SEARCH_HISTORY_STORE = 'search_history';
  final _searchHistoryStore = intMapStoreFactory.store(SEARCH_HISTORY_STORE);

  Future<Database> get _db async => await AppDatabase.instance.database;

  @override
  Future<List<UnifiedSearchModel>> getSearchHistory() async {
    final recordsSnapshots = await _searchHistoryStore.find(
      await _db,
      finder: Finder(
        sortOrders: [SortOrder('updatedDateTime', false)],
      ),
    );
    final found = recordsSnapshots
        .map((entity) => UnifiedSearchModel.fromJson(entity.value))
        .toList();
    return found;
  }

  @override
  Future<void> saveSearchRecordToHistory(UnifiedSearchModel entity) async {
    await _searchHistoryStore
        .record(entity.id)
        .add(await _db, entity.toJson());
  }

  @override
  Future<void> deleteSearchRecordFromHistory(UnifiedSearchModel entity) async {
    final finder = Finder(filter: Filter.byKey(entity.id));
    await _searchHistoryStore.delete(
      await _db,
      finder: finder,
    );
  }

  Future<void> updateSearchRecordInHistory(UnifiedSearchModel entity) async {
    final finder = Finder(filter: Filter.byKey(entity.id));
    await _searchHistoryStore.update(
      await _db,
      entity.toJson(),
      finder: finder,
    );
  }

  @override
  Future<void> deleteAllSearchRecords() async {
    await _searchHistoryStore.delete(
      await _db,
    );
  }
}
