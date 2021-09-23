part of 'search_cubit.dart';

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState.initial() = InitialSearch;
  const factory SearchState.loadingPreviousSearches() = LoadingPreviousSearches;
  const factory SearchState.loadedPreviousSearches(List<UnifiedSearchModel>? found) =
      LoadedPreviousSearches;
  const factory SearchState.loadingNewSearch() = LoadingNewSearch;
  const factory SearchState.loadedNewSearch(AggregatedSearchModel found) =
      LoadedNewSearch;
  const factory SearchState.failure() = FailureSearch;
}
