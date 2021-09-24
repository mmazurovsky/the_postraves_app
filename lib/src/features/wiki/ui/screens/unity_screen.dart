import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import '../../state/unity_cubit/unity_cubit.dart';
import '../../../../models/enum/wiki_rating_type.dart';
import '../../../../models/fulls/unity_full.dart';
import '../../../../models/geo/country.dart';
import '../../../../models/shorts/artist_short.dart';
import '../../../../models/shorts/event_short.dart';
import '../../../../core/presentation/widgets/entity_presentation/rating_entity_list.dart';
import '../../../../core/presentation/widgets/loading_screen.dart';
import '../../../../core/presentation/widgets/social_links_list.dart';
import '../../../../core/utils/image_dimensions.dart';
import '../../../../core/utils/my_colors.dart';
import '../../dto/wiki_data_dto.dart';
import '../widgets/short_event_card_item.dart';
import 'wiki_screen.dart';
import '../widgets/slide_animation_wrapper.dart';
import '../../../../core/presentation/widgets/my_horizontal_padding.dart';
import '../../../../my_navigation.dart';
import '../../../../core/presentation/widgets/section_divider.dart';
import '../../../../core/presentation/widgets/section_spacer.dart';
import '../../../../core/presentation/widgets/section_title.dart';
import '../widgets/column_of_custom_cards.dart';
import '../widgets/wiki_expandable_text_description.dart';
import '../widgets/wiki_wide_bookmark_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UnityScreen extends StatefulWidget {
  final int unityId;
  final String unityName;
  final Country country;
  final String? unityImageLink;
  final ImageDimensions? imageDimensions;

  const UnityScreen({
    required this.unityId,
    required this.unityName,
    required this.country,
    required this.unityImageLink,
    required this.imageDimensions,
  });

  @override
  State<StatefulWidget> createState() => _UnityScreenState();
}

class _UnityScreenState extends State<UnityScreen>
    with SingleTickerProviderStateMixin {
  static late String _wikiType;
  int? _wikiRating;
  late Widget _wikiDetails;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<UnityCubit>(context).loadUnity(widget.unityId);
    _scrollController = ScrollController();
    _wikiDetails = LoadingScreen();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _wikiType = AppLocalizations.of(context)!.unityEntityNameSingular;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UnityCubit, UnityState>(
      listener: (context, state) {
        if (state is UnityLoadedState) {
          setState(() {
            _wikiRating = state.unity.overallFollowers;
            _wikiDetails = _UnityDetails(
              loadedUnity: state.unity,
              events: state.events,
              artists: state.artists,
            );
          });
        } else if (state is UnityLoadingState) {
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
          name: widget.unityName,
          imageLink: widget.unityImageLink,
          overallFollowers: _wikiRating,
          id: widget.unityId,
          country: widget.country,
          type: WikiFollowableType.UNITY,
        ),
      ),
    );
  }
}

class _UnityDetails extends StatelessWidget {
  final UnityFull loadedUnity;
  final List<ArtistShort> artists;
  final List<EventShort> events;
  const _UnityDetails({
    Key? key,
    required this.loadedUnity,
    required this.artists,
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
            soundcloudLink: loadedUnity.soundcloudLink,
            bandcampLink: loadedUnity.bandcampLink,
            instagramLink: loadedUnity.instagramLink,
          ),
          SectionSpacer(),
          loadedUnity.about == null
              ? Container()
              : Column(
                  children: [
                    WikiExpandableTextDescription(
                      loadedUnity.about!,
                    ),
                    SectionSpacer(),
                    SectionDivider(needHorizontalMargin: true),
                    SectionSpacer(),
                  ],
                ),
          artists.isEmpty
              ? Container()
              : Column(
                  children: [
                    SectionTitle(
                        sectionTitle: AppLocalizations.of(context)!
                            .artistEntityNamePlural),
                    SizedBox(height: 8),
                    RatingEntityList<ArtistShort>(
                      entityList: artists,
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
          events.isEmpty
              ? Container()
              : Column(
                  children: [
                    SectionDivider(needHorizontalMargin: true),
                    SectionSpacer(),
                    SectionTitle(
                        sectionTitle:
                            AppLocalizations.of(context)!.wikiUpcomingEvents),
                    SizedBox(height: 8),
                    ColumnOfCustomCards(
                      entities: events,
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
