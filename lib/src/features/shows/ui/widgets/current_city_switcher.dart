import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../core/presentation/widgets/modal_bottom_sheet_content.dart';
import '../../../../core/presentation/widgets/select_location_list_view.dart';
import '../../../../models/geo/city.dart';

class CurrentCitySwitcher extends StatefulWidget {
  final City currentCity;
  final List<City> cities;
  final Function onSelected;
  const CurrentCitySwitcher({
    Key? key,
    required this.currentCity,
    required this.cities,
    required this.onSelected,
  }) : super(key: key);

  @override
  _CurrentCitySwitcherState createState() => _CurrentCitySwitcherState();
}

class _CurrentCitySwitcherState extends State<CurrentCitySwitcher> {
  late City _currentCity;

  @override
  void initState() {
    _currentCity = widget.currentCity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModalBottomSheetContent(
      height: 380,
      iconData: Ionicons.location_outline,
      title: AppLocalizations.of(context)!.selectCityTitle,
      content: SelectLocationListView<City>(
        locations: widget.cities,
        activeLocation: _currentCity,
        onLocationTap: (City cityTapped) {
          if (_currentCity != cityTapped) {
            setState(() {
              _currentCity = cityTapped;
            });
            widget.onSelected(cityTapped);
            Navigator.of(context).pop();
          }
        },
      ),
    );
  }
}
