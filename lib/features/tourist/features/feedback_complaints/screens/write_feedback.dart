import 'package:bot_toast/bot_toast.dart';
import 'package:bt_frontend/core/constants/decoration/prop_values.dart';
import 'package:bt_frontend/features/tourist/features/feedback_complaints/controllers/complaint.controller.dart';
import 'package:bt_frontend/features/tourist/features/feedback_complaints/controllers/feedback.controller.dart';
import 'package:bt_frontend/features/tourist/features/feedback_complaints/models/complaint.model.dart';
import 'package:bt_frontend/features/tourist/features/feedback_complaints/models/feedback.model.dart';
import 'package:bt_frontend/features/tourist/providers/complaint.provider.dart';
import 'package:bt_frontend/widgets/custom_buttons/full_width_btn.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:bt_frontend/widgets/wrapper/content_wrapper.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BTWriteFeedback extends StatefulWidget {
  const BTWriteFeedback({super.key});

  @override
  State<BTWriteFeedback> createState() => _BTWriteFeedbackState();
}

List<String> feedbackType = ["Feedback", "Complaint"];

class _BTWriteFeedbackState extends State<BTWriteFeedback> {
  final TextEditingController complaintDescriptionController =
      TextEditingController();
  final TextEditingController commentsController = TextEditingController();

  FeedbackController feedbackController = FeedbackController();
  ComplaintController complaintController = ComplaintController();

  DateTime? incidentDate;
  String selectedFeedbackType = feedbackType[0];
  final _complaintKey = GlobalKey<FormState>();

  List<String> rate = ["1", "2", "3", "4", "5"];

  String? selectedEstablishment = "";
  String? selectedRating;
  String? involvedEstablishment;

  bool loading = false;
  bool emptyRating = false;
  bool emptyEstablishment = false;
  bool incompleteComplaint = false;
  bool success = false;

  Future submitFeedback() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      loading = true;
      success = false;
    });
    await feedbackController
        .createFeedback(
      feedback: FeedbackModel(
          rating: int.parse(selectedRating ?? "0"),
          touristId: pref.getInt('touristId'),
          commentSuggestion: commentsController.text.toString()),
    )
        .then((res) {
      if (res['success']) {
        BotToast.showText(text: 'Feedback successful.');
        setState(() {
          success = true;
          selectedRating = null;
        });
        commentsController.clear();
      }

      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          success = false;
        });
      });
      setState(() {
        loading = false;
      });
    });
  }

  Future submitComplaint() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      loading = true;
      success = false;
    });

    await complaintController
        .createComplaint(
            complaint: Complaint(
      response: '',
      resolved: 0,
      incidentDate: incidentDate,
      touristId: pref.getInt('touristId'),
      involvedEstablishmentId: int.parse(involvedEstablishment ?? "0"),
      description: complaintDescriptionController.text.toString(),
    ))
        .then((res) {
      if (res['success']) {
        BotToast.showText(text: 'Complaint suubmitted.');
        setState(() {
          success = true;
        });
      }

      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          success = false;
        });
      });

      setState(() {
        loading = false;
      });
    });

    await complaintController
        .getComplaints(id: pref.getInt('touristId').toString())
        .then((res) {
      context
          .read<ComplaintProvider>()
          .setComplaints(data: res['data']['complaints']);
    });
  }

  @override
  Widget build(BuildContext context) {
    var complaintProvider =
        Provider.of<ComplaintProvider>(context, listen: true);

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
                      incompleteComplaint = false;
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
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                PropValues().borderRadius),
                            color: PropValues().secondary,
                          ),
                          child: DropdownButton<String>(
                            value: selectedRating,
                            underline: Container(),
                            isExpanded: true,
                            hint: const Text('Rate your overall experience'),
                            onChanged: (newValue) {
                              setState(() {
                                selectedRating = newValue;
                                emptyRating = false;
                              });
                            },
                            items: rate
                                .map<DropdownMenuItem<String>>((String rating) {
                              return DropdownMenuItem<String>(
                                value: rating,
                                child: Text(rating),
                              );
                            }).toList(),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            iconSize: 30.0,
                            dropdownColor: Colors.white,
                          ),
                        ),
                      ),
                      emptyRating
                          ? Row(
                              children: [
                                Text(
                                  'Rating is required.',
                                  style: TextStyle(
                                      color: Colors.red[400], fontSize: 12.0),
                                ),
                              ],
                            )
                          : const SizedBox(),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                PropValues().borderRadius),
                            color: PropValues().secondary,
                          ),
                          child: DropdownButton<String>(
                            value: involvedEstablishment,
                            underline: Container(),
                            isExpanded: true,
                            hint: const Text('Choose establishment'),
                            onChanged: (newValue) {
                              setState(() {
                                involvedEstablishment = newValue;
                                emptyEstablishment = false;
                              });
                            },
                            items: complaintProvider.establishments
                                .map<DropdownMenuItem<String>>((est) {
                              return DropdownMenuItem<String>(
                                value: '${est['id']}',
                                child: Text('${est['name']}'),
                              );
                            }).toList(),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            iconSize: 30.0,
                            dropdownColor: Colors.white,
                          ),
                        ),
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
                        child: Center(
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
                      Form(
                        key: _complaintKey,
                        child: TextFormField(
                          controller: complaintDescriptionController,
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
                          validator: (value) => (value!.isEmpty)
                              ? 'Description is required.'
                              : null,
                          maxLines: 5,
                        ),
                      ),
                    ],
                  )),
        const SizedBox(
          height: 25.0,
        ),
        success
            ? Text(
                'Feedback/Complaint submitted successfully.',
                style: TextStyle(color: Colors.green[500]),
              )
            : const SizedBox(),
        incompleteComplaint
            ? Text(
                'All fields are required.',
                style: TextStyle(color: Colors.red[400]),
              )
            : const SizedBox(),
        BTFullWidthButton(
          height: 45.0,
          onPressed: () {
            setState(() {
              emptyRating = false;
              emptyEstablishment = true;
              incompleteComplaint = false;
              success = false;
            });

            if (selectedFeedbackType == feedbackType[0]) {
              if (selectedRating == null) {
                setState(() {
                  emptyRating = true;
                });
                return;
              }
              submitFeedback();
            }

            if (selectedFeedbackType == feedbackType[1]) {
              if (involvedEstablishment == null ||
                  incidentDate == null ||
                  !_complaintKey.currentState!.validate()) {
                setState(() {
                  incompleteComplaint = true;
                });
                return;
              }

              submitComplaint();
            }
          },
          child: loading
              ? const SpinKitRing(
                  color: Colors.white,
                  lineWidth: 3.0,
                  size: 25.0,
                )
              : Text(
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
