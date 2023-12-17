import 'package:bt_frontend/core/constants/decoration/prop_values.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class BTEssentialProviderCard extends StatefulWidget {
  final Map<String, dynamic>? provider;

  const BTEssentialProviderCard({super.key, this.provider});

  @override
  State<BTEssentialProviderCard> createState() =>
      _BTEssentialProviderCardState();
}

class _BTEssentialProviderCardState extends State<BTEssentialProviderCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Card(
          color: PropValues().secondary,
          elevation: 0, // Adjust elevation as needed
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Icon(
                  FluentIcons.building_retail_20_regular,
                  size: 30.0,
                  color: Colors.red[400],
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.provider!['name']}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                    Text(
                      '${widget.provider!['address']}',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[800],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
