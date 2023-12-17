import 'package:bt_frontend/features/tourist/features/tourist_hub/screens/widgets/tourist_spot_card.dart';
import 'package:bt_frontend/features/tourist/providers/tourist_hub.provider.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:bt_frontend/widgets/wrapper/content_wrapper.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BTTouristSpots extends StatefulWidget {
  const BTTouristSpots({super.key});

  @override
  State<BTTouristSpots> createState() => _BTTouristSpotsState();
}

class _BTTouristSpotsState extends State<BTTouristSpots> {
  @override
  Widget build(BuildContext context) {
    var touristHubProvider =
        Provider.of<TouristHubProvider>(context, listen: true);

    return BTContentWrapper(
        onRefresh: () async {},
        title: 'Tourist Spots',
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  FluentIcons.location_28_filled,
                  size: 38.0,
                  color: Colors.red[400],
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText().purpleBoldHeader(text: 'Explore Camiguin!'),
                      AppText().subHeader(
                        context: context,
                        text: 'Discover Captivating Destinations',
                      ),
                    ],
                  ),
                )
              ],
            ),
            const Divider(),
            Container(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Column(
                children: touristHubProvider.touristSpots
                    .map((spot) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: BTTouristSpotCard(
                            touristSpot: spot,
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        ));
  }
}
