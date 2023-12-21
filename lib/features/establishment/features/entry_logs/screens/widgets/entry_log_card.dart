import 'package:bt_frontend/core/constants/decoration/prop_values.dart';
import 'package:bt_frontend/features/establishment/features/entry_logs/screens/view_entry_log.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class BTEntryLogCard extends StatefulWidget {
  final Map? entryLog;
  const BTEntryLogCard({super.key, required this.entryLog});

  @override
  State<BTEntryLogCard> createState() => _BTEntryLogCardState();
}

class _BTEntryLogCardState extends State<BTEntryLogCard> {
  Widget buildDateText() {
    String? createdAt =
        widget.entryLog != null ? widget.entryLog!['date_time'] : null;

    if (createdAt != null && createdAt.isNotEmpty) {
      DateTime dateTime = DateTime.parse(createdAt);
      String formattedDate = DateFormat('MMMM d, yyy').format(dateTime);

      return Text(
        formattedDate,
        style: TextStyle(fontSize: 15.0, color: Colors.grey[700]),
      );
    } else {
      return Text(
        'Date Unavailable',
        style: TextStyle(fontSize: 15.0, color: Colors.grey[700]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        height: 80.0,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
        decoration: BoxDecoration(
            color: PropValues().secondary,
            borderRadius: BorderRadius.circular(PropValues().borderRadius)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // CircleAvatar(
            //   radius: 30,
            //   backgroundImage: NetworkImage(
            //     '${widget.entryLog!['tourist']['photo_url']}',
            //   ),
            //   backgroundColor: Colors.white,
            // ),
            FaIcon(
              FontAwesomeIcons.userCheck,
              size: 25.0,
              color: Colors.red[400],
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.entryLog!['tourist']['first_name'] ?? ''} ${widget.entryLog!['tourist']['last_name'] ?? ''}',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0,
                            color: Colors.indigo[400]),
                      ),
                      const SizedBox(
                        height: 3.0,
                      ),
                      buildDateText(),
                      const SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        DateFormat('hh:mm a').format(
                            DateTime.parse(widget.entryLog!['date_time'])),
                        style:
                            TextStyle(fontSize: 15.0, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) {
                                return const BTViewEntryLog();
                              },
                              settings:
                                  RouteSettings(arguments: widget.entryLog!)));
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: FaIcon(
                        FontAwesomeIcons.upRightFromSquare,
                        color: Colors.indigo,
                        size: 16.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
