// ignore_for_file: prefer_const_constructors, prefer_final_fields, unnecessary_string_interpolations

import 'package:bt_frontend/features/establishment_features/establishment_container.dart';
import 'package:bt_frontend/widgets/appbar.dart';
import 'package:bt_frontend/widgets/custom_buttons/full_width_btn.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:bt_frontend/widgets/custom_text_field/readonly_text_field.dart';
import 'package:flutter/material.dart';

class EstablishmentVerifyDetails extends StatefulWidget {
  const EstablishmentVerifyDetails({super.key});

  @override
  State<EstablishmentVerifyDetails> createState() =>
      _EstablishmentVerifyDetailsState();
}

class _EstablishmentVerifyDetailsState
    extends State<EstablishmentVerifyDetails> {
  AppText appText = AppText();
  String name = 'Kurt Vincent Timajo';

  Map details = {
    'establishment_name': 'Jonard\'s Grill',
    'establishment_type': 'Restaurant',
    "email_address": "jonardsgrill@gmail.com",
    "contact_no": "09123456999",
    "owner_info": {
      "name": "Bhoxs Mapagm4h4l",
      "email": "bhoxszmapagm4h4l@gmail.com",
      "contact_no": "09368903676",
    },
    "location": {
      "municipality": "Catarman",
      "brgy": "Bonbon",
      "complete_address": "Bonbon, Catarman, Camiguin",
    }
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                appText.titleWithInstruction(
                    context: context,
                    title: 'Verify Details',
                    instruction:
                        'Please ensure that all information you entered is correct.'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                        'https://static.vecteezy.com/system/resources/previews/020/865/538/original/main-establishment-icon-design-free-vector.jpg'),
                    backgroundColor: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    children: [
                      BTReadonlyTextField(
                        label: 'Establishment Name',
                        text: '${details['establishment_name']}',
                      ),
                      BTReadonlyTextField(
                        label: 'Establishment Type',
                        text: '${details['establishment_type']}',
                      ),
                      BTReadonlyTextField(
                        label: 'Email Address',
                        text: '${details['email_address']}',
                      ),
                      BTReadonlyTextField(
                        label: 'Contact No.',
                        text: '${details['contact_no']}',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    children: [
                      appText.heading(text: 'Location'),
                      BTReadonlyTextField(
                        label: 'Municipality',
                        text: '${details['location']['municipality']}',
                      ),
                      BTReadonlyTextField(
                        label: 'Barangay',
                        text: '${details['location']['brgy']}',
                      ),
                      BTReadonlyTextField(
                        label: 'Complete Address',
                        text:
                            '${details['location']['brgy']}, ${details['location']['municipality']}, Camiguin',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    children: [
                      appText.heading(text: 'Owner\'s Information'),
                      BTReadonlyTextField(
                        label: 'Name',
                        text: '${details['owner_info']['name']}',
                      ),
                      BTReadonlyTextField(
                        label: 'Email Address',
                        text: '${details['owner_info']['email']}',
                      ),
                      BTReadonlyTextField(
                        label: 'Contact No.',
                        text: '${details['owner_info']['contact_no']}',
                      ),
                    ],
                  ),
                ),
                BTFullWidthButton(
                  onPressed: () {
                    submitSignUp();
                  },
                  height: 50.0,
                  label: 'Submit',
                )
              ]),
        ),
      ),
    );
  }

  void submitSignUp() {
    bool success = true;
    if (success) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => EstablishmentContainer()),
          (route) => false);
    }
  }
}
