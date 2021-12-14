import 'package:flutter/material.dart';
import 'package:the_postraves_package/models/geo/country.dart';
import 'package:the_postraves_package/models/interfaces/data_interfaces.dart';
import '../../constants/my_text_styles.dart';
import '../buttons/button_content.dart';
import '../spacers/my_horizontal_padding.dart';

class SelectLocationListView<LOCATION extends LocationInterface>
    extends StatelessWidget {
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
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 18),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: isShrinkWrap,
      itemCount: locations.length,
      separatorBuilder: (context, i) => const SizedBox(height: 18),
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
                  location.emojiCode,
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
