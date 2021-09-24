import 'package:flutter/material.dart';
import '../../../../models/related_to_place/scene.dart';
import '../../../../core/presentation/widgets/my_cached_network_image.dart';
import '../../../../core/utils/my_text_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SceneCardForTimetable extends StatelessWidget {
  final Scene scene;
  const SceneCardForTimetable(this.scene, [Key? key]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
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
                  Text(AppLocalizations.of(context)!.scene, style: MyTextStyles.cardSceneSubtitle),
                  SizedBox(height: 3),
                  Text(scene.name.toUpperCase(), style: MyTextStyles.cardSceneTitle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
