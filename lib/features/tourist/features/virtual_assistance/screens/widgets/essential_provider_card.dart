import 'package:bt_frontend/core/constants/decoration/prop_values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BTEssentialProviderCard extends StatefulWidget {
  final String? name;
  final String? location;
  // final String? name;

  const BTEssentialProviderCard({super.key, this.name, this.location});

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
          elevation: 1, // Adjust elevation as needed
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.building,
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
                      '${widget.name}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                    Text(
                      '${widget.location}',
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
