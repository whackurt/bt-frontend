import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BTEntryLogCard extends StatefulWidget {
  final Map? entryLog;
  const BTEntryLogCard({super.key, this.entryLog});

  @override
  State<BTEntryLogCard> createState() => _BTEntryLogCardState();
}

class _BTEntryLogCardState extends State<BTEntryLogCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(color: Colors.grey)),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
              child: Column(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.blue[700],
                  )
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .52,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.entryLog!["tourist"]["first_name"]} ${widget.entryLog!["tourist"]["last_name"]}',
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.green[700],
                        fontWeight: FontWeight.w600),
                    maxLines: 3,
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  Text(
                    '${widget.entryLog!["tourist"]["qr_code"]}',
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 5.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  DateFormat.yMMMd()
                      .format(DateTime.parse(widget.entryLog!["createdAt"])),
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.red[700],
                    // fontWeight: FontWeight.w600
                  ),
                ),
                const SizedBox(
                  height: 3.0,
                ),
                Text(
                  DateFormat.jm()
                      .format(DateTime.parse(widget.entryLog!["createdAt"])),
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey[700],
                    // fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
