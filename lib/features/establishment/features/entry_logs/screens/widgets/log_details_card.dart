import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BTLogDetailsCard extends StatefulWidget {
  final String? text;
  final IconData? icon;
  const BTLogDetailsCard({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  State<BTLogDetailsCard> createState() => _BTLogDetailsCardState();
}

class _BTLogDetailsCardState extends State<BTLogDetailsCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FaIcon(
            widget.icon,
            size: 30.0,
            color: Colors.red[400],
          ),
          const SizedBox(
            width: 15.0,
          ),
          Text(
            '${widget.text}',
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                color: Colors.grey[800]),
          ),
        ],
      ),
    );
  }
}
