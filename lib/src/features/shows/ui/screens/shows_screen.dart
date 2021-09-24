import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../core/presentation/widgets/buttons/app_bar_button.dart';
import '../../state/shows_cubit/shows_cubit.dart';
import '../widgets/current_city_switcher.dart';
import '../../../../models/geo/city.dart';
import '../../../../core/provider/current_city_provider.dart';
import 'package:provider/provider.dart';
import '../../../../core/navigation_bar/bottom_navigation_tab_item.dart';
import '../../../../core/presentation/widgets/loading_screen.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/presentation/widgets/animations/my_slide_animated_switcher.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../core/presentation/widgets/my_flushbar.dart';
import '../../../../core/service/logger.dart';
import '../widgets/sort_mode_switcher.dart';
import '../widgets/events_by_date_list.dart';
import '../widgets/events_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/my_assets.dart';

class ShowsScreen extends StatefulWidget {
  const ShowsScreen();

  @override
  _ShowsScreenState createState() => _ShowsScreenState();
}

class _ShowsScreenState extends State<ShowsScreen> {
  late RefreshController _refreshController1;
  late RefreshController _refreshController2;
  City? currentCity;

  @override
  void initState() {
    super.initState();
    _refreshController1 = RefreshController();
    _refreshController2 = RefreshController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (currentCity != context.watch<CurrentCityProvider>().currentCity) {
      currentCity =
          context.read<CurrentCityProvider>().currentCity!; //todo risky !
      BlocProvider.of<ShowsCubit>(context).fullyLoadShows(currentCity!); //todo risky !
    }
  }

  void _onRefresh() async {
    BlocProvider.of<ShowsCubit>(context).refreshShows(currentCity!);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
        controller: TabItem.shows.tabScrollController,
        physics: BouncingScrollPhysics(),
        // todo wtf it so glithy
        // floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: true,
              leading: AppBarButton(
                containerOpacity: 0,
                iconWidget: Icon(
                  Ionicons.location_outline,
                  color: MyColors.main,
                  size: 25,
                ),
                onTap: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => CurrentCitySwitcher(),
                ),
              ),
              title: Image.asset(MyImages.diamond, width: 23),
              actions: [
                AppBarButton(
                  containerOpacity: 0,
                  iconWidget: Icon(
                    Ionicons.funnel_outline,
                    color: MyColors.main,
                    size: 25,
                  ),
                  onTap: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => SortModeSwitcher(),
                  ),
                ),
              ],
              backgroundColor: MyColors.screenBackground,
            ),
          ];
        },
        body: BlocConsumer<ShowsCubit, ShowsState>(
          listener: (context, state) {
            if (state is ShowsLoadedByDateState ||
                state is ShowsLoadedByRatingState) {
              myGlobalLogger.info('Shows loaded');
              _refreshController1.refreshCompleted();
              _refreshController2.refreshCompleted();
            } else if (state is ShowsFailureState) {
              MyFlushbar.showMyFlushbar(
                  //todo localization
                  flushbarMessage: 'Отсутствует подключение к интернету', //todo
                  flushbarIcon: Icon(
                    Ionicons.alert_circle_outline,
                    color: Colors.red,
                  ),
                  incomingContext: context);
            }
          },
          buildWhen: (previousState, currentState) =>
              currentState is! ShowsRefreshingState,
          builder: (context, state) {
            if (state is ShowsLoadedByRatingState ||
                state is ShowsLoadedByDateState) {
              return MySlideAnimatedSwitcher(
                child: state is ShowsLoadedByRatingState
                    ? EventsList(
                        eventsByRating: state.showsByRating,
                        onRefresh: _onRefresh,
                        refreshController: _refreshController1)
                    : state is ShowsLoadedByDateState
                        ? EventsByDateList(
                            eventsByDate: state.showsByDate,
                            onRefresh: _onRefresh,
                            refreshController: _refreshController2)
                        : Container(),
              );
            } else {
              return LoadingScreen();
            }
          },
        ),
      ),
    );
  }
}
