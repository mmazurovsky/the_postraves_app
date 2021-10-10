import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/loading_container.dart';
import 'package:the_postraves_app/src/features/wiki/state/follow_cubit/follow_cubit.dart';
import 'package:the_postraves_app/src/features/wiki/ui/screens/followable_screen.dart';
import 'package:the_postraves_app/src/features/wiki/ui/widgets/followable_util.dart';
import 'package:the_postraves_app/src/features/wiki/ui/widgets/wiki_subtitle.dart';
import 'package:the_postraves_app/src/features/wiki/ui/widgets/wiki_title.dart';
import 'package:the_postraves_app/src/models/dto/wiki_data_dto.dart';
import 'package:the_postraves_app/src/models/fulls/artist_full.dart';
import 'package:the_postraves_app/src/models/interfaces/data_interfaces.dart';

import '../../../../core/presentation/widgets/entity_presentation/rating_entity_list.dart';
import '../../../../core/presentation/widgets/my_horizontal_padding.dart';
import '../../../../core/presentation/widgets/section_divider.dart';
import '../../../../core/presentation/widgets/section_spacer.dart';
import '../../../../core/presentation/widgets/section_title.dart';
import '../../../../core/presentation/widgets/social_links_list.dart';
import '../../../../models/dto/image_dimensions.dart';
import '../../../../models/enum/wiki_rating_type.dart';
import '../../../../models/shorts/event_short.dart';
import '../../../../models/shorts/unity_short.dart';
import '../../../../my_navigation.dart';
import '../../state/artist_cubit/artist_cubit.dart';
import '../widgets/column_of_custom_cards.dart';
import '../widgets/short_event_card_item.dart';
import '../widgets/slide_animation_wrapper.dart';
import '../widgets/wiki_expandable_text_description.dart';
import '../widgets/wiki_wide_bookmark_button.dart';

class ArtistScreen extends StatelessWidget {
  final WikiDataDto _wikiDataDto;
  const ArtistScreen(
    this._wikiDataDto, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FollowableScreen<ArtistCubit, FollowCubit<ArtistFull>>(
      _wikiDataDto,
      _ArtistStateManagement(_wikiDataDto),
    );
  }
}

class _ArtistStateManagement extends StatefulWidget {
  final WikiDataDto _wikiDataDto;
  const _ArtistStateManagement(this._wikiDataDto, {Key? key}) : super(key: key);

  @override
  State<_ArtistStateManagement> createState() => _ArtistStateManagementState();
}

class _ArtistStateManagementState extends State<_ArtistStateManagement> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ArtistCubit>(context).loadArtist(widget._wikiDataDto.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArtistCubit, ArtistState>(
      listener: (context, state) {
        if (state is ArtistLoadedState) {
          context.read<FollowCubit<ArtistFull>>().defineFollowState(
                state.artist.overallFollowers,
                state.artist.isFollowed,
              );
        }
      },
      builder: (context, state) {
        if (state is ArtistLoadedState) {
          return _ArtistContent(
            artist: state.artist,
            unities: state.unities,
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

class _ArtistContent extends StatefulWidget {
  final ArtistFull artist;
  final List<UnityShort> unities;
  final List<EventShort> events;
  final void Function<T extends GeneralFollowableInterface>(BuildContext, T)
      onIsFollowedChange;
  const _ArtistContent({
    required this.artist,
    required this.unities,
    required this.events,
    required this.onIsFollowedChange,
    Key? key,
  }) : super(key: key);

  @override
  State<_ArtistContent> createState() => _ArtistContentState();
}

class _ArtistContentState extends State<_ArtistContent> {
  late bool _isFollowed;

  @override
  void didChangeDependencies() {
    _isFollowed = context.watch<FollowCubit<ArtistFull>>().state.isFollowed!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SlideAnimationWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: MyHorizontalPadding(
                  child: WikiWideBookmarkButton(
                    isFollowed: _isFollowed,
                    onButtonTap: () =>
                        widget.onIsFollowedChange(context, widget.artist),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          SectionDivider(needHorizontalMargin: true),
          SocialLinksList(
            soundcloudUsername: widget.artist.soundcloudUsername,
            instagramUsername: widget.artist.instagramUsername,
          ),
          widget.artist.about == null
              ? Container()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionSpacer(),
                    WikiExpandableTextDescription(
                      widget.artist.about!,
                    ),
                    SectionSpacer(),
                    SectionDivider(needHorizontalMargin: true),
                  ],
                ),
          widget.unities.isEmpty
              ? Container()
              : Column(
                  children: [
                    SectionSpacer(),
                    SectionTitle(
                        sectionTitle: AppLocalizations.of(context)!
                            .unityEntityNamePlural),
                    SizedBox(height: 8),
                    RatingEntityList<UnityShort>(
                      entityList: widget.unities,
                      onItemTap: (BuildContext context, UnityShort entity,
                              ImageDimensions? imageDimensions) =>
                          NavigatorFunctions.pushFollowable(
                        context: context,
                        wikiDataDto:
                            entity.convertToWikiDataDto(imageDimensions),
                      ),
                    ),
                    SectionSpacer(),
                    SectionDivider(needHorizontalMargin: true),
                  ],
                ),
          widget.events.isEmpty
              ? Container()
              : Column(
                  children: [
                    SectionSpacer(),
                    SectionTitle(
                        sectionTitle:
                            AppLocalizations.of(context)!.wikiUpcomingEvents),
                    SizedBox(height: 8),
                    ColumnOfCustomCards(
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
