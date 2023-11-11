import 'package:bt_frontend/features/establishment_features/entry_logs/presentation/widgets/entry_log_card.dart';
import 'package:bt_frontend/widgets/wrapper/content_wrapper.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class BTEntryLogs extends StatefulWidget {
  const BTEntryLogs({super.key});

  @override
  State<BTEntryLogs> createState() => _BTEntryLogsState();
}

List<Map<String, dynamic>> entryLogs = [
  {
    "createdAt": "2023-11-03 12:34:00",
    "tourist": {
      "id": 45,
      'qr_code': "BT63154232",
      'first_name': "Jackilyn Mac Shane",
      'last_name': 'Roberto',
    },
    "establishment": {"id": 45, "name": "DL Bonita Merchandise "}
  },
  {
    "createdAt": "2023-11-03 12:34:00",
    "tourist": {
      "id": 45,
      'qr_code': "BT63154232",
      'first_name': "Jack",
      'last_name': 'Roberto',
    },
    "establishment": {"id": 45, "name": "DL Bonita Merchandise "}
  },
];

DateTime? logDate;

// This is the new Entry Logs widget

class _BTEntryLogsState extends State<BTEntryLogs> {
  @override
  Widget build(BuildContext context) {
    return BTContentWrapper(
      title: 'Entry Logs',
      child: Column(
        children: [
          // Row(
          //   // mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     const Text(
          //       'Today is: ',
          //       style: TextStyle(fontSize: 18.0),
          //     ),
          //     Text(
          //       DateFormat.yMMMd().format(DateTime.now()),
          //       style: TextStyle(
          //           color: Colors.blue[800],
          //           fontSize: 20.0,
          //           fontWeight: FontWeight.w600),
          //     ),
          //   ],
          // ),
          // const Divider(
          //   thickness: 1.0,
          // ),
          const Row(
            children: [
              Text('Filter by Date'),
            ],
          ),
          const SizedBox(
            height: 5.0,
          ),
          DateTimeField(
            initialDate: DateTime.now(),
            lastDate: DateTime.now(),
            decoration: const InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white),
            mode: DateTimeFieldPickerMode.date,
            onDateSelected: (DateTime value) {
              setState(() {
                logDate = value;
              });
            },
            selectedDate: logDate,
          ),
          const SizedBox(
            height: 5.0,
          ),
          const Divider(
            thickness: 1.0,
          ),
          Column(
            children: entryLogs.isEmpty
                ? [
                    const Text(
                      'No entry logs recorded for this date',
                      style: TextStyle(color: Colors.red),
                    )
                  ]
                : entryLogs.map((log) {
                    return BTEntryLogCard(
                      entryLog: log,
                    );
                  }).toList(),
          )
        ],
      ),
    );
  }
}
