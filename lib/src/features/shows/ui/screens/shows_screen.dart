import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:the_postraves_app/src/common/geo_change_notifier/city_change_notifier.dart';
import 'package:the_postraves_app/src/common/widgets/animations/wrappers.dart';
import 'package:the_postraves_app/src/features/shows/state/date_filter_change_notifier.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import 'package:the_postraves_package/models/geo/city.dart';
import '../../../../common/bottom_navigation_bar/bottom_navigation_tab_item.dart';
import '../../../../common/constants/my_text_styles.dart';
import '../../../../common/geo_change_notifier/current_city_change_notifier.dart';
import '../../../../common/widgets/app_bar/app_bar_button.dart';
import '../../../../common/widgets/other/loading_container.dart';
import '../../../../common/widgets/other/my_flushbar.dart';
import '../../../../common/widgets/selectors/current_city_selector.dart';
import '../../state/shows_cubit/shows_cubit.dart';
import '../widgets/events_list.dart';
import '../widgets/shows_date_filter_selector.dart';

class ShowsScreen extends StatefulWidget {
  const ShowsScreen([Key? key]) : super(key: key);

  @override
  _ShowsScreenState createState() => _ShowsScreenState();
}

class _ShowsScreenState extends State<ShowsScreen> {
  late RefreshController _refreshController1;
  final ScrollController _scrollController = TabItem.shows.tabScrollController;
  City? _currentCity;
  List<City>? _cities;

  @override
  void initState() {
    super.initState();
    _refreshController1 = RefreshController();
  }

  @override
  void dispose() {
    _refreshController1.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //todo refactor
    if (_currentCity !=
        context.watch<CurrentCityChangeNotifier>().currentCity) {
      _currentCity = context.read<CurrentCityChangeNotifier>().currentCity!;
      BlocProvider.of<ShowsCubit>(context).fullyLoadShows(_currentCity!);
    }

    _cities = context.watch<CityListChangeNotifier>().cityList;
  }

  void _onRefresh() async {
    BlocProvider.of<ShowsCubit>(context).refreshShows(_currentCity!);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, _) => [
          SliverAppBar(
            floating: true,
            title: ShowsTitleButton(_currentCity!, _cities!),
            centerTitle: false,
            actions: [
              AppBarButton(
                containerOpacity: 0,
                iconWidget: Icon(
                  context.watch<DateTimeFilterChangeNotifier>().isFiltered
                      ? Ionicons.calendar_clear
                      : Ionicons.calendar_clear_outline,
                  color:
                      context.watch<DateTimeFilterChangeNotifier>().isFiltered
                          ? MyColors.accent
                          : MyColors.main,
                  size: 25,
                ),
                onTap: () => showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => ShowsDateFilterSelector(),
                ),
              ),
            ],
            backgroundColor: MyColors.screenBackground,
          )
        ],
        body: BlocConsumer<ShowsCubit, ShowsState>(
          listener: (context, state) {
            if (state is ShowsLoadedState) {
              _refreshController1.refreshCompleted();
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
            return state is ShowsLoadedState
                ? SlideAnimationWrapper(
                    child:
                        context.watch<DateTimeFilterChangeNotifier>().isFiltered
                            ? FilteredEventsList(state.shows)
                            : UnfilteredEventsList(
                                events: state.shows,
                                onRefresh: _onRefresh,
                                refreshController: _refreshController1),
                  )
                : const LoadingContainer();
          },
        ),
      ),
    );
  }
}

class ShowsTitleButton extends StatelessWidget {
  final City _currentCity;
  final List<City> _cities;
  const ShowsTitleButton(this._currentCity, this._cities, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showModalBottomSheet(
        context: context,
        builder: (context) => CurrentCitySelector(
          currentCity: _currentCity,
          cities: _cities,
          onSelected: (City newCurrentCity) => context
              .read<CurrentCityChangeNotifier>()
              .changeCurrentCity(newCurrentCity),
        ),
      ),
      child: Text(
        _currentCity.localName,
        style: MyTextStyles.appTitle,
      ),
    );
  }
}
