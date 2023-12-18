import 'package:bt_frontend/core/constants/decoration/prop_values.dart';
import 'package:bt_frontend/features/tourist/features/feedback_complaints/screens/widgets/resolved_complaint_card.dart';
import 'package:bt_frontend/features/tourist/features/feedback_complaints/screens/write_feedback.dart';
import 'package:bt_frontend/features/tourist/features/feedback_complaints/screens/widgets/pending_complaint_card.dart';
import 'package:bt_frontend/widgets/custom_buttons/full_width_btn.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bt_frontend/features/tourist/providers/complaint.provider.dart';
import 'package:bt_frontend/features/tourist/features/feedback_complaints/controllers/complaint.controller.dart';

class BTFeedbackComplaints extends StatefulWidget {
  const BTFeedbackComplaints({super.key});

  @override
  State<BTFeedbackComplaints> createState() => _BTFeedbackComplaintsState();
}

class _BTFeedbackComplaintsState extends State<BTFeedbackComplaints> {
  ComplaintController complaintController = ComplaintController();

  Future getComplaints() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    await complaintController
        .getComplaints(id: pref.getInt('touristId').toString())
        .then((res) {
      context
          .read<ComplaintProvider>()
          .setComplaints(data: res['data']['complaints']);
    });
  }

  Future getAllEstablishments() async {
    await complaintController.getAllEstablishments().then((res) {
      context
          .read<ComplaintProvider>()
          .setEstablishments(data: res['data']['establishments']);
    });
  }

  @override
  void initState() {
    super.initState();
    getComplaints();
    getAllEstablishments();
  }

  @override
  Widget build(BuildContext context) {
    var complaintProvider =
        Provider.of<ComplaintProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: PropValues().main,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 40.0),
          child: Column(
            children: [
              AppText().titleWithInstruction(
                  context: context,
                  title: 'Your  feedback matters',
                  instruction:
                      'As part of our ongoing efforts to enhance the tourist experience, we invite you to share your feedback or any issues you may have encountered.'),
              BTFullWidthButton(
                height: 45.0,
                onPressed: () {
                  Navigator.push(context, CupertinoPageRoute(
                    builder: (context) {
                      return const BTWriteFeedback();
                    },
                  ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.penToSquare,
                      color: Colors.white,
                      size: 20.0,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Write a Feedback',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: PropValues().btnTextSize),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              AppText().darkHeading(text: "Pending Complaints"),
              const Divider(
                thickness: 1.0,
              ),
              Column(
                children: complaintProvider.complaints
                    .where((complaint) => complaint['resolved'] == 0)
                    .map((complaint) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3.0),
                    child: complaint['resolved'] == 0
                        ? BTPendingComplaintCard(
                            complaint: complaint,
                          )
                        : null,
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 20.0,
              ),
              AppText().darkHeading(text: "Resolved Complaints"),
              const Divider(
                thickness: 1.0,
              ),
              Column(
                children: complaintProvider.complaints
                    .where((complaint) => complaint['resolved'] == 1)
                    .map((complaint) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3.0),
                    child: complaint['resolved'] == 1
                        ? BTResolvedComplaintCard(
                            complaint: complaint,
                          )
                        : null,
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
