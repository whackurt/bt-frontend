import 'package:bt_frontend/widgets/appbar.dart';
import 'package:bt_frontend/widgets/custom_buttons/dropdown_btn.dart';
import 'package:bt_frontend/widgets/custom_buttons/full_width_btn.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: appBar(title: 'Feedback'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(children: [
            AppText().title(text: 'Write a Feedback'),
            const SizedBox(
              height: 20.0,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Select Feedback Type',
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
                                child: Text('Overall Experience*'),
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
                                child: Text('Comments/Suggestions'),
                              ),
                            ],
                          ),
                          TextField(
                            controller: commentsController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter your comments/suggestions',
                              filled: true,
                              fillColor: Colors.white,
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
                                child: Text('Involved Establishment *'),
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
                                child: Text('Date of Incident *'),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1.0, color: Colors.grey),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0),
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
                                child: Text('Description *'),
                              ),
                            ],
                          ),
                          TextField(
                            controller: commentsController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText:
                                  'Desribe your complaints and your comments.',
                              filled: true,
                              fillColor: Colors.white,
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
              label: 'Submit',
              onPressed: () {
                showDialog(
                    context: context,
                    builder: ((context) {
                      return AlertDialog(
                        title: const Text(
                          'Submit Feedback',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        content: const Text(
                            'Are you sure you want to submit feedback?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pop(); // Close the alert dialog
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pop(); // Close the alert dialog
                            },
                            child: const Text('Submit'),
                          ),
                        ],
                      );
                    }));
              },
            ),
            const SizedBox(
              height: 30.0,
            ),
          ]),
        ),
      ),
    );
  }
}
