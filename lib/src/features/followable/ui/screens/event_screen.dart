import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ionicons/ionicons.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import 'package:the_postraves_package/dto/followable_data.dart';
import 'package:the_postraves_package/dto/timetable_for_scene_by_day.dart';
import 'package:the_postraves_package/models/fulls/event_full.dart';
import 'package:the_postraves_package/models/interfaces/data_interfaces.dart';
import 'package:the_postraves_package/models/shorts/artist_short.dart';
import 'package:the_postraves_package/models/shorts/unity_short.dart';
import '../../../../common/constants/my_constants.dart';
import '../../../../common/constants/my_text_styles.dart';
import '../../../../common/utils/formatting_utils.dart';
import '../../../../common/widgets/other/details_horizontal_scrollable_list.dart';
import '../../../../common/widgets/other/loading_container.dart';
import '../../../../common/widgets/spacers/my_horizontal_padding.dart';
import '../../../../common/widgets/spacers/my_spacers.dart';
import '../../../../common/navigation/my_navigation.dart';
import '../../state/event_cubit/event_cubit.dart';
import '../../state/follow_cubit/follow_cubit.dart';
import '../widgets/about_section.dart';
import '../widgets/button_with_icons.dart';
import '../widgets/event_main_button.dart';
import '../widgets/event_status_indicator.dart';
import '../widgets/followable_list_section.dart';
import '../widgets/followable_util.dart';
import '../widgets/slide_animation_wrapper.dart';
import 'followable_screen.dart';

class EventScreen extends StatelessWidget {
  final FollowableData _followableData;
  const EventScreen(
    this._followableData, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FollowableScreen<EventCubit, FollowCubit<EventFull>>(
      _followableData,
      _EventStateManagement(_followableData),
    );
  }
}

class _EventStateManagement extends StatefulWidget {
  final FollowableData _followableData;
  const _EventStateManagement(this._followableData, {Key? key})
      : super(key: key);

  @override
  _EventStateManagementState createState() => _EventStateManagementState();
}

class _EventStateManagementState extends State<_EventStateManagement> {
  late final EventCubit _eventBlocProvider;

  @override
  void initState() {
    super.initState();
    _eventBlocProvider = BlocProvider.of<EventCubit>(context);
    _eventBlocProvider.loadEvent(widget._followableData.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventCubit, EventState>(
      listener: (context, state) {
        if (state is EventLoadedState) {
          context.read<FollowCubit<EventFull>>().defineFollowState(
                weeklyFollowers: state.event.weeklyFollowers,
                overallFollowers: state.event.overallFollowers,
                isFollowed: state.event.isFollowed,
              );
        }
      },
      builder: (context, state) {
        if (state is EventLoadedState) {
          return _EventContent(
            event: state.event,
            unities: state.orgs,
            lineup: state.lineup,
            timetable: state.timetable,
            eventBlocProvider: _eventBlocProvider,
            onIsFollowedChange: FollowableUtil.onIsFollowedChange,
          );
        } else {
          return LoadingContainer();
          // TODO Exception
        }
      },
    );
  }
}

class _EventContent extends StatefulWidget {
  final EventFull event;
  final List<UnityShort> unities;
  final List<ArtistShort> lineup;
  final List<TimetableForSceneByDay> timetable;
  final EventCubit eventBlocProvider;
  final void Function<T extends GeneralFollowableInterface>(BuildContext, T)
      onIsFollowedChange;

  const _EventContent({
    required this.event,
    required this.unities,
    required this.lineup,
    required this.timetable,
    required this.onIsFollowedChange,
    required this.eventBlocProvider,
    Key? key,
  }) : super(key: key);

  @override
  State<_EventContent> createState() => _EventContentState();
}

class _EventContentState extends State<_EventContent> {
  late bool _isFollowed;

  @override
  void didChangeDependencies() {
    _isFollowed = context.watch<FollowCubit<EventFull>>().state.isFollowed!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SlideAnimationWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MyBigSpacer(),
          MyHorizontalPadding(
            child: EventMainButton(
              status: widget.event.status,
              ticketsLink: widget.event.ticketsLink,
              isFollowed: _isFollowed,
              onIsFollowedChange: () =>
                  FollowableUtil.onIsFollowedChange(context, widget.event),
            ),
          ),
          DetailsHorizontalScrollableList(
            verticalPadding: 23,
            titleBodyMap: {
              'wikiEventStatus'.tr(): Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    FormattingUtils.getEventStatusNameTranslation(
                        widget.event.status),
                    style: MyTextStyles.body,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  EventStatusIndicator(widget.event.status),
                ],
              ),
              'wikiEventPrice'.tr(): Text(
                FormattingUtils.resolveTicketsPrice(
                  widget.event.ticketPrices,
                ),
                style: MyTextStyles.body,
              ),
              'wikiEventStart'.tr(): Text(
                FormattingUtils.getFormattedDateAndTime(
                  dateTime: widget.event.startDateTime,
                ),
                style: MyTextStyles.body,
              ),
              'wikiEventEnd'.tr(): Text(
                FormattingUtils.getFormattedDateAndTime(
                  dateTime: widget.event.endDateTime,
                ),
                style: MyTextStyles.body,
              ),
            },
          ),
          AboutSection(widget.event.about, areSpacerAndDividerNeeded: false),
          FollowableListSection(
            'placeEntityNameSingular'.tr(),
            [widget.event.place],
          ),
          FollowableListSection(
            'wikiEventOrganizers'.tr(),
            widget.unities,
          ),
          FollowableListSection(
            'wikiEventLineup'.tr(),
            widget.lineup,
            leadingWidget: widget.timetable.isEmpty
                ? Container()
                : ButtonWithIcons(
                    leadingIcon: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: MyColors.forVeryDarkStuff,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        const Icon(
                          Ionicons.reader_outline,
                          size: 30,
                          color: MyColors.accent,
                        ),
                      ],
                    ),
                    buttonText: 'wikiEventOpenTimetable'.tr(),
                    onButtonTap: () => NavigatorFunctions.pushTimetable(
                      context: context,
                      eventId: widget.event.id,
                      eventName: widget.event.name,
                      timetableDto: widget.timetable,
                    ),
                    verticalPadding: MyConstants.ratingEntityVerticalPadding,
                  ),
          ),
        ],
      ),
    );
  }
}
