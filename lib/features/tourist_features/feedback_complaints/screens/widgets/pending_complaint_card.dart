import 'package:bt_frontend/features/tourist_features/feedback_complaints/screens/view_complaint.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BTPendingComplaintCard extends StatefulWidget {
  final Map? complaint;
  const BTPendingComplaintCard({super.key, this.complaint});

  @override
  State<BTPendingComplaintCard> createState() => _BTPendingComplaintCardState();
}

class _BTPendingComplaintCardState extends State<BTPendingComplaintCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.pending_outlined,
                  size: 30.0,
                  color: Colors.grey[800],
                ),
                const SizedBox(
                  width: 16.0,
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width) * .60,
                  child: Text(
                    '${widget.complaint!['title']}',
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