import 'package:bt_frontend/core/constants/decoration/prop_values.dart';
import 'package:bt_frontend/features/tourist/features/feedback_complaints/screens/widgets/complaint_text.dart';
import 'package:bt_frontend/widgets/appbar.dart';
import 'package:bt_frontend/widgets/custom_text_field/readonly_text_field.dart';
import 'package:flutter/material.dart';

class BTViewComplaint extends StatefulWidget {
  const BTViewComplaint({super.key});

  @override
  State<BTViewComplaint> createState() => _BTViewComplaintState();
}

class _BTViewComplaintState extends State<BTViewComplaint> {
  @override
  Widget build(BuildContext context) {
    final complaintData = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: appBar(
          title: complaintData['resolved'] == 0
              ? 'Pending Complaint'
              : 'Resolved Complaint'),
      backgroundColor: PropValues().main,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BTReadonlyTextField(
              label: 'Complaint Title',
              text: complaintData['title'],
            ),
            BTReadonlyTextField(
              label: 'Status',
              text: complaintData['resolved'] == 0 ? 'Pending' : 'Resolved',
            ),
            BTReadonlyTextField(
              label: 'Involved Establishment',
              text: complaintData['involved_establishment'],
            ),
            BTComplaintText(
              fieldTitle: 'Complaint Description',
              value: complaintData['description'],
            ),
          ],
        ),
      ),
    );
  }
}
