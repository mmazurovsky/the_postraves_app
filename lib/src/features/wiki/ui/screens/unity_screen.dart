import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_postraves_app/src/features/wiki/state/follow_cubit/follow_cubit.dart';
import 'package:the_postraves_app/src/features/wiki/ui/widgets/followable_util.dart';
import 'package:the_postraves_app/src/models/dto/wiki_data_dto.dart';
import 'package:the_postraves_app/src/models/interfaces/data_interfaces.dart';
import '../../state/unity_cubit/unity_cubit.dart';
import '../../../../models/fulls/unity_full.dart';
import '../../../../models/shorts/artist_short.dart';
import '../../../../models/shorts/event_short.dart';
import '../../../../core/presentation/widgets/entity_presentation/rating_entity_list.dart';
import '../../../../core/presentation/widgets/loading_container.dart';
import '../../../../core/presentation/widgets/social_links_list.dart';
import '../../../../models/dto/image_dimensions.dart';
import '../widgets/short_event_card_item.dart';
import 'followable_screen.dart';
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

class UnityScreen extends StatelessWidget {
  final WikiDataDto _wikiDataDto;

  const UnityScreen(this._wikiDataDto, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FollowableScreen<UnityCubit, FollowCubit<UnityFull>>(
      _wikiDataDto,
      _UnityStateManagement(_wikiDataDto),
    );
  }
}

class _UnityStateManagement extends StatefulWidget {
  final WikiDataDto _wikiDataDto;
  const _UnityStateManagement(this._wikiDataDto, {Key? key}) : super(key: key);

  @override
  State<_UnityStateManagement> createState() => _UnityStateManagementState();
}

class _UnityStateManagementState extends State<_UnityStateManagement> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UnityCubit>(context).loadUnity(widget._wikiDataDto.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UnityCubit, UnityState>(
      listener: (context, state) {
        if (state is UnityLoadedState) {
          context.read<FollowCubit<UnityFull>>().defineFollowState(
                state.unity.overallFollowers,
                state.unity.isFollowed,
              );
        }
      },
      builder: (context, state) {
        if (state is UnityLoadedState) {
          return _UnityContent(
            unity: state.unity,
            artists: state.artists,
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

class _UnityContent extends StatefulWidget {
  final UnityFull unity;
  final List<ArtistShort> artists;
  final List<EventShort> events;
  final void Function<T extends GeneralFollowableInterface>(BuildContext, T)
      onIsFollowedChange;

  const _UnityContent({
    Key? key,
    required this.unity,
    required this.artists,
    required this.events,
    required this.onIsFollowedChange,
  }) : super(key: key);

  @override
  State<_UnityContent> createState() => _UnityContentState();
}

class _UnityContentState extends State<_UnityContent> {
  late bool _isFollowed;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _isFollowed = context.watch<FollowCubit<UnityFull>>().state.isFollowed!;
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
                        widget.onIsFollowedChange(context, widget.unity),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          SectionDivider(needHorizontalMargin: true),
          SocialLinksList(
            soundcloudUsername: widget.unity.soundcloudUsername,
            bandcampUsername: widget.unity.bandcampUsername,
            instagramUsername: widget.unity.instagramUsername,
          ),
          SectionSpacer(),
          widget.unity.about == null
              ? Container()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WikiExpandableTextDescription(
                      widget.unity.about!,
                    ),
                    SectionSpacer(),
                    SectionDivider(needHorizontalMargin: true),
                    SectionSpacer(),
                  ],
                ),
          widget.artists.isEmpty
              ? Container()
              : Column(
                  children: [
                    SectionTitle(
                        sectionTitle: AppLocalizations.of(context)!
                            .artistEntityNamePlural),
                    SizedBox(height: 8),
                    RatingEntityList<ArtistShort>(
                      entityList: widget.artists,
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
          widget.events.isEmpty
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
