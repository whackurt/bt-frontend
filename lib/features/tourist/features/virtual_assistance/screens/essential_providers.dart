import 'package:bt_frontend/features/tourist/features/virtual_assistance/screens/widgets/essential_provider_card.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:bt_frontend/widgets/wrapper/content_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BTEssentialProviders extends StatefulWidget {
  const BTEssentialProviders({super.key});

  @override
  State<BTEssentialProviders> createState() => _BTEssentialProvidersState();
}

class _BTEssentialProvidersState extends State<BTEssentialProviders> {
  List<Map<String, String>> essentialProviders = [
    {
      "name": "Mambajao Police Station",
      "location": "Poblacion, Mambajao",
    },
    {
      "name": "Mambajao Fire Station",
      "location": "Poblacion, Mambajao",
    },
    {
      "name": "Mambajao Municipal Hall",
      "location": "Poblacion, Mambajao",
    },
    {
      "name": "Cebuana Lhuillier",
      "location": "Yumbing, Mambajao",
    },
    {
      "name": "Western Union",
      "location": "Poblacion, Mambajao",
    },
    {
      "name": "San Francisco Hospital",
      "location": "San Francisco, Camiguin",
    },
    {
      "name": "Petron Gas Station",
      "location": "Yumbing, Mambajao",
    },
    {
      "name": "CDO Foodsphere",
      "location": "Pandu, Mambajao",
    },
    {
      "name": "LBC Express",
      "location": "Poblacion, Mambajao",
    },
    {
      "name": "PNB Bank",
      "location": "Poblacion, Mambajao",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BTContentWrapper(
      onRefresh: () async {},
      title: 'Essential Providers',
      child: Column(
        children: [
          Row(
            children: [
              FaIcon(
                FontAwesomeIcons.solidBookmark,
                size: 37.0,
                color: Colors.red[400],
              ),
              const SizedBox(
                width: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText().purpleBoldHeader(text: 'Vital Services'),
                  AppText().subHeader(
                    text: 'Connecting You with Essential Providers',
                  ),
                ],
              )
            ],
          ),
          const Divider(
            height: 20.0,
          ),
          const SizedBox(
            width: 20.0,
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Column(
              children: essentialProviders
                  .map((esp) => BTEssentialProviderCard(
                        name: esp['name'],
                        location: esp['location'],
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
