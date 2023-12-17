import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BTTouristSpotCard extends StatefulWidget {
  final String? description;
  final String? touristSpotName;
  final String? location;
  final String? imgUrl;
  const BTTouristSpotCard(
      {super.key,
      this.description,
      this.touristSpotName,
      this.location,
      this.imgUrl});

  @override
  State<BTTouristSpotCard> createState() => _BTTouristSpotCardState();
}

class _BTTouristSpotCardState extends State<BTTouristSpotCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2, // Adjust elevation as needed
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
                    image: NetworkImage(
                        '${widget.imgUrl}'), // Replace with your image
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
                      '${widget.touristSpotName}',
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
                      '${widget.location}',
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
                  top: 145,
                  left: 320,
                  child: InkWell(
                    onTap: () {},
                    child: const FaIcon(
                      FontAwesomeIcons.locationArrow,
                      size: 25,
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
