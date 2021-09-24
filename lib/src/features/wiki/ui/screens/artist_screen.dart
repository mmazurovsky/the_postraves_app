import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../core/authentication/state/cubit/authentication_cubit.dart';
import '../../../../core/presentation/widgets/entity_presentation/rating_entity_list.dart';
import '../../../../core/presentation/widgets/loading_screen.dart';
import '../../../../core/presentation/widgets/my_horizontal_padding.dart';
import '../../../../core/presentation/widgets/section_divider.dart';
import '../../../../core/presentation/widgets/section_spacer.dart';
import '../../../../core/presentation/widgets/section_title.dart';
import '../../../../core/presentation/widgets/social_links_list.dart';
import '../../../../core/utils/image_dimensions.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../models/enum/wiki_rating_type.dart';
import '../../../../models/fulls/artist_full.dart';
import '../../../../models/geo/country.dart';
import '../../../../models/shorts/event_short.dart';
import '../../../../models/shorts/unity_short.dart';
import '../../../../my_navigation.dart';
import '../../dto/wiki_data_dto.dart';
import '../../state/artist_cubit/artist_cubit.dart';
import '../widgets/column_of_custom_cards.dart';
import '../widgets/short_event_card_item.dart';
import '../widgets/slide_animation_wrapper.dart';
import '../widgets/wiki_expandable_text_description.dart';
import '../widgets/wiki_wide_bookmark_button.dart';
import 'wiki_screen.dart';

class ArtistScreen extends StatefulWidget {
  final int artistId;
  final String artistName;
  final Country country;
  final String? artistImageLink;
  final ImageDimensions? imageDimensions;

  const ArtistScreen({
    required this.artistId,
    required this.artistName,
    required this.country,
    required this.artistImageLink,
    required this.imageDimensions,
  });

  @override
  State<StatefulWidget> createState() => _ArtistScreenState();
}

class _ArtistScreenState extends State<ArtistScreen>
    with SingleTickerProviderStateMixin {
  int? _wikiRating;
  static late String _wikiType;
  late Widget _wikiDetails;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ArtistCubit>(context).loadArtist(widget.artistId);
    _scrollController = ScrollController();
    _wikiDetails = LoadingScreen();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _wikiType = AppLocalizations.of(context)!.artistEntityNameSingular;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ArtistCubit, ArtistState>(
      listener: (context, state) {
        if (state is ArtistLoadedState) {
          setState(() {
            _wikiRating = state.artist.overallFollowers;
            _wikiDetails = _ArtistDetails(
              loadedArtist: state.artist,
              unities: state.unities,
              events: state.events,
            );
          });
        } else if (state is ArtistLoadingState) {
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
          id: widget.artistId,
          name: widget.artistName,
          imageLink: widget.artistImageLink,
          country: widget.country,
          overallFollowers: _wikiRating,
          type: WikiFollowableType.ARTIST,
        ),
      ),
    );
  }
}

class _ArtistDetails extends StatelessWidget {
  final ArtistFull loadedArtist;
  final List<UnityShort> unities;
  final List<EventShort> events;
  const _ArtistDetails({
    Key? key,
    required this.loadedArtist,
    required this.unities,
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
                    onButtonTap: () {
                      if (context.read<AuthenticationCubit>().state
                          is! AuthenticatedState) {
                        Navigator.of(context)
                            .pushNamed(MyNavigationRoutes.actionResolver);
                      }
                      // BlocProvider.of<FollowBloc<Artist>>(context)
                      //     .add(ToggleFollowEvent(loadedArtist)),
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          SectionDivider(needHorizontalMargin: true),
          SocialLinksList(
            soundcloudLink: loadedArtist.soundcloudLink,
            instagramLink: loadedArtist.instagramLink,
          ),
          loadedArtist.about == null
              ? Container()
              : Column(
                  children: [
                    SectionSpacer(),
                    WikiExpandableTextDescription(
                      loadedArtist.about!,
                    ),
                    SectionSpacer(),
                    SectionDivider(needHorizontalMargin: true),
                  ],
                ),
          unities.isEmpty
              ? Container()
              : Column(
                  children: [
                    SectionSpacer(),
                    SectionTitle(
                        sectionTitle: AppLocalizations.of(context)!
                            .unityEntityNamePlural),
                    SizedBox(height: 8),
                    RatingEntityList<UnityShort>(
                      entityList: unities,
                      onItemTap: (BuildContext context, UnityShort entity,
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
                    SectionDivider(needHorizontalMargin: true),
                  ],
                ),
          events.isEmpty
              ? Container()
              : Column(
                  children: [
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
