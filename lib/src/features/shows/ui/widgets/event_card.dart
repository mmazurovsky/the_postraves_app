import 'package:flutter/material.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import 'package:the_postraves_package/models/shorts/event_short.dart';
import '../../../../common/constants/my_constants.dart';
import '../../../../common/constants/my_text_styles.dart';
import '../../../../common/utils/screen_size.dart';
import '../../../../common/widgets/spacers/my_horizontal_margin.dart';
import '../../../../common/widgets/image/empty_image_placeholder.dart';
import '../../../../common/widgets/image/my_cached_network_image.dart';
import '../../../../common/navigation/my_navigation.dart';
import 'event_card_details_concrete.dart';

class EventCard extends StatefulWidget {
  final EventShort loadedEvent;

  const EventCard({required this.loadedEvent, required Key key})
      : super(key: key);

  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> with TickerProviderStateMixin {
  late MyCachedNetworkImage _eventImage;
  late AnimationController _controller;
  late Animation<double> _animation;
  late double _widthOfCard;

  @override
  void initState() {
    super.initState();
    _eventImage = MyCachedNetworkImage(widget.loadedEvent.imageLink);
    _controller = AnimationController(
      lowerBound: 0.94,
      upperBound: 1,
      duration: const Duration(milliseconds: 50),
      reverseDuration: const Duration(milliseconds: 120),
      value: 1,
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );
    _widthOfCard = ScreenSize.width - 2 * MyConstants.horizontalPaddingOrMargin;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _navigateToEvent() async {
    return Future.delayed(
      const Duration(milliseconds: 170),
      () async => NavigatorFunctions.pushFollowable(
        context: context,
        followableData: widget.loadedEvent.convertToFollowableData(
          await _eventImage.getImageDimensions(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Container(
        padding: const EdgeInsets.only(
          bottom: MyConstants.endingOfScreenOrSpaceBetweenElements,
        ),
        child: MyHorizontalMargin(
          child: GestureDetector(
            onLongPressStart: (details) => _controller.reverse(),
            onLongPressEnd: (details) async {
              _controller.forward();
              await _navigateToEvent();
            },
            onTap: () async {
              _controller.reverse().whenComplete(() => _controller.forward());
              await _navigateToEvent();
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                          width: double.infinity,
                          height: _widthOfCard / 2,
                          child: widget.loadedEvent.imageLink == null
                              ? EmptyImagePlaceholder()
                              : _eventImage),
                    ],
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: MyColors.forEventCard,
                    ),
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                      top: 15,
                      bottom: 25,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.loadedEvent.name,
                          style: MyTextStyles.fullEventCardTitle,
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                width: MyConstants.dividerThickness,
                                color: MyColors.forDividers,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        EventCardDetailsConcrete(widget.loadedEvent),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
