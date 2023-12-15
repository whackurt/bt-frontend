import 'package:bt_frontend/features/tourist/features/virtual_assistance/screens/widgets/tourist_spot_card.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:bt_frontend/widgets/wrapper/content_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BTTouristSpots extends StatefulWidget {
  const BTTouristSpots({super.key});

  @override
  State<BTTouristSpots> createState() => _BTTouristSpotsState();
}

class _BTTouristSpotsState extends State<BTTouristSpots> {
  String dropdownValue = 'Cafe';
  List<String> dropdownValues = ['Cafe', 'ATM', 'Restaurant', 'Convenience'];

  List<Map<String, String>> touristSpots = [
    {
      "touristSpotName": 'White Island',
      "imgUrl":
          'https://www.jonnymelon.com/wp-content/uploads/2019/10/white-island-camiguin-12.jpg',
      "location": 'Yumbing, Mambajao',
      "description":
          'The island can be accessed from Barangay Agoho or Brgy. Yumbing in Mambajao about 4 to 6 kilometres (2.5 to 3.7 mi) west of the poblacion or town center. ',
    },
    {
      "touristSpotName": 'Mantigue Island',
      "imgUrl":
          'https://www.balaisabaibai.com/wp-content/uploads/2022/10/Mantigue-7-1000-630.jpg',
      "location": 'San Roque, Mahinog',
      "description":
          'The island can be accessed from Barangay Agoho or Brgy. Yumbing in Mambajao about 4 to 6 kilometres (2.5 to 3.7 mi) west of the poblacion or town center. ',
    },
    {
      "touristSpotName": 'Sto. Nino Cold Spring',
      "imgUrl":
          'https://i0.wp.com/shellwanders.com/wp-content/uploads/2018/11/STO-NI%C3%B1O-COLD-SPRING.jpg?fit=860%2C570&ssl=1',
      "location": 'Sto. Nino, Catarman',
      "description":
          'The island can be accessed from Barangay Agoho or Brgy. Yumbing in Mambajao about 4 to 6 kilometres (2.5 to 3.7 mi) west of the poblacion or town center. ',
    },
    {
      "touristSpotName": 'White Island',
      "imgUrl":
          'https://www.jonnymelon.com/wp-content/uploads/2019/10/white-island-camiguin-12.jpg',
      "location": 'Yumbing, Mambajao',
      "description":
          'The island can be accessed from Barangay Agoho or Brgy. Yumbing in Mambajao about 4 to 6 kilometres (2.5 to 3.7 mi) west of the poblacion or town center. ',
    },
    {
      "touristSpotName": 'Mantigue Island',
      "imgUrl":
          'https://www.balaisabaibai.com/wp-content/uploads/2022/10/Mantigue-7-1000-630.jpg',
      "location": 'San Roque, Mahinog',
      "description":
          'The island can be accessed from Barangay Agoho or Brgy. Yumbing in Mambajao about 4 to 6 kilometres (2.5 to 3.7 mi) west of the poblacion or town center. ',
    },
    {
      "touristSpotName": 'Sto. Nino Cold Spring',
      "imgUrl":
          'https://i0.wp.com/shellwanders.com/wp-content/uploads/2018/11/STO-NI%C3%B1O-COLD-SPRING.jpg?fit=860%2C570&ssl=1',
      "location": 'Sto. Nino, Catarman',
      "description":
          'The island can be accessed from Barangay Agoho or Brgy. Yumbing in Mambajao about 4 to 6 kilometres (2.5 to 3.7 mi) west of the poblacion or town center. ',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BTContentWrapper(
        onRefresh: () async {},
        title: 'Tourist Spots',
        child: Column(
          children: [
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.locationDot,
                  size: 38.0,
                  color: Colors.red[400],
                ),
                Column(
                  children: [
                    AppText().purpleBoldHeader(text: 'Explore Camiguin!'),
                    Padding(
                      padding: const EdgeInsets.only(left: 17.0),
                      child: AppText().subHeader(
                        text: 'Discover Captivating Destinations',
                      ),
                    ),
                  ],
                )
              ],
            ),
            const Divider(),
            Container(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Column(
                children: touristSpots
                    .map((spot) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: BTTouristSpotCard(
                            description: spot['description'],
                            touristSpotName: spot['touristSpotName'],
                            imgUrl: spot['imgUrl'],
                            location: spot['location'],
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        ));
  }
}
