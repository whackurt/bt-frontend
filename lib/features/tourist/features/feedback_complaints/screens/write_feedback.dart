import 'package:bt_frontend/core/constants/decoration/prop_values.dart';
import 'package:bt_frontend/widgets/custom_buttons/dropdown_btn.dart';
import 'package:bt_frontend/widgets/custom_buttons/full_width_btn.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:bt_frontend/widgets/wrapper/content_wrapper.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BTWriteFeedback extends StatefulWidget {
  const BTWriteFeedback({super.key});

  @override
  State<BTWriteFeedback> createState() => _BTWriteFeedbackState();
}

List<String> feedbackType = ["Feedback", "Complaint"];

class _BTWriteFeedbackState extends State<BTWriteFeedback> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController commentsController = TextEditingController();

  DateTime? incidentDate;
  String selectedFeedbackType = feedbackType[0];

  List<String> rate = ["1", "2", "3", "4", "5"];
  String? selectedEstablishment = "";
  List<String> establishments = [
    "DL Bonita Merchandise",
    "Tres Marias Cafe",
    "Balai sa Baibai",
    "Villa Paraiso",
    "GV Hotel",
    "Others"
  ];

  @override
  Widget build(BuildContext context) {
    return BTContentWrapper(
      onRefresh: () async {},
      title: 'Feedback',
      child: Column(children: [
        Row(
          children: [
            FaIcon(
              FontAwesomeIcons.penToSquare,
              size: 35.0,
              color: Colors.red[400],
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText().purpleBoldHeader(text: 'Write a Feedback'),
                  AppText().subHeader(
                    context: context,
                    text: 'Share Your Thoughts',
                  ),
                ],
              ),
            )
          ],
        ),
        const Divider(),
        const SizedBox(
          height: 20.0,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Select Feedback Type',
              style: TextStyle(color: Colors.indigo),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Radio(
                  value: feedbackType[0],
                  groupValue: selectedFeedbackType,
                  onChanged: (value) {
                    setState(() {
                      selectedFeedbackType = value.toString();
                    });
                  },
                ),
                const Text(
                  'Feedback',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: feedbackType[1],
                  groupValue: selectedFeedbackType,
                  onChanged: (value) {
                    setState(() {
                      selectedFeedbackType = value.toString();
                    });
                  },
                ),
                const Text(
                  'Complaint',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
        Container(
            child: selectedFeedbackType == feedbackType[0]
                ? Column(
                    children: [
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                            child: Text(
                              'Overall Experience*',
                              style: TextStyle(color: Colors.indigo),
                            ),
                          ),
                        ],
                      ),
                      BTDropdownBtn(
                        hint: 'Rate your overall experience',
                        dropdownValues: rate,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                            child: Text(
                              'Comments/Suggestions',
                              style: TextStyle(color: Colors.indigo),
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: commentsController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  PropValues().borderRadius),
                              borderSide: BorderSide.none),
                          hintText: 'Enter your comments/suggestions',
                          filled: true,
                          fillColor: PropValues().secondary,
                        ),
                        maxLines: 5,
                      ),
                    ],
                  )
                : Column(
                    children: [
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                            child: Text(
                              'Involved Establishment *',
                              style: TextStyle(color: Colors.indigo),
                            ),
                          ),
                        ],
                      ),
                      BTDropdownBtn(
                        hint: 'Choose the Involved Establishment',
                        dropdownValues: establishments,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                            child: Text(
                              'Date of Incident *',
                              style: TextStyle(color: Colors.indigo),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 55,
                        decoration: BoxDecoration(
                          color: PropValues().secondary,
                          borderRadius:
                              BorderRadius.circular(PropValues().borderRadius),
                        ),
                        child: DateTimeField(
                          lastDate: DateTime.now(),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.transparent,
                          ),
                          mode: DateTimeFieldPickerMode.date,
                          onDateSelected: (DateTime value) {
                            setState(() {
                              incidentDate = value;
                            });
                          },
                          selectedDate: incidentDate,
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                            child: Text(
                              'Description *',
                              style: TextStyle(color: Colors.indigo),
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: commentsController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  PropValues().borderRadius),
                              borderSide: BorderSide.none),
                          hintText:
                              'Desribe your complaints and your comments.',
                          filled: true,
                          fillColor: PropValues().secondary,
                        ),
                        maxLines: 5,
                      ),
                    ],
                  )),
        const SizedBox(
          height: 25.0,
        ),
        BTFullWidthButton(
          height: 45.0,
          onPressed: () {
            showDialog(
                context: context,
                builder: ((context) {
                  return AlertDialog(
                    title: const Text(
                      'Submit Feedback',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    content:
                        const Text('Are you sure you want to submit feedback?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the alert dialog
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the alert dialog
                        },
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.green[700]),
                        ),
                      ),
                    ],
                  );
                }));
          },
          child: Text(
            'Submit',
            style: TextStyle(
                color: Colors.white, fontSize: PropValues().btnTextSize),
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
      ]),
    );
  }
}
