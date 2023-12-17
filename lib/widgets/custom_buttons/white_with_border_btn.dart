import 'package:bt_frontend/core/constants/decoration/prop_values.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/link.dart';

class BTWhiteBtnWithBorder extends StatefulWidget {
  final double? height;
  final String? labelText;
  final IconData? iconData;
  final String url;
  final Function()? action;
  const BTWhiteBtnWithBorder(
      {super.key,
      this.height,
      this.labelText,
      this.action,
      required this.url,
      this.iconData});

  @override
  State<BTWhiteBtnWithBorder> createState() => _BTWhiteBtnWithBorderState();
}

class _BTWhiteBtnWithBorderState extends State<BTWhiteBtnWithBorder> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: widget.height,
        decoration: BoxDecoration(
          color: PropValues().main,
          borderRadius: BorderRadius.circular(10.0), // Border radius
          border: Border.all(
            color: const Color.fromARGB(255, 2, 92, 9), // Border color
            width: 1.0, // Border width
          ),
        ),
        child: Link(
          uri: Uri.parse(widget.url),
          target: LinkTarget.blank,
          builder: (BuildContext ctx, FollowLink? openLink) {
            return TextButton.icon(
              onPressed: openLink,
              label: Text(
                '${widget.labelText}',
                style: const TextStyle(color: Color.fromARGB(255, 2, 92, 9)),
              ),
              icon: FaIcon(
                widget.iconData,
                color: const Color.fromARGB(255, 2, 92, 9),
              ),
            );
          },
        ));
  }
}
