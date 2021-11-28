import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import 'package:the_postraves_package/models/geo/city.dart';
import '../../../../common/bottom_navigation_bar/bottom_navigation_tab_item.dart';
import '../../../../common/constants/my_text_styles.dart';
import '../../../../common/geo_provider/city_list_provider.dart';
import '../../../../common/geo_provider/current_city_provider.dart';
import '../../../../common/widgets/animations/my_slide_animated_switcher.dart';
import '../../../../common/widgets/app_bar/app_bar_button.dart';
import '../../../../common/widgets/other/loading_container.dart';
import '../../../../common/widgets/other/my_flushbar.dart';
import '../../../../common/widgets/selectors/current_city_selector.dart';
import '../../state/shows_cubit/shows_cubit.dart';
import '../widgets/events_by_date_list.dart';
import '../widgets/events_list.dart';
import '../widgets/sort_mode_selector.dart';

class ShowsScreen extends StatefulWidget {
  const ShowsScreen([Key? key]) : super(key: key);

  @override
  _ShowsScreenState createState() => _ShowsScreenState();
}

class _ShowsScreenState extends State<ShowsScreen> {
  late RefreshController _refreshController1;
  late RefreshController _refreshController2;
  final ScrollController _scrollController = TabItem.shows.tabScrollController;
  City? _currentCity;
  List<City>? _cities;

  @override
  void initState() {
    super.initState();
    _refreshController1 = RefreshController();
    _refreshController2 = RefreshController();
  }

  @override
  void dispose() {
    _refreshController1.dispose();
    _refreshController2.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_currentCity != context.watch<CurrentCityProvider>().currentCity) {
      _currentCity = context.read<CurrentCityProvider>().currentCity!;
      BlocProvider.of<ShowsCubit>(context).fullyLoadShows(_currentCity!);
    }

    _cities = context.watch<CityListProvider>().cityList;
  }

  void _onRefresh() async {
    BlocProvider.of<ShowsCubit>(context).refreshShows(_currentCity!);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
        controller: _scrollController,
        physics: BouncingScrollPhysics(),
        // BUG! wtf it is so glithy
        // floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: true,
              title: InkWell(
                onTap: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => CurrentCitySelector(
                    currentCity: _currentCity!,
                    cities: _cities!,
                    onSelected: (City newCurrentCity) => context
                        .read<CurrentCityProvider>()
                        .changeCurrentCity(newCurrentCity),
                  ),
                ),
                child:
                    Text(_currentCity!.localName, style: MyTextStyles.appTitle),
              ),
              centerTitle: false,
              actions: [
                AppBarButton(
                  containerOpacity: 0,
                  iconWidget: const Icon(
                    Ionicons.easel_outline,
                    color: MyColors.main,
                    size: 25,
                  ),
                  onTap: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => SortModeSelector(),
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
              _refreshController1.refreshCompleted();
              _refreshController2.refreshCompleted();
            } else if (state is ShowsFailureState) {
              MyFlushbar.showMyFlushbar(
                  flushbarMessage: 'noInternet'.tr(),
                  flushbarIcon: const Icon(
                    Ionicons.alert_circle_outline,
                    color: Colors.red,
                  ),
                  incomingContext: context);
            }
          },
          buildWhen: (previousState, currentState) =>
              currentState is! ShowsRefreshingState,
          builder: (context, state) {
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
                      : LoadingContainer(),
            );
          },
        ),
      ),
    );
  }
}
