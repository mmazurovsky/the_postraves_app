import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:the_postraves_package/models/geo/city.dart';
import '../../constants/my_constants.dart';
import '../other/select_location_list_view.dart';
import 'modal_bottom_sheet_content.dart';


class CurrentCitySelector extends StatefulWidget {
  final City currentCity;
  final List<City> cities;
  final Function onSelected;
  const CurrentCitySelector({
    Key? key,
    required this.currentCity,
    required this.cities,
    required this.onSelected,
  }) : super(key: key);

  @override
  _CurrentCitySelectorState createState() => _CurrentCitySelectorState();
}

class _CurrentCitySelectorState extends State<CurrentCitySelector> {
  late City _currentCity;

  @override
  void initState() {
    _currentCity = widget.currentCity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModalBottomSheetContent(
      height: MyConstants.heightOfCitySelectorModalBottomSheet,
      iconData: Ionicons.compass_outline,
      title: 'selectCityTitle'.tr(),
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
