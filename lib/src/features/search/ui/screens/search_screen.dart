import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import '../../state/cubit/search_cubit.dart';
import '../../../../models/interfaces/data_interfaces.dart';
import '../../../../models/related_to_search/aggregated_search_model.dart';
import '../../../../models/related_to_search/unified_search_model.dart';
import '../../../../models/shorts/event_short.dart';
import '../../../../models/shorts/place_short.dart';
import '../widgets/previous_search_results_block.dart';
import '../../../../core/presentation/widgets/loading_container.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_text_styles.dart';
import '../../../../core/presentation/widgets/ending_of_screen.dart';
import '../../../../core/presentation/widgets/failure_container.dart';
import '../../../../core/presentation/widgets/search_container.dart';
import '../../../../core/presentation/widgets/my_spacers.dart';
import '../../../../core/presentation/widgets/section_title.dart';
import '../widgets/new_search_results_block.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController? _textEditingController;
  FocusNode? _searchTabFocusNode;
  Timer? _searchFieldTimer;
  String? _previousSearchValue;
  late bool _toTriggerPreviousSearchesEvent;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _toTriggerPreviousSearchesEvent = false;
    _textEditingController?.addListener(_textEditingControllerListener);
    _searchTabFocusNode = FocusNode();
    BlocProvider.of<SearchCubit>(context).showPreviousSearches();
    Future.delayed(const Duration(milliseconds: 200),
        () => _searchTabFocusNode!.requestFocus());
  }

  void _textEditingControllerListener() {
    if (_searchFieldTimer != null) {
      _searchFieldTimer!.cancel();
    }
    if (_textEditingController!.text.length > 1) {
      _toTriggerPreviousSearchesEvent = true;
      if (_textEditingController!.text != _previousSearchValue) {
        _searchFieldTimer = Timer(const Duration(milliseconds: 1000), () {
          _previousSearchValue = _textEditingController!.text;
          BlocProvider.of<SearchCubit>(context)
              .startSearch(_textEditingController!.text);
        });
      }
    } else {
      if (_toTriggerPreviousSearchesEvent) {
        _onClearSearch();
      }
    }
  }

  void _onClearSearch() {
    _toTriggerPreviousSearchesEvent = false;
    _previousSearchValue = null;
    BlocProvider.of<SearchCubit>(context).showPreviousSearches();
  }

  void _onCancelSearch() {
    _textEditingController!.clear();
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _textEditingController?.dispose();
    _searchTabFocusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.screenBackground,
      body: SafeArea(
        child: CustomScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: _SearchBar(
                textEditingController: _textEditingController!,
                onCancelSearch: _onCancelSearch,
                focusNode: _searchTabFocusNode!,
              ),
            ),
            SliverToBoxAdapter(
              child: BlocBuilder<SearchCubit, SearchState>(
                buildWhen: (prevState, currState) =>
                    currState is! InitialSearch,
                builder: (context, state) {
                  if (state is LoadedPreviousSearches) {
                    return _PreviousSearchesList(
                      previousSearchRecords: state.found,
                    );
                  } else if (state is LoadingPreviousSearches ||
                      state is LoadingNewSearch) {
                    return LoadingContainer();
                  } else if (state is LoadedNewSearch) {
                    return _SearchResultsList(
                      found: state.found,
                    );
                  } else {
                    return FailureContainer("chto"); //TODO:
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PreviousSearchesList extends StatelessWidget {
  final List<UnifiedSearchModel>? previousSearchRecords;
  const _PreviousSearchesList({Key? key, required this.previousSearchRecords})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return previousSearchRecords == null || previousSearchRecords!.isEmpty
        ? Column(
            children: [
              MyBigSpacer(),
              SectionTitle(
                  sectionTitle:
                      AppLocalizations.of(context)!.searchHistoryIsEmpty)
            ],
          )
        : PreviousSearchResultsBlock(
            resultsName: AppLocalizations.of(context)!.searchHistory,
            results: previousSearchRecords!,
            deleteFunction: (UnifiedSearchModel entity) =>
                BlocProvider.of<SearchCubit>(context)
                    .removeSearchRecord(entity),
          );
  }
}

class _SearchResultsList extends StatelessWidget {
  final AggregatedSearchModel found;
  const _SearchResultsList({Key? key, required this.found}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        found.foundArtists.isNotEmpty
            ? _SearchResultsResolver(
                listName: found.foundArtists.first
                    .getEntityNamePluralFormString(context),
                entities: found.foundArtists,
              )
            : Container(),
        found.foundUnities.isNotEmpty
            ? _SearchResultsResolver(
                listName: found.foundUnities.first
                    .getEntityNamePluralFormString(context),
                entities: found.foundUnities,
              )
            : Container(),
        found.foundPlaces.isNotEmpty
            ? _SearchResultsResolver<PlaceShort>(
                listName: found.foundPlaces.first
                    .getEntityNamePluralFormString(context),
                entities: found.foundPlaces,
              )
            : Container(),
        found.foundEvents.isNotEmpty
            ? _SearchResultsResolver<EventShort>(
                listName: found.foundEvents.first
                    .getEntityNamePluralFormString(context),
                entities: found.foundEvents,
              )
            : Container(),
        found.foundArtists.isEmpty &&
                found.foundUnities.isEmpty &&
                found.foundPlaces.isEmpty &&
                found.foundEvents.isEmpty
            ? Column(
                children: [
                  MyBigSpacer(),
                  SectionTitle(
                      sectionTitle:
                          AppLocalizations.of(context)!.searchNotFound),
                ],
              )
            : Container(),
        EndingOfScreen(),
      ],
    );
  }
}

class _SearchResultsResolver<T extends GeneralFollowableInterface>
    extends StatelessWidget {
  final String listName;
  final List<T> entities;
  const _SearchResultsResolver({
    Key? key,
    required this.listName,
    required this.entities,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return entities.isEmpty
        ? Container()
        : NewSearchResultsBlock<T>(
            resultsName: listName,
            results: entities,
          );
  }
}

class _SearchBar extends SliverPersistentHeaderDelegate {
  final TextEditingController textEditingController;
  final Function onCancelSearch;
  final FocusNode focusNode;
  const _SearchBar({
    required this.textEditingController,
    required this.focusNode,
    required this.onCancelSearch,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return BlocBuilder<SearchCubit, SearchState>(
      buildWhen: (prevState, currState) => currState is! InitialSearch,
      builder: (context, state) {
        return Container(
          color: MyColors.screenBackground,
          child: Row(
            children: [
              Expanded(
                child: SearchContainer(
                  containerColor: MyColors.forSearchContainer,
                  rightContainerPart: TextField(
                    cursorColor: MyColors.main,
                    focusNode: focusNode,
                    controller: textEditingController,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: AppLocalizations.of(context)!.searchTitle,
                      hintStyle: MyTextStyles.searchTextPlaceholder,
                    ),
                    style: MyTextStyles.searchValue,
                  ),
                  leftContainerPart: Row(
                    children: [
                      SizedBox(width: 10),
                      Visibility(
                        visible: state is LoadingNewSearch ||
                                state is LoadedNewSearch
                            ? true
                            : false,
                        child: InkWell(
                          onTap: () => textEditingController.clear(),
                          child: Icon(
                            Ionicons.close,
                            size: 22,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: true,
                child: Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: () => onCancelSearch(),
                    child: Text(
                      AppLocalizations.of(context)!.cancel,
                      style: MyTextStyles.searchCancel,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  double get maxExtent => 56;

  @override
  double get minExtent => 56;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
