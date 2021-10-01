import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

import '../../../../core/presentation/widgets/modal_bottom_sheet_content.dart';
import '../../../../core/presentation/widgets/selection_list_view.dart';
import '../../../../core/provider/city_list_provider.dart';
import '../../../../core/provider/current_city_provider.dart';
import '../../../../models/geo/city.dart';

class CurrentCitySwitcher extends StatelessWidget {
  const CurrentCitySwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    City currentCity = context.watch<CurrentCityProvider>().currentCity!;
    return ModalBottomSheetContent(
      height: 380,
      iconData: Ionicons.location_outline,
      title: AppLocalizations.of(context)!.profileCreationChooseCityTitle,
      content: SelectionListView<City>(
        locations: context.watch<CityListProvider>().cityList,
        activeLocation: currentCity,
        isShrinkWrap: true,
        //todo also change current for user on backend
        onLocationTap: (City tappedCity) {
          if (currentCity != tappedCity) {
            context.read<CurrentCityProvider>().changeCurrentCity(tappedCity);
            Navigator.of(context).pop();
          }
        },
      ),
    );
  }
}
