import 'package:bt_frontend/core/constants/decoration/prop_values.dart';
import 'package:bt_frontend/features/establishment/features/entry_logs/screens/widgets/log_details_card.dart';
import 'package:bt_frontend/widgets/appbar.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class BTViewEntryLog extends StatefulWidget {
  const BTViewEntryLog({super.key});

  @override
  State<BTViewEntryLog> createState() => _BTViewEntryLogState();
}

class _BTViewEntryLogState extends State<BTViewEntryLog> {
  @override
  Widget build(BuildContext context) {
    final logDetails = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: appBar(title: ''),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.idCard,
                    size: 30.0,
                    color: Colors.red[400],
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText().purpleBoldHeader(text: 'Entry Log'),
                      Text(
                        'View Tourist Log Details',
                        style: TextStyle(color: Colors.grey[700]),
                      )
                    ],
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 35.0, vertical: 40.0),
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius:
                        BorderRadius.circular(PropValues().borderRadius)),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 65,
                      backgroundImage:
                          NetworkImage('${logDetails['tourist']['photo_url']}'),
                      backgroundColor: Colors.white,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    BTLogDetailsCard(
                        text: '${logDetails['qr_code']}',
                        icon: FontAwesomeIcons.qrcode),
                    BTLogDetailsCard(
                        text:
                            '${logDetails['tourist']['first_name']} ${logDetails['tourist']['last_name']}',
                        icon: FontAwesomeIcons.solidUser),
                    BTLogDetailsCard(
                        text: DateFormat('MMMM d, yyy')
                            .format(DateTime.parse(logDetails['date_time'])),
                        icon: FontAwesomeIcons.calendarDay),
                    BTLogDetailsCard(
                        text: DateFormat('hh:mm a')
                            .format(DateTime.parse(logDetails['date_time'])),
                        icon: FontAwesomeIcons.solidClock),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
