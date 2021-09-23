import 'package:flutter/material.dart';
import '../../../../core/presentation/widgets/my_horizontal_padding.dart';
import '../../../../core/provider/current_city_provider.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_constants.dart';
import '../../../../core/utils/my_text_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../models/geo/city.dart';
import 'package:provider/provider.dart';

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
    _currentCity = Provider.of<CurrentCityProvider>(context).currentCity!; // todo risky !
  }

  @override
  Widget build(BuildContext context) {
    return MyHorizontalPadding(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(top: MyConstants.spaceFromTop),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: MyColors.forEventCard,
            ),
            alignment: Alignment.center,
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        '${AppLocalizations.of(context)!.emptyShowsStartText} ${_currentCity.localizedName}.\n\n${AppLocalizations.of(context)!.emptyShowsEndText}',
                    style: MyTextStyles.body,
                  ),
                  WidgetSpan(
                    baseline: TextBaseline.alphabetic,
                    alignment: PlaceholderAlignment.baseline,
                    child: InkWell(
                      //todo
                      onTap: () {},
                      child: RichText(
                        text: TextSpan(
                          text:
                              ' ${AppLocalizations.of(context)!.emptyShowsLinkText}',
                          style: MyTextStyles.bodyWithAccentColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
