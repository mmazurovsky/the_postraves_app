import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:the_postraves_package/models/geo/city.dart';
import 'package:the_postraves_package/service/open_link_service.dart';
import '../../../../common/constants/my_constants.dart';
import '../../../../common/constants/my_text_styles.dart';
import '../../../../common/geo_change_notifier/current_city_change_notifier.dart';
import '../../../../common/widgets/other/placeholder_container.dart';

class EmptyShowsPlaceholder extends StatelessWidget {
  final bool isFiltered;
  const EmptyShowsPlaceholder({this.isFiltered = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = isFiltered ? 'emptyFilteredShowsText' : 'emptyShowsText';
    return PlaceholderContainer(
      child: RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          children: [
            TextSpan(
              text: text.tr(args: [
                    context
                        .read<CurrentCityChangeNotifier>()
                        .currentCity!
                        .localName
                  ]) +
                  ' ',
              style: MyTextStyles.body,
            ),
            WidgetSpan(
              baseline: TextBaseline.alphabetic,
              alignment: PlaceholderAlignment.baseline,
              child: InkWell(
                onTap: () => OpenLinkService.openTelegramOrEmail(
                  MyConstants.telegramSupportAccount,
                  MyConstants.emailSupportAccount,
                ),
                child: RichText(
                  text: TextSpan(
                    text: 'emptyShowsLinkText'.tr(),
                    style: MyTextStyles.bodyWithAccentColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
