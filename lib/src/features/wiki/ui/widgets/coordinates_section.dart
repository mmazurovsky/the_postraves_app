import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_static_maps_controller/google_static_maps_controller.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/my_horizontal_margin.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/section_divider.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/my_spacers.dart';
import 'package:the_postraves_app/src/core/presentation/widgets/section_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:the_postraves_app/src/core/utils/my_colors.dart';
import 'package:the_postraves_app/src/core/utils/my_constants.dart';
import 'package:the_postraves_app/src/models/fulls/place_full.dart';

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
        SectionTitle(
            sectionTitle: AppLocalizations.of(context)!.wikiPlaceCoordinates),
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
                      Marker(
                        color: MyColors.accent,
                        label: 'A',
                        locations: [
                          Location(
                            _place.coordinate.latitude,
                            _place.coordinate.longitude,
                          ),
                        ],
                      ),
                      //todo
                      //         Marker.custom(
                      //   anchor: MarkerAnchor.bottom,
                      //   icon: "https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/285/round-pushpin_1f4cd.png",
                      //   locations: [
                      //     Location(
                      //               loadedPlace.coordinate.latitude,
                      //               loadedPlace.coordinate.longitude,
                      //             ),
                      //   ],
                      // )
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
