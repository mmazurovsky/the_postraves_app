import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:the_postraves_package/dto/followable_data.dart';
import 'package:the_postraves_package/dto/followable_params.dart';
import 'package:the_postraves_package/models/fulls/unity_full.dart';
import 'package:the_postraves_package/models/shorts/artist_short.dart';
import 'package:the_postraves_package/models/shorts/event_short.dart';
import 'package:the_postraves_package/models/shorts/unity_short.dart';

import '../../../../common/widgets/animations/wrappers.dart';
import '../../../../common/widgets/other/loading_container.dart';
import '../../../../common/widgets/other/social_links_list.dart';
import '../../../../common/widgets/spacers/my_horizontal_padding.dart';
import '../../../../common/widgets/spacers/my_spacers.dart';
import '../../state/followable_change_notifier.dart';
import '../../state/unity_cubit/unity_cubit.dart';
import '../widgets/about_section.dart';
import '../widgets/followable_list_section.dart';
import '../widgets/followable_util.dart';
import '../widgets/upcoming_events_section.dart';
import '../widgets/wiki_wide_bookmark_button.dart';
import 'followable_screen.dart';

class UnityScreen extends StatelessWidget {
  final FollowableData _followableData;

  const UnityScreen(this._followableData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FollowableScreen<UnityCubit>(
      _followableData,
      _UnityStateManagement(_followableData),
    );
  }
}

class _UnityStateManagement extends StatefulWidget {
  final FollowableData _followableData;
  const _UnityStateManagement(this._followableData, {Key? key})
      : super(key: key);

  @override
  State<_UnityStateManagement> createState() => _UnityStateManagementState();
}

class _UnityStateManagementState extends State<_UnityStateManagement> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UnityCubit>(context).loadUnity(widget._followableData.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UnityCubit, UnityState>(
      builder: (context, state) {
        if (state is UnityLoadedState) {
          return _UnityContent(
            unity: state.unity,
            artists: state.artists,
            events: state.events,
          );
        } else {
          return const LoadingContainer();
          // TODO Exception
        }
      },
    );
  }
}

class _UnityContent extends StatelessWidget {
  final UnityFull unity;
  final List<ArtistShort> artists;
  final List<EventShort> events;

  const _UnityContent({
    Key? key,
    required this.unity,
    required this.artists,
    required this.events,
  }) : super(key: key);

//   @override
//   State<_UnityContent> createState() => _UnityContentState();
// }

// class _UnityContentState extends State<_UnityContent> {
//   late FollowableVariables _followableVariables;

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     _followableVariables = context
//             .watch<FollowableVariablesService>()
//             .get(widget.unity.followableId) ??
//         widget.unity.followableVariables;
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
                  .get(unity.newFollowableId),
              builder: (context, _) {
                final variables = context.watch<FollowableVariables>();
                return WikiWideBookmarkButton(
                  isFollowed: variables.isFollowed,
                  overallFollowers: variables.overallFollowers,
                  onIsFollowedChange: () =>
                      FollowableUtil.onIsFollowedChange<UnityFull, UnityShort>(
                    context,
                    unity,
                  ),
                );
              },
            ),
          ),
          SocialLinksList(
            soundcloudUsername: unity.soundcloudUsername,
            bandcampUsername: unity.bandcampUsername,
            instagramUsername: unity.instagramUsername,
          ),
          AboutSection(unity.about),
          FollowableListSection(
            'artistEntityNamePlural'.tr(),
            artists,
          ),
          UpcomingEventsSection(events),
        ],
      ),
    );
  }
}
