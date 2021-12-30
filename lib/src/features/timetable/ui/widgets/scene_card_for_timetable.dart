import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:the_postraves_package/models/related_to_place/scene.dart';

import '../../../../common/constants/my_text_styles.dart';
import '../../../../common/widgets/image/my_cached_network_image.dart';

class SceneCardForTimetable extends StatelessWidget {
  final Scene scene;
  const SceneCardForTimetable(this.scene, [Key? key]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          MyCachedNetworkImage(scene.imageLink),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.75),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('scene'.tr(), style: MyTextStyles.cardSceneSubtitle),
                const SizedBox(height: 3),
                Text(scene.name.toUpperCase(),
                    style: MyTextStyles.cardSceneTitle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
