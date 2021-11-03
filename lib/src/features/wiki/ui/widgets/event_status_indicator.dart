import 'package:flutter/material.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import 'package:the_postraves_package/models/related_to_event/event_status.dart';
import '../../../../common/widgets/animations/blink_animation_wrapper.dart';

class EventStatusIndicator extends StatelessWidget {
  final EventStatus status;
  static const double size = 8;
  const EventStatusIndicator(this.status, [Key? key]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget indicator;
    if (status == EventStatus.LIVE) {
      indicator = BlinkAnimationWrapper(
        startColor: MyColors.forLiveEventIndicator,
        endColor: Colors.transparent,
        widgetBuilder: (Color color) => Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      );
    } else {
      indicator = Container();
    }
    return indicator;
  }
}
