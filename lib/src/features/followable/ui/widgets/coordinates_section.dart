import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:google_static_maps_controller/google_static_maps_controller.dart';
import 'package:the_postraves_package/models/fulls/place_full.dart';
import '../../../../common/constants/my_constants.dart';
import '../../../../common/widgets/other/section_title.dart';
import '../../../../common/widgets/spacers/my_horizontal_margin.dart';
import '../../../../common/widgets/spacers/my_spacers.dart';
import '../../../../common/widgets/spacers/section_divider.dart';
import 'address_section.dart';
import 'map_selector.dart';

class CoordinatesSection extends StatelessWidget {
  final PlaceFull _place;
  const CoordinatesSection(this._place, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MyBigSpacer(),
        const SectionDivider(needHorizontalMargin: true),
        const MyBigSpacer(),
        SectionTitle(sectionTitle: 'wikiPlaceCoordinates'.tr()),
        const MyMediumSpacer(),
        InkWell(
          onTap: () => showModalBottomSheet(
            context: context,
            builder: (context) => MapSelector(
              coordinate: _place.coordinate,
              placeName: _place.name,
            ),
          ),
          child: MyHorizontalMargin(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ClipRect(
                child: Align(
                  alignment: Alignment.topCenter,
                  heightFactor: 0.88,
                  child: StaticMap(
                    googleApiKey: MyConstants.googleApiKey,
                    language: 'english',
                    height: 190,
                    mapId: MyConstants.googleMapId,
                    zoom: 14,
                    markers: [
                      Marker.custom(
                        anchor: MarkerAnchor.bottom,
                        icon:
                            "https://firebasestorage.googleapis.com/v0/b/postraves.appspot.com/o/system%2Fimages%2Fpin.png?alt=media&token=3d485ff1-8642-4fd5-8b57-477300edbc1a",
                        locations: [
                          Location(
                            _place.coordinate.latitude,
                            _place.coordinate.longitude,
                          ),
                        ],
                      )
                    ],
                    center: Location(
                      _place.coordinate.latitude,
                      _place.coordinate.longitude,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        AddressSection(
          cityName: _place.city.localName,
          streetAddress: _place.streetAddress,
        ),
      ],
    );
  }
}
