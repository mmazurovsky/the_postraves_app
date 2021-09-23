import 'package:flutter/material.dart';
import '../../../../models/related_to_place/scene.dart';
import '../../../../core/utils/my_text_styles.dart';
import 'darkened_image_in_container.dart';

class SceneCardForEvent extends StatelessWidget {
  final Scene scene;
  const SceneCardForEvent(this.scene, [Key? key]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DarkenedImageInContainer(
      onTap: () {},
      imageLink: scene.imageLink,
      child: Positioned(
        bottom: 15,
        left: 15,
        child: Text(scene.name, style: MyTextStyles.cardSceneTitle),
      ),
    );
  }
}
