import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:the_postraves_package/models/geo/city.dart';
import 'package:the_postraves_package/service/open_link_service.dart';
import '../../../../common/constants/my_constants.dart';
import '../../../../common/constants/my_text_styles.dart';
import '../../../../common/geo_provider/current_city_provider.dart';
import '../../../../common/widgets/other/placeholder_container.dart';

class EmptyShowsPlaceholder extends StatefulWidget {
  const EmptyShowsPlaceholder({Key? key}) : super(key: key);

  @override
  _EmptyShowsPlaceholderState createState() => _EmptyShowsPlaceholderState();
}

class _EmptyShowsPlaceholderState extends State<EmptyShowsPlaceholder> {
  late City _currentCity;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _currentCity = Provider.of<CurrentCityProvider>(context).currentCity!;
  }

  @override
  Widget build(BuildContext context) {
    return PlaceholderContainer(
      child: RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'emptyShowsText'.tr(args: [_currentCity.localName]) + ' ',
              style: MyTextStyles.body,
            ),
            WidgetSpan(
              baseline: TextBaseline.alphabetic,
              alignment: PlaceholderAlignment.baseline,
              child: InkWell(
                onTap: () => OpenLinkService.openTelegram(
                    MyConstants.telegramSupportAccount),
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
