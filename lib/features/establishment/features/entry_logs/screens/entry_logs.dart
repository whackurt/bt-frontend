import 'package:bt_frontend/core/constants/decoration/prop_values.dart';
import 'package:bt_frontend/features/establishment/features/entry_logs/controllers/log.controller.dart';
import 'package:bt_frontend/features/establishment/features/entry_logs/screens/widgets/entry_log_card.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:bt_frontend/widgets/wrapper/content_wrapper.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BTEntryLogs extends StatefulWidget {
  const BTEntryLogs({super.key});

  @override
  State<BTEntryLogs> createState() => _BTEntryLogsState();
}

class _BTEntryLogsState extends State<BTEntryLogs> {
  EntryLogsController entryLogsController = EntryLogsController();

  List logs = [];
  DateTime logDate = DateTime.now();
  bool loading = false;

  Future getEntryLogsToday() async {
    setState(() {
      loading = true;
    });

    await entryLogsController.getEntryLogsToday().then((res) {
      if (res['success']) {
        setState(() {
          logs = res['data']['logs'];
        });
      }
    });

    setState(() {
      loading = false;
    });
  }

  Future getEntryLogsByDate() async {
    setState(() {
      loading = true;
    });

    await entryLogsController.getEntryLogsByDate(date: logDate).then((res) {
      if (res['success']) {
        setState(() {
          logs = res['data']['logs'];
        });
      }
    });

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getEntryLogsToday();
  }

  @override
  Widget build(BuildContext context) {
    return BTContentWrapper(
      onRefresh: () async {
        // getTouristData();
      },
      title: '',
      child: Column(
        children: [
          Row(
            children: [
              FaIcon(
                FontAwesomeIcons.listCheck,
                size: 30.0,
                color: Colors.red[400],
              ),
              const SizedBox(
                width: 8.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText().purpleBoldHeader(text: 'Entry Logs'),
                  Text(
                    'Track and Review Tourist Entry',
                    style: TextStyle(color: Colors.grey[700]),
                  )
                ],
              ),
            ],
          ),
          const Divider(
            thickness: 1.0,
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Row(
            children: [
              Text(
                'Filter by Date',
                style: TextStyle(color: Colors.indigo),
              ),
            ],
          ),
          const SizedBox(
            height: 5.0,
          ),
          DateTimeField(
            initialDate: DateTime.now(),
            lastDate: DateTime.now(),
            decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: PropValues().secondary),
            mode: DateTimeFieldPickerMode.date,
            onDateSelected: (DateTime value) {
              setState(() {
                logDate = value;
              });

              getEntryLogsByDate();
            },
            selectedDate: logDate,
          ),
          const SizedBox(
            height: 5.0,
          ),
          const SizedBox(
            height: 20.0,
          ),
          loading
              ? const SpinKitRing(
                  color: Colors.indigo,
                  lineWidth: 3,
                  size: 30.0,
                )
              : logs.isEmpty
                  ? Text(
                      'No logs available',
                      style: TextStyle(fontSize: 14.0, color: Colors.red[400]),
                    )
                  : Column(
                      children: logs.map((log) {
                        return BTEntryLogCard(entryLog: log);
                      }).toList(),
                    ),
          const SizedBox(
            height: 50.0,
          )
        ],
      ),
    );
  }
}
