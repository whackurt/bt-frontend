import 'package:bt_frontend/core/constants/decoration/prop_values.dart';
import 'package:bt_frontend/features/tourist/features/feedback_complaints/screens/widgets/resolved_complaint_card.dart';
import 'package:bt_frontend/features/tourist/features/feedback_complaints/screens/write_feedback.dart';
import 'package:bt_frontend/features/tourist/features/feedback_complaints/screens/widgets/pending_complaint_card.dart';
import 'package:bt_frontend/widgets/custom_buttons/full_width_btn.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BTFeedbackComplaints extends StatefulWidget {
  const BTFeedbackComplaints({super.key});

  @override
  State<BTFeedbackComplaints> createState() => _BTFeedbackComplaintsState();
}

class _BTFeedbackComplaintsState extends State<BTFeedbackComplaints> {
  List<Map<String, dynamic>> complaintsData = [
    {
      "id": "5bf142459b72e12b2b1b2cd",
      "resolved": 0,
      "involved_establishment": "Ardent Hot Spring",
      "title": "The CR at Ardent Hot Spring is do dirty.",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    },
    {
      "id": "5bf142459b72e12b2b1b278",
      "resolved": 0,
      "involved_establishment": "DL Bonita Merchandise",
      "title": "Angry Cashier at DL Bonita Catarman",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    },
    {
      "id": "5bf142459b72e12b2b1b2cd",
      "resolved": 1,
      "involved_establishment": "GV Hotel Camiguin",
      "title": "GV Hotel staff got inlove with me",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    }
  ];

  @override
  Widget build(BuildContext context) {
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
                children: complaintsData.map((complaint) {
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
                children: complaintsData.map((complaint) {
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
