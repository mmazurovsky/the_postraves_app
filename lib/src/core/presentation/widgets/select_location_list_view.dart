import 'package:flutter/material.dart';
import '../../../models/geo/country.dart';
import '../../../models/interfaces/data_interfaces.dart';
import '../../provider/city_list_provider.dart';
import '../../utils/my_text_styles.dart';
import 'package:provider/provider.dart';

import 'buttons/button_content.dart';
import 'my_horizontal_padding.dart';

class SelectLocationListView<LOCATION extends LocationInterface> extends StatelessWidget {
  final void Function(LOCATION) onLocationTap;
  final List<LOCATION> locations;
  final LOCATION? activeLocation;
  final bool isShrinkWrap;
  const SelectLocationListView({
    Key? key,
    required this.onLocationTap,
    required this.locations,
    this.isShrinkWrap = false,
    required this.activeLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // todo scroll bar
    return ListView.separated(
      
      padding: const EdgeInsets.symmetric(vertical: 10),
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      shrinkWrap: isShrinkWrap,
      itemCount: locations.length,
      separatorBuilder: (context, i) => const SizedBox(height: 10),
      itemBuilder: (context, i) {
        LOCATION location = locations[i];
        return InkWell(
          onTap: () => onLocationTap(location),
          child: MyHorizontalPadding(
            child: ButtonContent(
              leading: Container(
                height: 30,
                width: 30,
                alignment: Alignment.center,
                child: Text(
                  location.countryEmoji,
                  style: const TextStyle(fontSize: 21),
                ),
              ),
              trailing: location is Country
                  ? Text(
                      location.phoneCode ?? "",
                      style: location == activeLocation
                          ? MyTextStyles.bodyWithAccentColor
                          : MyTextStyles.body,
                    )
                  : null,
              distanceBetweenLeadingAndText: 13,
              text: location.localName,
              textStyle: location.name == activeLocation?.name
                  ? MyTextStyles.modalBottomSheetItemAccent
                  : MyTextStyles.modalBottomSheetItem,
              mainAxisAlignment: MainAxisAlignment.start,
            ),
          ),
        );
      },
    );
  }
}
