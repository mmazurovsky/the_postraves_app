import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_static_maps_controller/google_static_maps_controller.dart';
import 'package:ionicons/ionicons.dart';
import 'package:the_postraves_app/src/core/authentication/state/cubit/authentication_cubit.dart';
import 'package:the_postraves_app/src/features/wiki/state/follow_cubit/follow_cubit.dart';
import 'package:the_postraves_app/src/features/wiki/ui/widgets/followable_util.dart';
import 'package:the_postraves_app/src/features/wiki/ui/widgets/wiki_subtitle.dart';
import 'package:the_postraves_app/src/features/wiki/ui/widgets/wiki_title.dart';
import 'package:the_postraves_app/src/models/dto/wiki_data_dto.dart';
import 'package:the_postraves_app/src/models/fulls/artist_full.dart';
import 'package:the_postraves_app/src/models/interfaces/data_interfaces.dart';
import '../../../../my_navigation.dart';
import '../../state/place_cubit/place_cubit.dart';
import '../../../../models/enum/wiki_rating_type.dart';
import '../../../../models/fulls/place_full.dart';
import '../../../../models/geo/country.dart';
import '../../../../models/related_to_place/scene.dart';
import '../../../../models/shorts/event_short.dart';
import '../../../../core/presentation/widgets/loading_container.dart';
import '../../../../core/presentation/widgets/my_horizontal_margin.dart';
import '../../../../core/presentation/widgets/section_title.dart';
import '../../../../core/presentation/widgets/social_links_list.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_constants.dart';
import '../widgets/address_section.dart';
import '../widgets/map_selector.dart';
import '../widgets/column_of_custom_cards.dart';
import '../widgets/short_event_card_item.dart';
import 'followable_screen.dart';
import 'wiki_canvas.dart';
import '../widgets/slide_animation_wrapper.dart';
import '../../../../core/presentation/widgets/my_horizontal_padding.dart';
import '../../../../core/presentation/widgets/section_divider.dart';
import '../../../../core/presentation/widgets/section_spacer.dart';
import '../widgets/wiki_expandable_text_description.dart';
import '../widgets/wiki_wide_bookmark_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PlaceScreen extends StatelessWidget {
  final WikiDataDto _wikiDataDto;

  const PlaceScreen(
    this._wikiDataDto, {
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FollowableScreen<PlaceCubit, FollowCubit<PlaceFull>>(
      _wikiDataDto,
      _PlaceStateManagement(_wikiDataDto),
    );
  }
}

class _PlaceStateManagement extends StatefulWidget {
  final WikiDataDto _wikiDataDto;
  const _PlaceStateManagement(this._wikiDataDto, {Key? key}) : super(key: key);

  @override
  State<_PlaceStateManagement> createState() => _PlaceStateManagementState();
}

class _PlaceStateManagementState extends State<_PlaceStateManagement> {
  @override
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PlaceCubit>(context).loadPlace(widget._wikiDataDto.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlaceCubit, PlaceState>(
      listener: (context, state) {
        if (state is PlaceLoadedState) {
          context.read<FollowCubit<PlaceFull>>().defineFollowState(
                state.place.overallFollowers,
                state.place.isFollowed,
              );
        }
      },
      builder: (context, state) {
        if (state is PlaceLoadedState) {
          return _PlaceContent(
            place: state.place,
            events: state.events,
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

class _PlaceContent extends StatefulWidget {
  final PlaceFull place;
  final List<EventShort> events;
  final void Function<T extends GeneralFollowableInterface>(BuildContext, T)
      onIsFollowedChange;
  const _PlaceContent({
    required this.place,
    required this.events,
    required this.onIsFollowedChange,
    Key? key,
  }) : super(key: key);

  @override
  State<_PlaceContent> createState() => _PlaceContentState();
}

class _PlaceContentState extends State<_PlaceContent> {
late bool _isFollowed;

  @override
  void didChangeDependencies() {
    _isFollowed = context.watch<FollowCubit<PlaceFull>>().state.isFollowed!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SlideAnimationWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: MyHorizontalPadding(
                  child: WikiWideBookmarkButton(
                    isFollowed: _isFollowed,
                    onButtonTap: () => widget.onIsFollowedChange(context, widget.place),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          const SectionDivider(needHorizontalMargin: true),
          SocialLinksList(
            soundcloudUsername: widget.place.soundcloudUsername,
            instagramUsername: widget.place.instagramUsername,
          ),
          const SectionSpacer(),
          SectionTitle(
              sectionTitle: AppLocalizations.of(context)!.wikiPlaceCoordinates),
          SizedBox(height: 12),
          InkWell(
            onTap: () => showModalBottomSheet(
              context: context,
              builder: (context) => MapSelector(
                coordinate: widget.place.coordinate,
                placeName: widget.place.name,
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
                              widget.place.coordinate.latitude,
                              widget.place.coordinate.longitude,
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
                        widget.place.coordinate.latitude,
                        widget.place.coordinate.longitude,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          AddressSection(
            cityName: widget.place.city.localName,
            streetAddress: widget.place.streetAddress,
          ),
          SectionSpacer(),
          SectionDivider(needHorizontalMargin: true),
          SectionSpacer(),
          widget.place.about == null
              ? Container()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WikiExpandableTextDescription(
                      widget.place.about!,
                    ),
                    SectionSpacer(),
                    SectionDivider(needHorizontalMargin: true),
                    SectionSpacer(),
                  ],
                ),
          widget.events.isEmpty
              ? Container()
              : Column(
                  children: [
                    SectionTitle(
                        sectionTitle:
                            AppLocalizations.of(context)!.wikiUpcomingEvents),
                    SizedBox(height: 8),
                    ColumnOfCustomCards<EventShort>(
                      entities: widget.events,
                      buildCard: (EventShort event) =>
                          ShortEventCardItem(event),
                    ),
                    SectionSpacer(),
                  ],
                ),
        ],
      ),
    );
  }
}
