import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/my_spacers.dart';
import 'package:the_postraves_app/src/features/chart/data/chart_type.dart';

import '../../../../core/navigation_bar/bottom_navigation_tab_item.dart';
import '../../../../core/presentation/widgets/failure_container.dart';
import '../../../../core/presentation/widgets/loading_container.dart';
import '../../../../core/presentation/widgets/my_horizontal_margin.dart';
import '../../../../core/presentation/widgets/search_container.dart';
import '../../../../core/provider/current_city_provider.dart';
import '../../../../core/utils/my_assets.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_text_styles.dart';
import '../../../../models/geo/city.dart';
import '../../../../models/interfaces/data_interfaces.dart';
import '../../../../models/shorts/artist_short.dart';
import '../../../../my_navigation.dart';
import '../../state/cubit/charts_cubit.dart';
import '../widgets/rating_card_with_list_of_items.dart';
import '../widgets/rating_weekly_winner_card.dart';

class ChartsScreen extends StatefulWidget {
  const ChartsScreen({Key? key}) : super(key: key);

  @override
  _ChartsScreenState createState() => _ChartsScreenState();
}

class _ChartsScreenState extends State<ChartsScreen>
    with TickerProviderStateMixin {
  late final RefreshController _refreshController;
  City? _currentCity;

  void _onRefresh() {
    BlocProvider.of<ChartsCubit>(context).refreshCharts(_currentCity!);
  }

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_currentCity != context.watch<CurrentCityProvider>().currentCity) {
      _currentCity = context
          .read<CurrentCityProvider>()
          .currentCity!; //todo check it is ok to ! here
      BlocProvider.of<ChartsCubit>(context).showCharts(_currentCity!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
        controller: TabItem.search.tabScrollController,
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, value) {
          return [
            SliverPersistentHeader(
              floating: true,
              delegate: _InactiveSearchBar(),
            ),
          ];
        },
        body: BlocConsumer<ChartsCubit, ChartsState>(
          listener: (context, state) {
            if (state is ChartsStateLoaded) {
              _refreshController.refreshCompleted();
            }
          },
          buildWhen: (previousState, currentState) {
            return currentState is ChartsStateRefreshing ? false : true;
          },
          builder: (context, state) {
            return state.maybeWhen(
              loaded: (bestArtist, weeklyChart, overallChart) => _Charts(
                bestArtist: bestArtist,
                weeklyChart: weeklyChart,
                overallChart: overallChart,
                refreshController: _refreshController,
                onRefresh: _onRefresh,
              ),
              error: (errorMessage) => FailureContainer(errorMessage),
              orElse: () => const LoadingContainer(),
            );
          },
        ),
      ),
    );
  }
}

class _Charts extends StatelessWidget {
  final ArtistShort? bestArtist;
  final List<ArtistShort>? weeklyChart;
  final List<ArtistShort>? overallChart;
  final RefreshController refreshController;
  final void Function() onRefresh;

  const _Charts({
    Key? key,
    required this.bestArtist,
    required this.weeklyChart,
    required this.overallChart,
    required this.refreshController,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      controller: refreshController,
      onRefresh: () => onRefresh(),
      child: CustomScrollView(
        slivers: [
          _ChartsViewForEntity(
            sectionTitle: AppLocalizations.of(context)!.featuredTitle,
            previousWeekWinner: bestArtist,
            weeklyChart: weeklyChart,
            overallChart: overallChart,
          ),
        ],
      ),
    );
  }
}

class _ChartsViewForEntity<T extends GeneralFollowableInterface>
    extends StatelessWidget {
  final String sectionTitle;
  final T? previousWeekWinner;
  final List<T>? weeklyChart;
  final List<T>? overallChart;

  const _ChartsViewForEntity({
    Key? key,
    required this.sectionTitle,
    required this.previousWeekWinner,
    required this.weeklyChart,
    required this.overallChart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const MyMediumSpacer(),
          MyHorizontalMargin(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                sectionTitle,
                style: MyTextStyles.ratingsTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          previousWeekWinner != null
              ? RatingWeeklyWinnerCard<T>(
                  entity: previousWeekWinner!,
                  nominationDescription:
                      AppLocalizations.of(context)!.featuredUsersChoice,
                  nomination:
                      '${previousWeekWinner!.getEntityNameSingularFormString(context)}\n${AppLocalizations.of(context)!.ofTheWeek}'
                          .toUpperCase(),
                )
              : Container(),
          weeklyChart != null
              ? RatingCardWithListOfItems<T>(
                  showWeeklyFollowers: true,
                  imagePath: MyEmoji.fire,
                  titleTextSpans: [
                    TextSpan(
                        text: AppLocalizations.of(context)!.chartOfTheWeekTitle.toUpperCase(),
                        style: MyTextStyles.chartTitle),
                  ],
                  topFollowables: weeklyChart!.take(5).toList(),
                  onTapDetails: () => NavigatorFunctions.pushExtendedChart(
                    context,
                    ChartType.weekly,
                    weeklyChart!,
                  ),
                )
              : Container(),
          overallChart != null
              ? RatingCardWithListOfItems<T>(
                  imagePath: MyEmoji.dizzy,
                  titleTextSpans: [
                    TextSpan(
                        text: AppLocalizations.of(context)!.chartOverallTitle.toUpperCase(),
                        style: MyTextStyles.chartTitle),
                  ],
                  topFollowables: overallChart!.take(5).toList(),
                  onTapDetails: () => NavigatorFunctions.pushExtendedChart(
                    context,
                    ChartType.overall,
                    overallChart!,
                  ),
                )
              : Container(),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class _InactiveSearchBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: MyColors.screenBackground,
      child: InkWell(
        onTap: () => Navigator.of(context).pushNamed(MyNavigationRoutes.search),
        child: SearchContainer(
          containerColor: Colors.grey.withOpacity(0.2),
          rightContainerPart: Text(
            AppLocalizations.of(context)!.searchTitle,
            style: MyTextStyles.searchTextPlaceholder,
          ),
          leftContainerPart: Container(),
        ),
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 56;

  @override
  // TODO: implement minExtent
  double get minExtent => 56;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false;
  }
}
