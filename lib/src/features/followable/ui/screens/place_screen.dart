import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_postraves_package/dto/followable_data.dart';
import 'package:the_postraves_package/models/fulls/place_full.dart';
import 'package:the_postraves_package/models/shorts/event_short.dart';
import 'package:the_postraves_package/models/shorts/place_short.dart';

import '../../../../common/widgets/animations/wrappers.dart';
import '../../../../common/widgets/other/loading_container.dart';
import '../../../../common/widgets/other/social_links_list.dart';
import '../../../../common/widgets/spacers/my_horizontal_padding.dart';
import '../../../../common/widgets/spacers/my_spacers.dart';
import '../../state/followable_change_notifier.dart';
import '../../state/place_cubit/place_cubit.dart';
import '../widgets/about_section.dart';
import '../widgets/coordinates_section.dart';
import '../widgets/followable_util.dart';
import '../widgets/upcoming_events_section.dart';
import '../widgets/wiki_wide_bookmark_button.dart';
import 'followable_screen.dart';

class PlaceScreen extends StatelessWidget {
  final FollowableData _followableData;

  const PlaceScreen(
    this._followableData, {
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FollowableScreen<PlaceCubit>(
      _followableData,
      _PlaceStateManagement(_followableData),
    );
  }
}

class _PlaceStateManagement extends StatefulWidget {
  final FollowableData _followableData;
  const _PlaceStateManagement(this._followableData, {Key? key})
      : super(key: key);

  @override
  State<_PlaceStateManagement> createState() => _PlaceStateManagementState();
}

class _PlaceStateManagementState extends State<_PlaceStateManagement> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PlaceCubit>(context).loadPlace(widget._followableData.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaceCubit, PlaceState>(
      builder: (context, state) {
        if (state is PlaceLoadedState) {
          return _PlaceContent(
            place: state.place,
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

class _PlaceContent extends StatefulWidget {
  final PlaceFull place;
  final List<EventShort> events;
  const _PlaceContent({
    required this.place,
    required this.events,
    Key? key,
  }) : super(key: key);

  @override
  State<_PlaceContent> createState() => _PlaceContentState();
}

class _PlaceContentState extends State<_PlaceContent> {
  late bool _isFollowed;

  @override
  void didChangeDependencies() {
    _isFollowed = context
        .watch<FollowableChangeNotifier>()
        .get(widget.place.followableId)
        ?.isFollowed ??
        false;
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
                  FollowableUtil.onIsFollowedChange<PlaceFull, PlaceShort>(
                context,
                widget.place,
              ),
            ),
          ),
          SocialLinksList(
            soundcloudUsername: widget.place.soundcloudUsername,
            instagramUsername: widget.place.instagramUsername,
          ),
          CoordinatesSection(widget.place),
          AboutSection(widget.place.about),
          UpcomingEventsSection(widget.events),
        ],
      ),
    );
  }
}
