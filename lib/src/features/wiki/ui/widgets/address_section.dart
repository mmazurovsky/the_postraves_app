import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/my_flushbar.dart';
import '../../../../core/presentation/widgets/my_horizontal_padding.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_text_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'icon_button_trigerring_flushbar.dart';

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
            flushbarMessage:
                AppLocalizations.of(context)!.wikiPlaceAddressCopied,
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
