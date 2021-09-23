import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import '../../dto/timetable_for_scene_dto.dart';
import '../../../wiki/state/event_cubit/event_cubit.dart';
import '../../../../core/presentation/widgets/loading_screen.dart';
import '../../../../core/presentation/widgets/my_horizontal_padding.dart';
import '../../../../core/utils/formatting_utils.dart';
import '../../../../core/utils/my_constants.dart';
import '../widgets/scene_card_for_timetable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_text_styles.dart';
import '../widgets/artist_performances_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EventTimetableScreen extends StatefulWidget {
  EventTimetableScreen({
    Key? key,
    required this.eventId,
    required this.eventName,
    required this.timetable,
  }) : super(key: key);

  final int eventId;
  final String eventName;
  final List<TimetableForSceneDto> timetable;

  @override
  _EventTimetableScreenState createState() => _EventTimetableScreenState();
}

class _EventTimetableScreenState extends State<EventTimetableScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
    _tabController = TabController(
        vsync: this, length: widget.timetable.length, initialIndex: 0);
  }

  void _onRefresh() {
    BlocProvider.of<EventCubit>(context).refreshEvent(widget.eventId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.screenBackground,
      appBar: AppBar(
        backgroundColor: MyColors.screenBackground,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          padding: EdgeInsets.all(8),
          visualDensity: VisualDensity.standard,
          alignment: Alignment.center,
          icon: Icon(
            Ionicons.chevron_back_outline,
            color: Colors.white,
          ),
        ),
        actions: [],
        centerTitle: true,
        title: Container(
          width: MyConstants.appBarTitleWidth(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.eventName,
                style: MyTextStyles.appBarTitle,
                overflow: TextOverflow.fade,
              ),
              Text(
                AppLocalizations.of(context)!.timetableTitle,
                style: MyTextStyles.appBarSubtitle,
                overflow: TextOverflow.fade,
              ),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 5),
          child: Container(
            child: TabBar(
              indicatorColor: MyColors.main,
              controller: _tabController,
              tabs: widget.timetable.map((scene) => Container()).toList(),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: BlocConsumer<EventCubit, EventState>(
          listener: (context, state) {
            if (state is EventLoadingState) {
              print('loading state');
            } else if (state is EventLoadedState) {
              print('loaded state');
              _refreshController.refreshCompleted();
            }
          },
          buildWhen: (previousState, currentState) =>
              currentState is! EventRefreshingState,
          builder: (context, state) {
            if (state is EventLoadedState) {
              return Timetable(
                timetableForSceneDtoList:
                    state.timetable,
                tabController: _tabController,
                onRefresh: _onRefresh,
                refreshController: _refreshController,
              );
            }
            return LoadingScreen();
          },
        ),
      ),
    );
  }
}

class Timetable extends StatefulWidget {
  final List<TimetableForSceneDto> timetableForSceneDtoList;
  final TabController tabController;
  final Function onRefresh;
  final RefreshController refreshController;
  Timetable({
    Key? key,
    required this.timetableForSceneDtoList,
    required this.tabController,
    required this.onRefresh,
    required this.refreshController,
  }) : super(key: key);

  @override
  _TimetableState createState() => _TimetableState();
}

class _TimetableState extends State<Timetable> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      controller: widget.refreshController,
      onRefresh: () => widget.onRefresh(),
      child: TabBarView(
        controller: widget.tabController,
        children: widget.timetableForSceneDtoList
            .map((timetableForScene) =>
                MySceneTimetable(timetableForScene: timetableForScene))
            .toList(),
      ),
    );
  }
}

class MySceneTimetable extends StatelessWidget {
  final TimetableForSceneDto timetableForScene;
  const MySceneTimetable({
    Key? key,
    required this.timetableForScene,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SceneCardForTimetable(timetableForScene.scene),
          SizedBox(height: 17),
          ...timetableForScene.timetableDayPerformances
              .map(
                (dayPerformances) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyHorizontalPadding(
                      child: Text(
                        FormattingUtils.getFormattedDateLong(
                          context: context,
                          dateTime: dayPerformances.date,
                        ),
                        style: MyTextStyles.sectionTitle,
                      ),
                    ),
                    SizedBox(height: 5),
                    ArtistPerformancesList(
                      dayPerformances.performances,
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
