import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:the_postraves_package/dto/followable_data.dart';
import 'package:the_postraves_package/models/fulls/artist_full.dart';
import 'package:the_postraves_package/models/shorts/event_short.dart';
import 'package:the_postraves_package/models/shorts/unity_short.dart';
import '../../../../common/widgets/other/loading_container.dart';
import '../../../../common/widgets/other/social_links_list.dart';
import '../../../../common/widgets/spacers/my_horizontal_padding.dart';
import '../../../../common/widgets/spacers/my_spacers.dart';
import '../../state/artist_cubit/artist_cubit.dart';
import '../../state/follow_cubit/follow_cubit.dart';
import '../widgets/about_section.dart';
import '../widgets/followable_list_section.dart';
import '../widgets/followable_util.dart';
import '../widgets/slide_animation_wrapper.dart';
import '../widgets/upcoming_events_section.dart';
import '../widgets/wiki_wide_bookmark_button.dart';
import 'followable_screen.dart';

class ArtistScreen extends StatelessWidget {
  final FollowableData _FollowableData;
  const ArtistScreen(
    this._FollowableData, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FollowableScreen<ArtistCubit, FollowCubit<ArtistFull>>(
      _FollowableData,
      _ArtistStateManagement(_FollowableData),
    );
  }
}

class _ArtistStateManagement extends StatefulWidget {
  final FollowableData _FollowableData;
  const _ArtistStateManagement(this._FollowableData, {Key? key})
      : super(key: key);

  @override
  State<_ArtistStateManagement> createState() => _ArtistStateManagementState();
}

class _ArtistStateManagementState extends State<_ArtistStateManagement> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ArtistCubit>(context).loadArtist(widget._FollowableData.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArtistCubit, ArtistState>(
      listener: (context, state) {
        if (state is ArtistLoadedState) {
          context.read<FollowCubit<ArtistFull>>().defineFollowState(
                weeklyFollowers: state.artist.weeklyFollowers,
                overallFollowers: state.artist.overallFollowers,
                isFollowed: state.artist.isFollowed,
              );
        }
      },
      builder: (context, state) {
        if (state is ArtistLoadedState) {
          return _ArtistContent(
            artist: state.artist,
            unities: state.unities,
            events: state.events,
          );
        } else {
          return LoadingContainer();
          // TODO Exception
        }
      },
    );
  }
}

class _ArtistContent extends StatefulWidget {
  final ArtistFull artist;
  final List<UnityShort> unities;
  final List<EventShort> events;
  const _ArtistContent({
    required this.artist,
    required this.unities,
    required this.events,
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
          MyHorizontalPadding(
            child: WikiWideBookmarkButton(
              isFollowed: _isFollowed,
              onIsFollowedChange: () =>
                  FollowableUtil.onIsFollowedChange(context, widget.artist),
            ),
          ),
          SocialLinksList(
            soundcloudUsername: widget.artist.soundcloudUsername,
            instagramUsername: widget.artist.instagramUsername,
          ),
          AboutSection(widget.artist.about),
          FollowableListSection(
            'unityEntityNamePlural'.tr(),
            widget.unities,
          ),
          UpcomingEventsSection(widget.events),
        ],
      ),
    );
  }
}
