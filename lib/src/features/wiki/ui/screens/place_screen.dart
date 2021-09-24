import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_static_maps_controller/google_static_maps_controller.dart';
import 'package:ionicons/ionicons.dart';
import '../../state/place_cubit/place_cubit.dart';
import '../../../../models/enum/wiki_rating_type.dart';
import '../../../../models/fulls/place_full.dart';
import '../../../../models/geo/country.dart';
import '../../../../models/related_to_place/scene.dart';
import '../../../../models/shorts/event_short.dart';
import '../../../../core/presentation/widgets/loading_screen.dart';
import '../../../../core/presentation/widgets/my_horizontal_margin.dart';
import '../../../../core/presentation/widgets/section_title.dart';
import '../../../../core/presentation/widgets/social_links_list.dart';
import '../../../../core/utils/image_dimensions.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_constants.dart';
import '../../dto/wiki_data_dto.dart';
import '../widgets/address_section.dart';
import '../widgets/external_map_launcher.dart';
import '../widgets/column_of_custom_cards.dart';
import '../widgets/scene_card_for_event.dart';
import '../widgets/short_event_card_item.dart';
import 'wiki_screen.dart';
import '../widgets/slide_animation_wrapper.dart';
import '../../../../core/presentation/widgets/my_horizontal_padding.dart';
import '../../../../core/presentation/widgets/section_divider.dart';
import '../../../../core/presentation/widgets/section_spacer.dart';
import '../widgets/wiki_expandable_text_description.dart';
import '../widgets/wiki_wide_bookmark_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PlaceScreen extends StatefulWidget {
  final int placeId;
  final String placeName;
  final Country country;
  final String? placeImageLink;
  final ImageDimensions? imageDimensions;

  const PlaceScreen({
    required this.placeId,
    required this.placeName,
    required this.country,
    required this.placeImageLink,
    required this.imageDimensions,
  });

  @override
  State<StatefulWidget> createState() => _PlaceScreenState();
}

class _PlaceScreenState extends State<PlaceScreen>
    with SingleTickerProviderStateMixin {
  static late String _wikiType;
  int? _wikiRating;
  late Widget _wikiDetails;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PlaceCubit>(context).loadPlace(widget.placeId);
    _scrollController = ScrollController();
    _wikiDetails = LoadingScreen();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _wikiType = AppLocalizations.of(context)!.placeEntityNameSingular;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PlaceCubit, PlaceState>(
      listener: (context, state) {
        if (state is PlaceLoadedState) {
          setState(() {
            _wikiRating = state.place.overallFollowers;
            _wikiDetails = _PlaceDetails(
                loadedPlace: state.place,
                events: state.events,
                scenes: state.scenes);
          });
        } else if (state is PlaceLoadedState) {
          setState(() {
            _wikiRating = null;
            _wikiDetails = LoadingScreen();
          });
        }
      },
      child: WikiScreen(
        wikiType: _wikiType,
        scrollController: _scrollController,
        wikiDetails: _wikiDetails,
        imageDimensions: widget.imageDimensions,
        isBackButtonOn: true,
        wikiData: WikiDataDto(
          name: widget.placeName,
          imageLink: widget.placeImageLink,
          country: widget.country,
          overallFollowers: _wikiRating,
          id: widget.placeId,
          type: WikiFollowableType.PLACE,
        ),
      ),
    );
  }
}

class _PlaceDetails extends StatelessWidget {
  final PlaceFull loadedPlace;
  final List<Scene> scenes;
  final List<EventShort> events;
  const _PlaceDetails({
    Key? key,
    required this.loadedPlace,
    required this.scenes,
    required this.events,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideAnimationWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: MyHorizontalPadding(
                  child: WikiWideBookmarkButton(
                    iconWidget: Icon(Ionicons.bookmark,
                        size: 20, color: MyColors.mainOppositeColor),
                    buttonText: AppLocalizations.of(context)!.wikiFollow,
                    // todo
                    onButtonTap: () {},
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          SectionDivider(needHorizontalMargin: true),
          SocialLinksList(
            soundcloudLink: loadedPlace.soundcloudLink,
            instagramLink: loadedPlace.instagramLink,
          ),
          SectionSpacer(),
          SectionTitle(
              sectionTitle: AppLocalizations.of(context)!.wikiPlaceCoordinates),
          SizedBox(height: 12),
          InkWell(
            onTap: () => showModalBottomSheet(
              context: context,
              builder: (context) => ExternalMapLauncher(
                coordinate: loadedPlace.coordinate,
                placeName: loadedPlace.name,
              ),
            ),
            child: MyHorizontalMargin(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: ClipRect(
                  child: Align(
                    alignment: Alignment.topCenter,
                    heightFactor: 0.88,
                    child: StaticMap(
                      googleApiKey: MyConstants.googleApiKey,
                      language: 'english',
                      height: 190,
                      mapId: MyConstants.googleMapId,
                      zoom: 14,
                      markers: [
                        Marker(
                          color: MyColors.accent,
                          label: 'A',
                          locations: [
                            Location(
                              loadedPlace.coordinate.latitude,
                              loadedPlace.coordinate.longitude,
                            ),
                          ],
                        ),
                        //todo
                        //         Marker.custom(
                        //   anchor: MarkerAnchor.bottom,
                        //   icon: "https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/285/round-pushpin_1f4cd.png",
                        //   locations: [
                        //     Location(
                        //               loadedPlace.coordinate.latitude,
                        //               loadedPlace.coordinate.longitude,
                        //             ),
                        //   ],
                        // )
                      ],
                      center: Location(
                        loadedPlace.coordinate.latitude,
                        loadedPlace.coordinate.longitude,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          AddressSection(
            cityName: loadedPlace.city.localizedName,
            streetAddress: loadedPlace.streetAddress,
          ),
          SectionSpacer(),
          SectionDivider(needHorizontalMargin: true),
          SectionSpacer(),
          loadedPlace.about == null
              ? Container()
              : Column(
                  children: [
                    WikiExpandableTextDescription(
                      loadedPlace.about!,
                    ),
                    SectionSpacer(),
                    SectionDivider(needHorizontalMargin: true),
                    SectionSpacer(),
                  ],
                ),
          events.isEmpty
              ? Container()
              : Column(
                  children: [
                    SectionTitle(
                        sectionTitle:
                            AppLocalizations.of(context)!.wikiUpcomingEvents),
                    SizedBox(height: 8),
                    ColumnOfCustomCards<EventShort>(
                      entities: events,
                      buildCard: (EventShort event) =>
                          ShortEventCardItem(event),
                    ),
                    SectionSpacer(),
                  ],
                ),
          scenes.isEmpty
              ? Container()
              : Column(
                  children: [
                    SectionDivider(needHorizontalMargin: true),
                    SectionSpacer(),
                    SectionTitle(
                      sectionTitle: AppLocalizations.of(context)!.scenes,
                    ),
                    SizedBox(height: 8),
                    ColumnOfCustomCards<Scene>(
                      entities: scenes,
                      buildCard: (Scene scene) => SceneCardForEvent(scene),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
