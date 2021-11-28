import 'dart:async';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ionicons/ionicons.dart';
import 'package:the_postraves_app/src/common/utils/followable_type_utils.dart';
import 'package:the_postraves_app/src/common/data/unified_search_model.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import 'package:the_postraves_package/models/interfaces/data_interfaces.dart';
import 'package:the_postraves_package/models/related_to_search/aggregated_search_model.dart';
import '../../../../common/constants/my_text_styles.dart';
import '../../../../common/widgets/other/loading_container.dart';
import '../../../../common/widgets/other/search_container.dart';
import '../../../../common/widgets/other/section_title.dart';
import '../../../../common/widgets/spacers/ending_of_screen.dart';
import '../../../../common/widgets/spacers/my_spacers.dart';
import '../../state/cubit/search_cubit.dart';
import '../widgets/new_search_results_block.dart';
import '../widgets/previous_search_results_block.dart';

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
    _searchFieldTimer?.cancel();
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
                    return LoadingContainer(); //TODO Exception:
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
              const MyBigSpacer(),
              SectionTitle(sectionTitle: 'searchHistoryIsEmpty'.tr())
            ],
          )
        : PreviousSearchResultsBlock(
            resultsName: 'searchHistory'.tr(),
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
                listName: FollowableTypeUtils.getTranslationPluralForType(
                    found.foundArtists.first.type),
                entities: found.foundArtists,
              )
            : Container(),
        found.foundUnities.isNotEmpty
            ? _SearchResultsResolver(
                listName: FollowableTypeUtils.getTranslationPluralForType(
                    found.foundUnities.first.type),
                entities: found.foundUnities,
              )
            : Container(),
        found.foundPlaces.isNotEmpty
            ? _SearchResultsResolver(
                listName: FollowableTypeUtils.getTranslationPluralForType(
                    found.foundPlaces.first.type),
                entities: found.foundPlaces,
              )
            : Container(),
        found.foundEvents.isNotEmpty
            ? _SearchResultsResolver(
                listName: FollowableTypeUtils.getTranslationPluralForType(
                    found.foundEvents.first.type),
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
                  SectionTitle(sectionTitle: 'searchNotFound'.tr()),
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
                      hintText: 'searchTitle'.tr(),
                      hintStyle: MyTextStyles.searchTextPlaceholder,
                    ),
                    style: MyTextStyles.searchValue,
                  ),
                  leftContainerPart: Row(
                    children: [
                      const SizedBox(width: 10),
                      Visibility(
                        visible: state is LoadingNewSearch ||
                                state is LoadedNewSearch
                            ? true
                            : false,
                        child: InkWell(
                          onTap: () => textEditingController.clear(),
                          child: const Icon(
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
                      'cancel'.tr(),
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
