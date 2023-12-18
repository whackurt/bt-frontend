import 'package:bt_frontend/core/constants/decoration/prop_values.dart';
import 'package:bt_frontend/features/tourist/features/feedback_complaints/screens/view_complaint.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BTResolvedComplaintCard extends StatefulWidget {
  final Map? complaint;
  const BTResolvedComplaintCard({super.key, this.complaint});

  @override
  State<BTResolvedComplaintCard> createState() =>
      _BTResolvedComplaintCardState();
}

class _BTResolvedComplaintCardState extends State<BTResolvedComplaintCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: PropValues().secondary,
        borderRadius: BorderRadius.circular(PropValues().borderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 5.0, 8.0, 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  FluentIcons.checkmark_circle_16_regular,
                  size: 20.0,
                  color: Colors.green[500],
                ),
                const SizedBox(
                  width: 12.0,
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width) * .60,
                  child: Text(
                    '${widget.complaint!['description']}',
                    style: const TextStyle(fontSize: 15.0),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) {
                            return const BTViewComplaint();
                          },
                          settings:
                              RouteSettings(arguments: widget.complaint)));
                },
                icon: const Icon(
                  Icons.chevron_right,
                  size: 30.0,
                ))
          ],
        ),
      ),
    );
  }
}
