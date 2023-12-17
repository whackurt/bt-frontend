import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/link.dart';

class BTTouristSpotCard extends StatefulWidget {
  final Map<String, dynamic>? touristSpot;

  const BTTouristSpotCard({super.key, required this.touristSpot});

  @override
  State<BTTouristSpotCard> createState() => _BTTouristSpotCardState();
}

class _BTTouristSpotCardState extends State<BTTouristSpotCard> {
  launchUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0, // Adjust elevation as needed
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Stack(
            children: [
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  image: DecorationImage(
                    image: NetworkImage(widget
                        .touristSpot!['imgUrl']), // Replace with your image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.touristSpot!['name'],
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 3.0,
                            color: const Color.fromARGB(255, 0, 0, 0)
                                .withOpacity(0.5),
                            offset: const Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      widget.touristSpot!['address'],
                      style: TextStyle(
                        fontSize: 16,
                        // fontWeight: FontWeight.w600,
                        color: Colors.grey[200],
                        shadows: [
                          Shadow(
                            blurRadius: 3.0,
                            color: const Color.fromARGB(255, 0, 0, 0)
                                .withOpacity(0.5),
                            offset: const Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: 138,
                  left: MediaQuery.of(context).size.width * .70,
                  child: Link(
                    uri: Uri.parse(widget.touristSpot!['gmapUrl']),
                    target: LinkTarget.blank,
                    builder: (BuildContext ctx, FollowLink? openLink) {
                      return TextButton.icon(
                        onPressed: openLink,
                        label: const Text(
                          'Go',
                          style: TextStyle(color: Colors.white),
                        ),
                        icon: const FaIcon(
                          FontAwesomeIcons.locationArrow,
                          color: Colors.white,
                        ),
                      );
                    },
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
