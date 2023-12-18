import 'package:bt_frontend/core/constants/decoration/prop_values.dart';
import 'package:bt_frontend/features/tourist/features/feedback_complaints/controllers/complaint.controller.dart';
import 'package:bt_frontend/features/tourist/features/feedback_complaints/screens/widgets/complaint_text.dart';
import 'package:bt_frontend/features/tourist/providers/complaint.provider.dart';
import 'package:bt_frontend/widgets/appbar.dart';
import 'package:bt_frontend/widgets/custom_text_field/readonly_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BTViewComplaint extends StatefulWidget {
  const BTViewComplaint({super.key});

  @override
  State<BTViewComplaint> createState() => _BTViewComplaintState();
}

class _BTViewComplaintState extends State<BTViewComplaint> {
  ComplaintController complaintController = ComplaintController();

  Map involvedEstablishment = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final complaintData = ModalRoute.of(context)!.settings.arguments as Map;
    var complaintProvider =
        Provider.of<ComplaintProvider>(context, listen: true);

    return Scaffold(
      appBar: appBar(title: 'Complaint'),
      backgroundColor: PropValues().main,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BTReadonlyTextField(
              label: 'Status',
              textColor: complaintData['resolved'] == 0
                  ? Colors.red[400]
                  : Colors.green[500],
              text: complaintData['resolved'] == 0 ? 'Pending' : 'Resolved',
            ),
            BTReadonlyTextField(
              label: 'Involved Establishment',
              text: complaintProvider.establishments
                  .where((est) =>
                      est['id'] == complaintData['involved_establishment_id'])
                  .toList()[0]['name'],
            ),
            BTComplaintText(
              fieldTitle: 'Complaint Description',
              value: complaintData['description'],
            ),
            complaintData['resolved'] == 1
                ? BTComplaintText(
                    fieldTitle: 'Response',
                    value: complaintData['response'],
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
