import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_postraves_app/src/common/authentication/state/cubit/authentication_cubit.dart';
import 'package:the_postraves_app/src/common/bottom_navigation_bar/bottom_navigation_tab_item.dart';
import 'package:the_postraves_app/src/common/constants/my_text_styles.dart';
import 'package:the_postraves_app/src/common/widgets/spacers/my_horizontal_padding.dart';
import 'package:the_postraves_app/src/common/widgets/spacers/section_divider.dart';
import 'package:the_postraves_package/constants/my_colors.dart';

class DialogCanvas extends StatelessWidget {
  final String alertText;
  final Widget buttonsRow;
  const DialogCanvas({
    required this.alertText,
    required this.buttonsRow,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding:
          const EdgeInsets.symmetric(horizontal: 15.0, vertical: 24.0),
      backgroundColor: MyColors.bottomNavBar,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      elevation: 2,
      child: MyHorizontalPadding(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 25,
                left: 15,
                right: 15,
              ),
              child: Text(
                alertText,
                style: MyTextStyles.bodyFat,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SectionDivider(needHorizontalMargin: false),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 25,
                left: 15,
                right: 15,
              ),
              child: buttonsRow,
            ),
          ],
        ),
      ),
    );
  }
}

class LinkSentToEmailDialog extends StatelessWidget {
  final void Function() _closeDialogFunction;

  const LinkSentToEmailDialog(this._closeDialogFunction, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DialogCanvas(
      alertText: 'linkHasBeenSent'.tr(),
      buttonsRow: InkWell(
        onTap: _closeDialogFunction,
        child: Container(
          width: 80,
          height: 30,
          alignment: Alignment.center,
          child: InkWell(
            onTap: _closeDialogFunction,
            child: Text(
              'ok'.tr(),
              style: MyTextStyles.bodyWithAccentColor,
            ),
          ),
        ),
      ),
    );
  }
}

class AccountDeletionConfirmationDialog extends StatelessWidget {
  const AccountDeletionConfirmationDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DialogCanvas(
      alertText: 'areYouSureToDeleteAccount'.tr(),
      buttonsRow: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              width: 80,
              height: 30,
              alignment: Alignment.center,
              child: Text(
                'cancel'.tr(),
                style: MyTextStyles.body,
              ),
            ),
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
              BlocProvider.of<AuthenticationCubit>(
                      TabItem.profile.tabNavigatorKey.currentContext!)
                  .deleteMyProfile();
            },
            child: Container(
              width: 80,
              height: 30,
              alignment: Alignment.center,
              child: Text(
                'delete'.tr(),
                style: MyTextStyles.body,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
