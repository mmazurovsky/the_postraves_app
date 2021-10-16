import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/presentation/widgets/entity_presentation/followable_list.dart';
import '../../../../core/presentation/widgets/loading_container.dart';
import '../../state/follow_cubit/follow_cubit.dart';
import 'followable_screen.dart';
import '../widgets/about_section.dart';
import '../widgets/followable_list_section.dart';
import '../widgets/followable_util.dart';
import '../widgets/upcoming_events_section.dart';
import '../widgets/wiki_subtitle.dart';
import '../widgets/wiki_title.dart';
import '../../../../models/dto/wiki_data_dto.dart';
import '../../../../models/fulls/artist_full.dart';
import '../../../../models/interfaces/data_interfaces.dart';

import '../../../../core/presentation/widgets/entity_presentation/rating_entity_list.dart';
import '../../../../core/presentation/widgets/my_horizontal_padding.dart';
import '../../../../core/presentation/widgets/section_divider.dart';
import '../../../../core/presentation/widgets/my_spacers.dart';
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
          const MyBigSpacer(),
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
          SocialLinksList(
            soundcloudUsername: widget.artist.soundcloudUsername,
            instagramUsername: widget.artist.instagramUsername,
          ),
          AboutSection(widget.artist.about),
          FollowableListSection(
            AppLocalizations.of(context)!.unityEntityNamePlural,
            widget.unities,
          ),
          UpcomingEventsSection(widget.events),
        ],
      ),
    );
  }
}
