import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:the_postraves_app/src/features/wiki/state/follow_cubit/follow_cubit.dart';
import 'package:the_postraves_app/src/features/wiki/ui/widgets/followable_util.dart';
import 'package:the_postraves_app/src/features/wiki/ui/widgets/wiki_subtitle.dart';
import 'package:the_postraves_app/src/features/wiki/ui/widgets/wiki_title.dart';
import 'package:the_postraves_app/src/models/dto/wiki_data_dto.dart';
import 'package:the_postraves_app/src/models/fulls/artist_full.dart';
import 'package:the_postraves_app/src/models/interfaces/data_interfaces.dart';
import '../../../../dependency_injection.dart';
import '../../../timetable/dto/timetable_for_scene_dto.dart';
import '../../state/event_cubit/event_cubit.dart';
import '../../../../models/enum/event_status.dart';
import '../../../../models/enum/wiki_rating_type.dart';
import '../../../../models/fulls/event_full.dart';
import '../../../../models/shorts/artist_short.dart';
import '../../../../models/shorts/place_short.dart';
import '../../../../models/shorts/unity_short.dart';
import '../../../../core/presentation/widgets/entity_presentation/rating_entity_list.dart';
import '../../../../core/presentation/widgets/entity_presentation/rating_entity_list_item.dart';
import '../../../../core/presentation/widgets/details_horizontal_scrollable_list.dart';
import '../../../../core/presentation/widgets/loading_container.dart';
import '../../../../core/presentation/widgets/buttons/my_elevated_button_without_padding.dart';
import '../../../../core/service/open_link_service.dart';
import '../../../../models/dto/image_dimensions.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_text_styles.dart';
import '../widgets/event_status_indicator.dart';
import 'followable_screen.dart';
import 'wiki_canvas.dart';
import '../widgets/slide_animation_wrapper.dart';
import '../../../../core/presentation/widgets/my_horizontal_padding.dart';
import '../../../../core/utils/my_constants.dart';
import '../../../../core/presentation/widgets/section_divider.dart';
import '../../../../core/presentation/widgets/section_spacer.dart';
import '../../../../core/presentation/widgets/section_title.dart';
import '../../../../my_navigation.dart';
import '../../../../core/utils/formatting_utils.dart';
import '../widgets/button_with_icons.dart';
import '../widgets/wiki_squared_outlined_bookmark_button.dart';
import '../widgets/wiki_expandable_text_description.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EventScreen extends StatelessWidget {
  final WikiDataDto _wikiDataDto;
  const EventScreen(
    this._wikiDataDto, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FollowableScreen<EventCubit, FollowCubit<EventFull>>(
      _wikiDataDto,
      _EventStateManagement(_wikiDataDto),
    );
  }
}

class _EventStateManagement extends StatefulWidget {
  final WikiDataDto _wikiDataDto;
  const _EventStateManagement(this._wikiDataDto, {Key? key}) : super(key: key);

  @override
  _EventStateManagementState createState() => _EventStateManagementState();
}

class _EventStateManagementState extends State<_EventStateManagement> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<EventCubit>(context).loadEvent(widget._wikiDataDto.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventCubit, EventState>(
      listener: (context, state) {
        if (state is EventLoadedState) {
          context.read<FollowCubit<EventFull>>().defineFollowState(
                state.event.overallFollowers,
                state.event.isFollowed,
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
            onIsFollowedChange: FollowableUtil.onIsFollowedChange,
          );
        } else {
          return LoadingContainer();
          // todo failure state
        }
      },
    );
  }
}

class _EventContent extends StatefulWidget {
  final EventFull event;
  final List<UnityShort> unities;
  final List<ArtistShort> lineup;
  final List<TimetableForSceneDto> timetable;
  final void Function<T extends GeneralFollowableInterface>(BuildContext, T)
      onIsFollowedChange;

  const _EventContent({
    required this.event,
    required this.unities,
    required this.lineup,
    required this.timetable,
    required this.onIsFollowedChange,
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
          SizedBox(height: 20),
          MyHorizontalPadding(
            child: Row(
              children: [
                Expanded(
                  child: MyElevatedButtonWithoutPadding(
                    leadingIcon: Icon(
                      Ionicons.ticket,
                      size: 21,
                      color: MyColors.mainOppositeColor,
                    ),
                    text: AppLocalizations.of(context)!.wikiEventBuyTicket,
                    buttonColor: MyColors.accent,
                    mainAxisAlignment: MainAxisAlignment.center,
                    onTap: () {
                      widget.event.ticketsLink != null &&
                              widget.event.ticketsLink!.length > 3
                          ? OpenLinkService.openUrl(widget.event.ticketsLink!)
                          : {};
                    },
                    textStyle: MyTextStyles.buttonWithOppositeColor,
                    distanceBetweenLeadingAndText: 5,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                WikiSquaredOutlinedBookmarkButton(Icon(
                  Ionicons.bookmark,
                  size: 24,
                  color: MyColors.accent,
                )),
              ],
            ),
          ),
          SizedBox(height: 20),
          DetailsHorizontalScrollableList(
            titleBodyMap: {
              AppLocalizations.of(context)!.wikiEventStatus: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.event.status.getStatusName(context),
                    style: MyTextStyles.body,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  EventStatusIndicator(widget.event.status),
                ],
              ),
              AppLocalizations.of(context)!.wikiEventPrice: Text(
                FormattingUtils.resolveTicketsPrice(
                  context: context,
                  priceRangeOfTickets: widget.event.priceRangeOfTickets,
                ),
                style: MyTextStyles.body,
              ),
              AppLocalizations.of(context)!.wikiEventStart: Text(
                FormattingUtils.getFormattedDateAndTime(
                  context: context,
                  dateTime: widget.event.startDateTime,
                ),
                style: MyTextStyles.body,
              ),
              AppLocalizations.of(context)!.wikiEventEnd: Text(
                FormattingUtils.getFormattedDateAndTime(
                  context: context,
                  dateTime: widget.event.endDateTime,
                ),
                style: MyTextStyles.body,
              ),
            },
          ),
          SizedBox(height: 15),
          widget.event.about == null
              ? Container()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WikiExpandableTextDescription(
                      widget.event.about!,
                    ),
                    SectionSpacer(),
                    SectionDivider(needHorizontalMargin: true),
                    SectionSpacer(),
                  ],
                ),
          SectionTitle(
              sectionTitle:
                  AppLocalizations.of(context)!.placeEntityNameSingular),
          SizedBox(height: 8),
          RatingEntityListItem(
            entity: widget.event.place,
            onItemTap: (context, PlaceShort entity,
                    ImageDimensions? imageDimensions) =>
                NavigatorFunctions.pushFollowable(
              context: context,
              wikiDataDto: entity.convertToWikiDataDto(imageDimensions),
            ),
          ),
          SectionSpacer(),
          widget.unities.isEmpty
              ? Container()
              : Column(
                  children: [
                    SectionDivider(needHorizontalMargin: true),
                    SectionSpacer(),
                    SectionTitle(
                        sectionTitle:
                            AppLocalizations.of(context)!.wikiEventOrganizers),
                    SizedBox(height: 8),
                    RatingEntityList<UnityShort>(
                      entityList: widget.unities,
                      onItemTap: (context, UnityShort entity,
                              ImageDimensions? imageDimensions) =>
                          NavigatorFunctions.pushFollowable(
                        context: context,
                        wikiDataDto:
                            entity.convertToWikiDataDto(imageDimensions),
                      ),
                    ),
                    SectionSpacer(),
                  ],
                ),
          widget.lineup.isEmpty
              ? Container()
              : Column(
                  children: [
                    SectionDivider(needHorizontalMargin: true),
                    SectionSpacer(),
                    SectionTitle(
                      sectionTitle:
                          AppLocalizations.of(context)!.wikiEventLineup,
                    ),
                    SizedBox(height: 8),
                    widget.timetable.isEmpty
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
                                Icon(
                                  Ionicons.reader_outline,
                                  size: 30,
                                  color: MyColors.accent,
                                ),
                              ],
                            ),
                            buttonText: AppLocalizations.of(context)!
                                .wikiEventOpenTimetable,
                            onButtonTap: () => NavigatorFunctions.pushTimetable(
                              context: context,
                              eventId: widget.event.id,
                              eventName: widget.event.name,
                              timetableDto: widget.timetable,
                            ),
                            verticalPadding:
                                MyConstants.ratingEntityVerticalPadding,
                          ),
                    RatingEntityList(
                      entityList: widget.lineup,
                      onItemTap: (context, ArtistShort entity,
                              ImageDimensions? imageDimensions) =>
                          NavigatorFunctions.pushFollowable(
                        context: context,
                        wikiDataDto:
                            entity.convertToWikiDataDto(imageDimensions),
                      ),
                    ),
                    SectionSpacer(),
                  ],
                ),
        ],
      ),
    );
  }
}
