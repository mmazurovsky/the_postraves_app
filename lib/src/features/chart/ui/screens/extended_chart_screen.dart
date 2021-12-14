import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import 'package:the_postraves_package/dto/image_dimensions.dart';
import 'package:the_postraves_package/models/geo/city.dart';
import 'package:the_postraves_package/models/interfaces/data_interfaces.dart';
import '../../../../common/geo_change_notifier/current_city_change_notifier.dart';
import '../../../../common/widgets/app_bar/app_bar_back_button.dart';
import '../../../../common/widgets/app_bar/app_bar_title.dart';
import '../../../../common/widgets/app_bar/my_simple_app_bar.dart';
import '../../../../common/widgets/entity_presentation/followable_list.dart';
import '../../../../common/widgets/other/loading_container.dart';
import '../../../../common/navigation/my_navigation.dart';
import '../../data/chart_type.dart';
import '../../state/cubit/charts_cubit.dart';

class ExtendedChartScreen<T extends GeneralFollowableInterface>
    extends StatefulWidget {
  final ChartType chartType;
  final List<T> initialFollowables;
  const ExtendedChartScreen({
    required this.chartType,
    required this.initialFollowables,
    Key? key,
  }) : super(key: key);

  @override
  State<ExtendedChartScreen<T>> createState() => _ExtendedChartScreenState<T>();
}

class _ExtendedChartScreenState<T extends GeneralFollowableInterface>
    extends State<ExtendedChartScreen<T>> {
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
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_currentCity !=
        context.watch<CurrentCityChangeNotifier>().currentCity) {
      _currentCity = context.read<CurrentCityChangeNotifier>().currentCity!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.screenBackground,
      appBar: MySimpleAppBar(
        elevation: 3,
        leading: const AppBarBackButton(),
        title: AppBarTitle(
          title: widget.chartType.getChartTitle(context).toUpperCase(),
        ),
      ),
      body: BlocConsumer<ChartsCubit, ChartsState>(listener: (context, state) {
        if (state is ChartsStateLoaded) {
          _refreshController.refreshCompleted();
        }
      }, buildWhen: (prevState, curState) {
        return curState is ChartsStateRefreshing ? false : true;
      }, builder: (context, state) {
        if (state is ChartsStateLoaded) {
          return _ExtendedChartBody(
            followables: widget.chartType == ChartType.overall
                ? state.overallArtists
                : state.weeklyArtists,
            refreshController: _refreshController,
            onRefresh: _onRefresh,
            showWeeklyFollowers: widget.chartType.getChartShowWeeklyFollowers,
          );
        } else {
          return const LoadingContainer();
        }
      }),
    );
  }
}

class _ExtendedChartBody<T extends GeneralFollowableInterface>
    extends StatelessWidget {
  final List<T> followables;
  final RefreshController refreshController;
  final void Function() onRefresh;
  final bool showWeeklyFollowers;

  const _ExtendedChartBody({
    required this.followables,
    required this.refreshController,
    required this.onRefresh,
    required this.showWeeklyFollowers,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      controller: refreshController,
      onRefresh: () => onRefresh(),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
        padding: const EdgeInsets.only(top: 10),
        child: FollowableList(
          showWeeklyFollowers: showWeeklyFollowers,
          followables: followables,
          onItemTap: (BuildContext context, T entity,
                  ImageDimensions? imageDimensions) =>
              NavigatorFunctions.pushFollowable(
            context: context,
            followableData: entity.convertToFollowableData(imageDimensions),
          ),
        ),
      ),
    );
  }
}
