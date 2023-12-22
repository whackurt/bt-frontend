import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BTEmergencyHotline extends StatefulWidget {
  final String? imgUrl;
  final String? agency;
  final String? location;
  final String? contactno;

  const BTEmergencyHotline(
      {super.key, this.imgUrl, this.agency, this.location, this.contactno});

  @override
  State<BTEmergencyHotline> createState() => _BTEmergencyHotlineState();
}

class _BTEmergencyHotlineState extends State<BTEmergencyHotline> {
  AppText appText = AppText();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle, // Set shape to rectangle
              image: DecorationImage(
                image: NetworkImage('${widget.imgUrl}'),
                fit: BoxFit.fitHeight, // Adjust the fit as needed
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .55,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appText.heading(text: '${widget.agency}'),
                      Text('${widget.location}'),
                      Text('${widget.contactno}')
                    ],
                  ),
                ),
                Container(
                  width: 40.0, // Adjust the width and height as needed
                  height: 40.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.indigo,
                  ),
                  child: InkWell(
                    onTap: () async {
                      final Uri url =
                          Uri(scheme: 'tel', path: '${widget.contactno}');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        // ignore: avoid_print
                        print('Cannot launch url: ');
                      }
                    },
                    child: const Icon(
                      Icons.call,
                      color: Colors.white,
                      size: 20.0, // Adjust the icon size as needed
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider()
        ],
      ),
    );
  }
}
