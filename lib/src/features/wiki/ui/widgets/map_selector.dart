import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ionicons/ionicons.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:the_postraves_package/models/geo/coordinate.dart';
import '../../../../common/constants/my_text_styles.dart';
import '../../../../common/utils/screen_size.dart';
import '../../../../common/widgets/selectors/modal_bottom_sheet_content.dart';
import 'button_with_icons.dart';

class MapSelector extends StatelessWidget {
  final Coordinate coordinate;
  final String placeName;
  const MapSelector({
    Key? key,
    required this.coordinate,
    required this.placeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModalBottomSheetContent(
      height: ScreenSize.height * 0.4,
      iconData: Ionicons.map_outline,
      title: 'wikiPlaceChooseMapToOpen'.tr(),
      content: FutureBuilder<List<AvailableMap>>(
        future: MapLauncher.installedMaps,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Text(
              'loading'.tr(),
              style: MyTextStyles.body,
            );
          } else {
            return ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 10),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, i) => ButtonWithIcons(
                buttonText: snapshot.data![i].mapName,
                onButtonTap: () => snapshot.data![i].showMarker(
                  coords: Coords(coordinate.latitude, coordinate.longitude),
                  title: placeName,
                ),
                verticalPadding: 0,
              ),
              separatorBuilder: (context, i) => SizedBox(height: 20),
            );
          }
        },
      ),
    );
  }
}
