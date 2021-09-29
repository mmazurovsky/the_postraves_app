import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../core/presentation/widgets/my_horizontal_padding.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_text_styles.dart';
import '../../../../core/presentation/widgets/buttons/button_content.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:image_cropper/image_cropper.dart';

class ProfileImageChooser extends StatefulWidget {
  final void Function(File) pickImage;
  final FocusNode nicknameFocusNode;
  const ProfileImageChooser({
    Key? key,
    required this.pickImage,
    required this.nicknameFocusNode
  }) : super(key: key);

  @override
  _ProfileImageChooserState createState() => _ProfileImageChooserState();
}

class _ProfileImageChooserState extends State<ProfileImageChooser> {
  final ImagePicker _imagePicker = ImagePicker();
  Image? _pickedImage;

  Future<void> getImage() async {
    File pickedCroppedImageAsFile;

    final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    File? croppedFile;
    if (pickedFile != null) {
      croppedFile = await ImageCropper.cropImage(
          sourcePath: pickedFile.path,
          aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
          ],
          //todo check on android
          androidUiSettings: const AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          iosUiSettings: const IOSUiSettings(
            minimumAspectRatio: 1.0,
            aspectRatioLockEnabled: true,
            resetAspectRatioEnabled: false,
          ));
    }
    if (croppedFile != null) {
      pickedCroppedImageAsFile = File(croppedFile.path);
      widget.pickImage(pickedCroppedImageAsFile);
      setState(() {
        _pickedImage = Image.file(
          pickedCroppedImageAsFile,
          fit: BoxFit.cover,
        );
      });
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MyHorizontalPadding(
      child: InkWell(
        highlightColor: MyColors.forButtonHighlight,
        onTap: () {
          widget.nicknameFocusNode.unfocus();
          getImage();
        },
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: MyColors.forDividers, width: 1.2),
          ),
          child: MyHorizontalPadding(
            child: ButtonContent(
              mainAxisAlignment: MainAxisAlignment.start,
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Container(
                  height: 55,
                  width: 55,
                  decoration: const BoxDecoration(
                    color: MyColors.forVeryDarkStuff,
                  ),
                  child: _pickedImage ?? const Center(
                          child: Icon(Ionicons.camera_outline,
                              color: MyColors.main, size: 26),
                        ),
                ),
              ),
              distanceBetweenLeadingAndText: 13,
              text: _pickedImage == null
                  ? AppLocalizations.of(context)!.profileCreationAddAvatar
                  : AppLocalizations.of(context)!.profileCreationEditAvatar,
              trailing: const Icon(Ionicons.chevron_forward_outline,
                  color: MyColors.accent, size: 26),
              textStyle: MyTextStyles.body,
            ),
          ),
        ),
      ),
    );
  }
}
