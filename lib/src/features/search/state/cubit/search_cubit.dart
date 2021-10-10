import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/client/data_sealed/response_sealed.dart';
import '../../repository/aggregated_search_repository_impl.dart';
import '../../../../models/interfaces/data_interfaces.dart';
import '../../../../models/related_to_search/aggregated_search_model.dart';
import '../../../../models/related_to_search/unified_search_model.dart';

part 'search_state.dart';
part 'search_cubit.freezed.dart';

class SearchCubit extends Cubit<SearchState> {
  final AggregatedSearchRepository _aggregatedSearchRepository;
  SearchCubit(this._aggregatedSearchRepository) : super(const SearchState.initial());

  void showPreviousSearches() {
    emit(const SearchState.loadingPreviousSearches());
    _triggerShowingPreviousSearches();
  }

  void startSearch(String searchValue) async {
    emit(const SearchState.loadingNewSearch());
    final searchResults =
        await _aggregatedSearchRepository.searchByAllRatingModels(searchValue);
    searchResults.when(
        success: (data) {
          final searchResults = data as AggregatedSearchModel;
          emit(SearchState.loadedNewSearch(searchResults));
        },
        failure: (failure, failureMessage) {}); //todo
  }

  void saveSearchRecord<T extends GeneralFollowableInterface>(
      T followableToSave) async {
    await _aggregatedSearchRepository
        .saveOrUpdateSearchRecordInHistory(followableToSave);
  }

  void updateSearchRecord(UnifiedSearchModel unifiedToUpdate) async {
    await _aggregatedSearchRepository
        .updateTimeOfPreviousSearchRecord(unifiedToUpdate);
    _triggerShowingPreviousSearches();
  }

  void removeSearchRecord(UnifiedSearchModel unifiedToRemove) async {
    final removeResult = await _aggregatedSearchRepository
        .deleteSearchRecordFromHistory(unifiedToRemove);
    removeResult.maybeWhen(
        failure: (failure, failureMessage) {}, //todo
        orElse: () {});
    _triggerShowingPreviousSearches();
  }

  void removeAllSearchRecords() async {
    await _aggregatedSearchRepository.deleteAllSearchRecords();
    _triggerShowingPreviousSearches();
  }

  void _triggerShowingPreviousSearches() async {
    ResponseSealed<List<UnifiedSearchModel>> searchHistoryRecords =
        await _aggregatedSearchRepository.findPreviousSearches();

    searchHistoryRecords.when(
        success: (data) {
          final previousSearches = data as List<UnifiedSearchModel>?;
          emit(SearchState.loadedPreviousSearches(previousSearches));
        },
        failure: (failure, failureMessage) {}); //todo
  }
}
