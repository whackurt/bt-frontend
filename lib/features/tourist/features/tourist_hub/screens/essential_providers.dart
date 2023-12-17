import 'package:bt_frontend/features/tourist/features/tourist_hub/screens/widgets/essential_provider_card.dart';
import 'package:bt_frontend/features/tourist/providers/tourist_hub.provider.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:bt_frontend/widgets/wrapper/content_wrapper.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BTEssentialProviders extends StatefulWidget {
  const BTEssentialProviders({super.key});

  @override
  State<BTEssentialProviders> createState() => _BTEssentialProvidersState();
}

class _BTEssentialProvidersState extends State<BTEssentialProviders> {
  @override
  Widget build(BuildContext context) {
    var touristHubProvider =
        Provider.of<TouristHubProvider>(context, listen: true);

    return BTContentWrapper(
      onRefresh: () async {},
      title: 'Essential Providers',
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                FluentIcons.bookmark_28_filled,
                size: 37.0,
                color: Colors.red[400],
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText().purpleBoldHeader(text: 'Vital Services'),
                    AppText().subHeader(
                      context: context,
                      text: 'Connecting You with Essential Providers',
                    ),
                  ],
                ),
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
              children: touristHubProvider.essentialServiceProviders
                  .map((esp) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: BTEssentialProviderCard(
                          provider: esp,
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
