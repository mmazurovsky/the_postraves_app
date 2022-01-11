import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import 'package:the_postraves_package/dto/followable_data.dart';
import 'package:the_postraves_package/dto/followable_params.dart';
import 'package:the_postraves_package/dto/timetable_for_scene_by_day.dart';
import 'package:the_postraves_package/models/fulls/event_full.dart';
import 'package:the_postraves_package/models/shorts/artist_short.dart';
import 'package:the_postraves_package/models/shorts/event_short.dart';
import 'package:the_postraves_package/models/shorts/place_short.dart';
import 'package:the_postraves_package/models/shorts/unity_short.dart';

import '../../../../common/constants/my_constants.dart';
import '../../../../common/constants/my_text_styles.dart';
import '../../../../common/navigation/my_navigation.dart';
import '../../../../common/utils/formatting_utils.dart';
import '../../../../common/widgets/animations/wrappers.dart';
import '../../../../common/widgets/dialogs.dart';
import '../../../../common/widgets/entity_presentation/followable_item.dart';
import '../../../../common/widgets/other/details_horizontal_scrollable_list.dart';
import '../../../../common/widgets/other/loading_container.dart';
import '../../../../common/widgets/other/section_title.dart';
import '../../../../common/widgets/spacers/my_horizontal_padding.dart';
import '../../../../common/widgets/spacers/my_spacers.dart';
import '../../../../common/widgets/spacers/section_divider.dart';
import '../../state/event_cubit/event_cubit.dart';
import '../../state/followable_change_notifier.dart';
import '../widgets/about_section.dart';
import '../widgets/button_with_icons.dart';
import '../widgets/event_main_button.dart';
import '../widgets/event_status_indicator.dart';
import '../widgets/followable_list_section.dart';
import '../widgets/followable_util.dart';
import 'followable_screen.dart';

class EventScreen extends StatelessWidget {
  final FollowableData _followableData;
  const EventScreen(
    this._followableData, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FollowableScreen<EventCubit>(
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
    return BlocBuilder<EventCubit, EventState>(
      builder: (context, state) {
        if (state is EventLoadedState) {
          return _EventContent(
            event: state.event,
            unities: state.orgs,
            lineup: state.lineup,
            timetable: state.timetable,
            eventBlocProvider: _eventBlocProvider,
          );
        } else {
          return const LoadingContainer();
          // TODO Exception
        }
      },
    );
  }
}

class _EventContent extends StatelessWidget {
  final EventFull event;
  final List<UnityShort> unities;
  final List<ArtistShort> lineup;
  final List<TimetableForSceneByDay> timetable;
  final EventCubit eventBlocProvider;

  const _EventContent({
    required this.event,
    required this.unities,
    required this.lineup,
    required this.timetable,
    required this.eventBlocProvider,
    Key? key,
  }) : super(key: key);

//   @override
//   State<_EventContent> createState() => _EventContentState();
// }

// class _EventContentState extends State<_EventContent> {
//   // late bool _isFollowed;
//   late FollowableVariables _followableVariables;

//   @override
//   void didChangeDependencies() {
//     _followableVariables = context
//             .watch<FollowableVariablesService>()
//             .get(event.followableId) ??
//         event.followableVariables;
//     // _isFollowed = context
//     //         .watch<FollowableChangeNotifier>()
//     //         .get(event.followableId)
//     //         ?.isFollowed ??
//     //     false;
//     super.didChangeDependencies();
//   }

  @override
  Widget build(BuildContext context) {
    return SlideAnimationWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MyBigSpacer(),
          MyHorizontalPadding(
            child: ChangeNotifierProvider.value(
              value: context
                  .read<FollowableVariablesService>()
                  .get(event.newFollowableId),
              builder: (context, _) {
                final variables = context.watch<FollowableVariables>();
                return EventMainButton(
                  status: event.status,
                  ticketsLink: event.ticketsLink,
                  isFollowed: variables.isFollowed,
                  overallFollowers: variables.overallFollowers,
                  onIsFollowedChange: () =>
                      FollowableUtil.onIsFollowedChange<EventFull, EventShort>(
                          context, event),
                );
              },
            ),
          ),
          DetailsHorizontalScrollableList(
            verticalPadding: 23,
            titleBodyMap: {
              'wikiEventStatus'.tr(): Row(
                children: [
                  Text(
                    FormattingUtils.getEventStatusNameTranslation(event.status),
                    style: MyTextStyles.body,
                  ),
                  const SizedBox(width: 10),
                  EventStatusIndicator(event.status),
                ],
              ),
              'wikiEventPrice'.tr(): Text(
                FormattingUtils.resolveTicketsPrice(
                  event.ticketPrices,
                ),
                style: MyTextStyles.body,
              ),
              'wikiEventStart'.tr(): Row(
                children: [
                  Text(
                    FormattingUtils.getFormattedDateAndTime(
                      dateTime: event.startDateTime,
                    ),
                    style: MyTextStyles.body,
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () => showDialog(
                      context: context,
                      builder: (ctx) => DialogWithOkButton(
                        'eventStartTimeInfo'
                            .tr(args: [event.place.city.localName]),
                        Navigator.of(ctx).pop,
                      ),
                    ),
                    child: const Icon(
                      Ionicons.information_circle_outline,
                      color: MyColors.accent,
                    ),
                  ),
                ],
              ),
              'wikiEventEnd'.tr(): Row(
                children: [
                  Text(
                    FormattingUtils.getFormattedDateAndTime(
                      dateTime: event.endDateTime,
                    ),
                    style: MyTextStyles.body,
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () => showDialog(
                      context: context,
                      builder: (ctx) => DialogWithOkButton(
                        'eventEndTimeInfo'
                            .tr(args: [event.place.city.localName]),
                        Navigator.of(ctx).pop,
                      ),
                    ),
                    child: const Icon(
                      Ionicons.information_circle_outline,
                      color: MyColors.accent,
                    ),
                  ),
                ],
              ),
            },
          ),
          AboutSection(event.about, areSpacerAndDividerNeeded: false),
          event.place.isJustCity
              ? PlaceIsCityPlaceholder(event.place)
              : FollowableListSection(
                  'placeEntityNameSingular'.tr(),
                  [event.place],
                ),
          FollowableListSection(
            'wikiEventOrganizers'.tr(),
            unities,
          ),
          FollowableListSection(
            'wikiEventLineup'.tr(),
            lineup,
            leadingWidget: timetable.isEmpty
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
                      eventId: event.id,
                      eventName: event.name,
                      timetableDto: timetable,
                    ),
                    verticalPadding: MyConstants.ratingEntityVerticalPadding,
                  ),
          ),
        ],
      ),
    );
  }
}

class PlaceIsCityPlaceholder extends StatelessWidget {
  final PlaceShort _place;

  const PlaceIsCityPlaceholder(this._place, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MyBigSpacer(),
        const SectionDivider(needHorizontalMargin: true),
        const MyMediumPlusSpacer(),
        SectionTitle(
          sectionTitle: 'placeEntityNameSingular'.tr(),
        ),
        const MySmallSpacer(),
        FollowableItem(
          entity: _place,
        )
      ],
    );
  }
}
