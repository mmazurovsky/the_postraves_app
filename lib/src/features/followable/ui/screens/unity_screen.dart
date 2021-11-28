import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:the_postraves_package/dto/followable_data.dart';
import 'package:the_postraves_package/models/fulls/unity_full.dart';
import 'package:the_postraves_package/models/interfaces/data_interfaces.dart';
import 'package:the_postraves_package/models/shorts/artist_short.dart';
import 'package:the_postraves_package/models/shorts/event_short.dart';
import 'package:the_postraves_package/models/shorts/unity_short.dart';
import '../../../../common/widgets/other/loading_container.dart';
import '../../../../common/widgets/other/social_links_list.dart';
import '../../../../common/widgets/spacers/my_horizontal_padding.dart';
import '../../../../common/widgets/spacers/my_spacers.dart';
import '../../state/follow_cubit/follow_cubit.dart';
import '../../state/unity_cubit/unity_cubit.dart';
import '../widgets/about_section.dart';
import '../widgets/followable_list_section.dart';
import '../widgets/followable_util.dart';
import '../../../../common/widgets/animations/slide_animation_wrapper.dart';
import '../widgets/upcoming_events_section.dart';
import '../widgets/wiki_wide_bookmark_button.dart';
import 'followable_screen.dart';

class UnityScreen extends StatelessWidget {
  final FollowableData _followableData;

  const UnityScreen(this._followableData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FollowableScreen<UnityCubit, FollowCubit<UnityFull, UnityShort>>(
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
    return BlocConsumer<UnityCubit, UnityState>(
      listener: (context, state) {
        if (state is UnityLoadedState) {
          context.read<FollowCubit<UnityFull, UnityShort>>().defineFollowState(
                weeklyFollowers: state.unity.weeklyFollowers,
                overallFollowers: state.unity.overallFollowers,
                isFollowed: state.unity.isFollowed,
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
          // TODO Exception
        }
      },
    );
  }
}

class _UnityContent extends StatefulWidget {
  final UnityFull unity;
  final List<ArtistShort> artists;
  final List<EventShort> events;
  final void Function<T extends GeneralFollowableInterface, S extends GeneralFollowableInterface>(BuildContext, T)
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
    _isFollowed = context.watch<FollowCubit<UnityFull, UnityShort>>().state.isFollowed!;
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
                  widget.onIsFollowedChange(context, widget.unity),
            ),
          ),
          SocialLinksList(
            soundcloudUsername: widget.unity.soundcloudUsername,
            bandcampUsername: widget.unity.bandcampUsername,
            instagramUsername: widget.unity.instagramUsername,
          ),
          AboutSection(widget.unity.about),
          FollowableListSection(
            'artistEntityNamePlural'.tr(),
            widget.artists,
          ),
          UpcomingEventsSection(widget.events),
        ],
      ),
    );
  }
}
