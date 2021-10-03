import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
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
import '../../../../core/presentation/widgets/loading_screen.dart';
import '../../../../core/presentation/widgets/buttons/my_elevated_button_without_padding.dart';
import '../../../../core/service/open_link_service.dart';
import '../../../../core/utils/image_dimensions.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_text_styles.dart';
import '../../dto/wiki_data_dto.dart';
import '../widgets/event_status_indicator.dart';
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

class EventScreen extends StatefulWidget {
  final String? eventImageLink;
  final int eventId;
  final String eventName;
  final ImageDimensions? imageDimensions;
  const EventScreen({
    required this.eventImageLink,
    required this.eventId,
    required this.eventName,
    required this.imageDimensions,
  });

  @override
  State<StatefulWidget> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  int? _wikiRating;
  late Widget _wikiDetails;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<EventCubit>(context).loadEvent(widget.eventId);
    _scrollController = ScrollController();
    _wikiDetails = LoadingScreen();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EventCubit, EventState>(
      listener: (context, state) {
        if (state is EventLoadedState) {
          setState(() {
            _wikiRating = state.event.overallFollowers;
            _wikiDetails = _EventDetails(
              loadedEvent: state.event,
              unities: state.orgs,
              lineup: state.lineup,
              timetable: state.timetable,
            );
          });
        } else if (state is EventLoadingState) {
          setState(() {
            _wikiRating = null;
            _wikiDetails = LoadingScreen();
          });
        }
      },
      child: WikiCanvas(
        scrollController: _scrollController,
        wikiDetails: _wikiDetails,
        imageDimensions: widget.imageDimensions,
        isBackButtonOn: true,
        wikiData: WikiDataDto(
          id: widget.eventId,
          name: widget.eventName,
          imageLink: widget.eventImageLink,
          overallFollowers: _wikiRating,
          type: WikiFollowableType.EVENT,
        ),
      ),
    );
  }
}

class _EventDetails extends StatelessWidget {
  final EventFull loadedEvent;
  final List<UnityShort> unities;
  final List<ArtistShort> lineup;
  final List<TimetableForSceneDto> timetable;

  const _EventDetails({
    Key? key,
    required this.loadedEvent,
    required this.unities,
    required this.lineup,
    required this.timetable,
  }) : super(key: key);

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
                      loadedEvent.ticketsLink != null &&
                              loadedEvent.ticketsLink!.length > 3
                          ? OpenLinkService.openUrl(loadedEvent.ticketsLink!)
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
                    loadedEvent.status.getStatusName(context),
                    style: MyTextStyles.body,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  EventStatusIndicator(loadedEvent.status),
                ],
              ),
              AppLocalizations.of(context)!.wikiEventPrice: Text(
                FormattingUtils.resolveTicketsPrice(
                  context: context,
                  priceRangeOfTickets: loadedEvent.priceRangeOfTickets,
                ),
                style: MyTextStyles.body,
              ),
              AppLocalizations.of(context)!.wikiEventStart: Text(
                FormattingUtils.getFormattedDateAndTime(
                  context: context,
                  dateTime: loadedEvent.startDateTime,
                ),
                style: MyTextStyles.body,
              ),
              AppLocalizations.of(context)!.wikiEventEnd: Text(
                FormattingUtils.getFormattedDateAndTime(
                  context: context,
                  dateTime: loadedEvent.endDateTime,
                ),
                style: MyTextStyles.body,
              ),
            },
          ),
          SizedBox(height: 15),
          loadedEvent.about == null
              ? Container()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WikiExpandableTextDescription(
                      loadedEvent.about!,
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
            entity: loadedEvent.place,
            onItemTap:
                (context, PlaceShort entity, ImageDimensions? imageDimensions) =>
                    NavigatorFunctions.pushPlace(
              context: context,
              id: entity.id,
              name: entity.name,
              country: entity.country,
              imageLink: entity.imageLink,
              imageDimensions: imageDimensions,
            ),
          ),
          SectionSpacer(),
          unities.isEmpty
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
                      entityList: unities,
                      onItemTap: (context, UnityShort entity,
                              ImageDimensions? imageDimensions) =>
                          NavigatorFunctions.pushUnity(
                        context: context,
                        id: entity.id,
                        name: entity.name,
                        country: entity.country,
                        imageLink: entity.imageLink,
                        imageDimensions: imageDimensions,
                      ),
                    ),
                    SectionSpacer(),
                  ],
                ),
          lineup.isEmpty
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
                    timetable.isEmpty
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
                              eventId: loadedEvent.id,
                              eventName: loadedEvent.name,
                              timetableDto: timetable,
                            ),
                            verticalPadding:
                                MyConstants.ratingEntityVerticalPadding,
                          ),
                    RatingEntityList(
                      entityList: lineup,
                      onItemTap: (context, ArtistShort entity,
                              ImageDimensions? imageDimensions) =>
                          NavigatorFunctions.pushArtist(
                        context: context,
                        id: entity.id,
                        name: entity.name,
                        country: entity.country,
                        imageLink: entity.imageLink,
                        imageDimensions: imageDimensions,
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
