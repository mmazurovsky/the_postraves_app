import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ionicons/ionicons.dart';
import 'package:the_postraves_package/constants/my_colors.dart';
import '../../../../common/constants/my_text_styles.dart';
import '../../../../common/widgets/other/my_flushbar.dart';
import '../../../../common/widgets/spacers/my_horizontal_padding.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({
    Key? key,
    required this.cityName,
    required this.streetAddress,
  }) : super(key: key);

  final String cityName;
  final String streetAddress;

  @override
  Widget build(BuildContext context) {
    return MyHorizontalPadding(
      child: InkWell(
        onTap: () => {
          Clipboard.setData(ClipboardData(text: '$cityName, $streetAddress')),
          MyFlushbar.showMyFlushbar(
            incomingContext: context,
            flushbarIcon:
                const Icon(Ionicons.copy_outline, color: MyColors.main),
            flushbarMessage: 'wikiPlaceAddressCopied'.tr(),
          ),
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              cityName,
              style: MyTextStyles.placeAddress,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              streetAddress,
              style: MyTextStyles.placeAddress,
              maxLines: 4,
            ),
          ],
        ),
      ),
    );
  }
}
