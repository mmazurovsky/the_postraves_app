import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import '../../dto/timetable_for_scene_dto.dart';
import '../../../wiki/state/event_cubit/event_cubit.dart';
import '../../../../core/presentation/widgets/loading_container.dart';
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
  const EventTimetableScreen({
    Key? key,
    required this.eventId,
    required this.eventName,
    required this.timetable,
    required this.eventBlocProvider,
  }) : super(key: key);

  final int eventId;
  final String eventName;
  final List<TimetableForSceneDto> timetable;
  final EventCubit eventBlocProvider;

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
    _tabController = TabController(
        vsync: this, length: widget.timetable.length, initialIndex: 0);
    _refreshControllers =
        List.generate(widget.timetable.length, (i) => RefreshController());
  }

  void _onRefresh() {
    widget.eventBlocProvider.refreshEvent(widget.eventId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.eventBlocProvider,
      child: Scaffold(
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
          title: SizedBox(
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
            child: TabBar(
              indicatorColor: MyColors.accent,
              controller: _tabController,
              tabs: widget.timetable.map((scene) => Container()).toList(),
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
                for (var element in _refreshControllers) {
                  element.refreshCompleted();
                }
              }
            },
            buildWhen: (previousState, currentState) =>
                currentState is! EventRefreshingState,
            builder: (context, state) {
              if (state is EventLoadedState) {
                return TabBarView(
                  controller: _tabController,
                  children: state.timetable.asMap().entries.map((entry) {
                    final indexOfScene = entry.key;
                    final timetableForScene = entry.value;
                    return TimetableForScene(
                      timetableForSceneDto: state.timetable[indexOfScene],
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
      ),
    );
  }
}

//* can't be stateless because of keep alive mixin on state class
class TimetableForScene extends StatefulWidget {
  final TimetableForSceneDto timetableForSceneDto;
  final TabController tabController;
  final Function onRefresh;
  final RefreshController refreshController;
  const TimetableForScene({
    Key? key,
    required this.timetableForSceneDto,
    required this.tabController,
    required this.onRefresh,
    required this.refreshController,
  }) : super(key: key);

  @override
  State<TimetableForScene> createState() => _TimetableForSceneState();
}

class _TimetableForSceneState extends State<TimetableForScene>
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
