import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import '../widgets/other/my_loading_indicator.dart';


class MyRefreshConfiguration extends StatelessWidget {
  static const double heightOfRefresh = 60;
  final Widget child;
  const MyRefreshConfiguration({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      headerBuilder: () => const ClassicHeader(
        height: heightOfRefresh,
        spacing: 0,
        idleIcon: Icon(
          Ionicons.chevron_down,
          color: MyColors.forInactiveStuff,
          size: 25,
        ),
        idleText: '',
        refreshingText: '',
        completeText: '',
        // TODO! Android: check android progress indicator
        refreshingIcon: MyLoadingIndicator(),
        completeIcon: Icon(Ionicons.checkmark,
            color: MyColors.forInactiveStuff, size: 25),
      ), // Configure the default header indicator. If you have the same header indicator for each page, you need to set this
      skipCanRefresh: true,
      headerTriggerDistance:
          heightOfRefresh, // header trigger refresh trigger distance
      springDescription: const SpringDescription(
          stiffness: 170,
          damping: 16,
          mass:
              1.9), // custom spring back animate,the props meaning see the flutter api
      // maxOverScrollExtent:
      //     100, //The maximum dragging range of the head. Set this property if a rush out of the view area occurs
      // maxUnderScrollExtent: 0, // Maximum dragging range at the bottom
      enableScrollWhenRefreshCompleted:
          true, //This property is incompatible with PageView and TabBarView. If you need TabBarView to slide left and right, you need to set it to true.
      enableLoadingWhenFailed:
          true, //In the case of load failure, users can still trigger more loads by gesture pull-up.
      hideFooterWhenNotFull:
          false, // Disable pull-up to load more functionality when Viewport is less than one screen
      enableBallisticLoad: true, // trigger load more by BallisticScrollActivity
      child: child,
    );
  }
}
