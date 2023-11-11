import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:bt_frontend/widgets/appbar.dart';
import 'package:flutter/material.dart';

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
      "name": "White Island",
      "address": "Yumbing, Mambajao",
      "description":
          "The island can be accessed from Barangay Agoho or Brgy. Yumbing in Mambajao about 4 to 6 kilometres (2.5 to 3.7 mi) west of the poblacion or town center. Small boats can be hired from any of the beachfront resorts that face the island.",
      "imgUrl":
          "https://www.projectlupad.com/wp-content/uploads/2018/07/Captivating-White-Island-in-Camiguin-Copyright-to-Project-LUPAD-4.jpg"
    },
    {
      "name": "Sto. Niño Cold Spring",
      "address": "Sto. Niño, Catarman",
      "description":
          "This spot is best known for its cool and fresh waters that make for a great escape, especially during the summer months of March to May. The spring's freshwater comes from the nearby Mt.",
      "imgUrl": "https://live.staticflickr.com/2103/2387939309_0d20b3c2a5_z.jpg"
    },
    {
      "name": "Katunggan Park",
      "address": "San Miguel, Mahinog",
      "description":
          "Experience a great escape from the city's hustle and bustle at Katunggan Park, a mangrove park with abundant marine life, a boardwalk, cottages, relaxing ambiance, and unparalleled scenery.",
      "imgUrl":
          "https://www.projectlupad.com/wp-content/uploads/2022/06/Kaunggan-Mangrove-Park-Camiugin-Copyright-to-Project-LUPAD-11-1024x640.jpg"
    },
    {
      "name": "Ardent Hot Spring",
      "address": "Tagdo, Mambajao",
      "description":
          "Ardent Spring Resort is among Camiguin's well-loved tourist destinations. With its warm water that springs from Mt. Hibok-Hibok, this spot is perfect for wading after a long day’s tour around the island.",
      "imgUrl":
          "https://www.jonnymelon.com/wp-content/uploads/2019/09/ardent-hot-spring-camiguin-2.jpg"
    },
  ];

  static const headerStyle = TextStyle(
      color: Color.fromARGB(255, 90, 90, 90),
      fontSize: 18,
      fontWeight: FontWeight.w600);
  var contentStyleHeader = TextStyle(
      color: Colors.grey[850], fontSize: 15.0, fontWeight: FontWeight.w700);
  var mainContentStyle = TextStyle(
      fontWeight: FontWeight.w600, fontSize: 15.0, color: Colors.grey[850]);
  static const contentStyle = TextStyle(
      color: Color.fromARGB(255, 102, 102, 102),
      fontSize: 14,
      fontWeight: FontWeight.normal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Tourist Spots'),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 40.0),
        child: Accordion(
          headerBorderRadius: 7.0,
          contentBorderRadius: 7.0,
          headerBorderColor: Colors.grey,
          headerBackgroundColor: Colors.white,
          headerBorderColorOpened: Colors.grey,
          headerBorderWidth: 1,
          headerBackgroundColorOpened: Colors.white,
          contentBackgroundColor: Colors.white,
          contentBorderColor: Colors.grey,
          contentBorderWidth: 1,
          scaleWhenAnimating: true,
          openAndCloseAnimation: true,
          headerPadding:
              const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
          sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
          sectionClosingHapticFeedback: SectionHapticFeedback.light,
          children: touristSpots.map((spot) {
            return AccordionSection(
              isOpen: true,
              contentVerticalPadding: 10,
              leftIcon: const Icon(
                Icons.explore_outlined,
                color: Color.fromARGB(255, 90, 90, 90),
                size: 40.0,
              ),
              rightIcon: const Icon(
                Icons.expand_more,
                color: Color.fromARGB(255, 90, 90, 90),
                size: 30.0,
              ),
              header: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Text(
                      '${spot['name']}',
                      style: headerStyle,
                    )
                  ],
                ),
              ),
              content: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network('${spot['imgUrl']}'),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Column(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .80,
                            child: Text(
                              '${spot['description']}',
                              style: TextStyle(
                                fontSize: 13.0,
                                color: Colors.grey[800],
                              ),
                              maxLines: 5,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        const Text('Location: ', style: contentStyle),
                        Text('${spot['address']}', style: mainContentStyle),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
