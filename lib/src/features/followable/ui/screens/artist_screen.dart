import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:the_postraves_app/src/features/followable/state/followable_change_notifier.dart';
import 'package:the_postraves_package/dto/followable_params.dart';
import '../../../../common/widgets/animations/wrappers.dart';

import 'package:the_postraves_package/dto/followable_data.dart';
import 'package:the_postraves_package/models/fulls/artist_full.dart';
import 'package:the_postraves_package/models/shorts/artist_short.dart';
import 'package:the_postraves_package/models/shorts/event_short.dart';
import 'package:the_postraves_package/models/shorts/unity_short.dart';
import '../../../../common/widgets/other/loading_container.dart';
import '../../../../common/widgets/other/social_links_list.dart';
import '../../../../common/widgets/spacers/my_horizontal_padding.dart';
import '../../../../common/widgets/spacers/my_spacers.dart';
import '../../state/artist_cubit/artist_cubit.dart';
import '../widgets/about_section.dart';
import '../widgets/followable_list_section.dart';
import '../widgets/followable_util.dart';
import '../widgets/upcoming_events_section.dart';
import '../widgets/wiki_wide_bookmark_button.dart';
import 'followable_screen.dart';

class ArtistScreen extends StatelessWidget {
  final FollowableData _followableData;
  const ArtistScreen(
    this._followableData, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FollowableScreen<ArtistCubit>(
      _followableData,
      _ArtistStateManagement(_followableData),
    );
  }
}

class _ArtistStateManagement extends StatefulWidget {
  final FollowableData _followableData;
  const _ArtistStateManagement(this._followableData, {Key? key})
      : super(key: key);

  @override
  State<_ArtistStateManagement> createState() => _ArtistStateManagementState();
}

class _ArtistStateManagementState extends State<_ArtistStateManagement> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ArtistCubit>(context).loadArtist(widget._followableData.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArtistCubit, ArtistState>(
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

class _ArtistContent extends StatelessWidget {
  final ArtistFull artist;
  final List<UnityShort> unities;
  final List<EventShort> events;
  const _ArtistContent({
    required this.artist,
    required this.unities,
    required this.events,
    Key? key,
  }) : super(key: key);

//   @override
//   State<_ArtistContent> createState() => _ArtistContentState();
// }

// class _ArtistContentState extends State<_ArtistContent> {
//   late FollowableVariables _followableVariables;

//   @override
//   void didChangeDependencies() {
//     _followableVariables = context
//             .watch<FollowableVariablesService>()
//             .get(widget.artist.followableId) ??
//         widget.artist.followableVariables;

//     super.didChangeDependencies();
//   }

  @override
  Widget build(BuildContext context) {
    return SlideAnimationWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MyBigSpacer(),
          MyHorizontalPadding(
            child: ChangeNotifierProvider.value(
              value: context
                  .read<FollowableVariablesService>()
                  .get(artist.newFollowableId),
              builder: (context, _) {
                final variables = context.watch<FollowableVariables>();
                return WikiWideBookmarkButton(
                  isFollowed: variables.isFollowed,
                  overallFollowers: variables.overallFollowers,
                  onIsFollowedChange: () => FollowableUtil.onIsFollowedChange<
                      ArtistFull, ArtistShort>(context, artist),
                );
              },
            ),
          ),
          SocialLinksList(
            soundcloudUsername: artist.soundcloudUsername,
            instagramUsername: artist.instagramUsername,
          ),
          AboutSection(artist.about),
          FollowableListSection(
            'unityEntityNamePlural'.tr(),
            unities,
          ),
          UpcomingEventsSection(events),
        ],
      ),
    );
  }
}
