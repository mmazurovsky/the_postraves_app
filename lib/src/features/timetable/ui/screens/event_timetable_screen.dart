import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/app_bar_title.dart';
import '../../timetable_cubit/timetable_cubit.dart';
import '../../dto/timetable_for_scene_dto.dart';
import '../../../../core/presentation/widgets/loading_container.dart';
import '../../../../core/presentation/widgets/my_horizontal_padding.dart';
import '../../../../core/utils/formatting_utils.dart';
import '../widgets/scene_card_for_timetable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_text_styles.dart';
import '../widgets/artist_performances_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EventTimetableScreen extends StatefulWidget {
  const EventTimetableScreen({
    Key? key,
    required this.eventId,
    required this.eventName,
    required this.initialTimetable,
  }) : super(key: key);

  final int eventId;
  final String eventName;
  final List<TimetableForSceneDto> initialTimetable;

  @override
  _EventTimetableScreenState createState() => _EventTimetableScreenState();
}

class _EventTimetableScreenState extends State<EventTimetableScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late List<RefreshController> _refreshControllers;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<TimetableCubit>(context)
        .initTimetable(widget.initialTimetable);
    _tabController = TabController(
        vsync: this, length: widget.initialTimetable.length, initialIndex: 0);
    _refreshControllers = List.generate(
        widget.initialTimetable.length, (i) => RefreshController());
  }

  void _onRefresh() {
    BlocProvider.of<TimetableCubit>(context).refreshTimetable(widget.eventId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.screenBackground,
      appBar: AppBar(
        backgroundColor: MyColors.screenBackground,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          padding: const EdgeInsets.all(8),
          visualDensity: VisualDensity.standard,
          alignment: Alignment.center,
          icon: const Icon(
            Ionicons.chevron_back_outline,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: AppBarTitle(
          title: widget.eventName,
          subtitle: AppLocalizations.of(context)!.timetableTitle,
        ),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 5),
          child: BlocListener<TimetableCubit, TimetableState>(
            listener: (context, state) {
              if (state is TimetableLoadedState) {
                //* this is not tested
                if (widget.initialTimetable.length != state.timetable.length) {
                  _tabController = TabController(
                      vsync: this,
                      length: state.timetable.length,
                      initialIndex: 0);
                  _refreshControllers = List.generate(
                      state.timetable.length, (i) => RefreshController());
                }
                for (var element in _refreshControllers) {
                  element.refreshCompleted();
                }
              }
            },
            child: TabBar(
              indicatorColor: MyColors.accent,
              controller: _tabController,
              tabs:
                  widget.initialTimetable.map((scene) => Container()).toList(),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<TimetableCubit, TimetableState>(
          // listener: (context, state) {
          //   if (state is TimetableRefreshingState) {
          //   } else if (state is TimetableLoadedState) {
              // for (var element in _refreshControllers) {
              //   element.refreshCompleted();
              // }
          //   }
          // },
          buildWhen: (previousState, currentState) =>
              currentState is! TimetableRefreshingState,
          builder: (context, state) {
            if (state is TimetableLoadedState) {
              return TabBarView(
                controller: _tabController,
                children: state.timetable.asMap().entries.map((entry) {
                  final indexOfScene = entry.key;
                  final timetableForScene = entry.value;
                  return PerformancesForScene(
                    timetableForSceneDto: timetableForScene,
                    tabController: _tabController,
                    onRefresh: _onRefresh,
                    refreshController: _refreshControllers[indexOfScene],
                  );
                }).toList(),
              );
            } else {
              return const LoadingContainer();
            }
          },
        ),
      ),
    );
  }
}

//* can't be stateless because of keep alive mixin on state class
class PerformancesForScene extends StatefulWidget {
  final TimetableForSceneDto timetableForSceneDto;
  final TabController tabController;
  final Function onRefresh;
  final RefreshController refreshController;
  const PerformancesForScene({
    Key? key,
    required this.timetableForSceneDto,
    required this.tabController,
    required this.onRefresh,
    required this.refreshController,
  }) : super(key: key);

  @override
  State<PerformancesForScene> createState() => _PerformancesForSceneState();
}

class _PerformancesForSceneState extends State<PerformancesForScene>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SmartRefresher(
      enablePullDown: true,
      controller: widget.refreshController,
      onRefresh: () => widget.onRefresh(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SceneCardForTimetable(widget.timetableForSceneDto.scene),
            const SizedBox(height: 17),
            ...widget.timetableForSceneDto.timetableDayPerformances
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
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
