// ignore_for_file: prefer_const_constructors, prefer_final_fields, unnecessary_string_interpolations

import 'package:bt_frontend/features/tourist_features/tourist_container.dart';
import 'package:bt_frontend/widgets/appbar.dart';
import 'package:bt_frontend/widgets/custom_buttons/full_width_btn.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:bt_frontend/widgets/custom_text_field/readonly_text_field.dart';
import 'package:flutter/material.dart';

class TouristVerifyDetails extends StatefulWidget {
  const TouristVerifyDetails({super.key});

  @override
  State<TouristVerifyDetails> createState() => _TouristVerifyDetailsState();
}

class _TouristVerifyDetailsState extends State<TouristVerifyDetails> {
  AppText appText = AppText();
  String name = 'Kurt Vincent Timajo';

  Map details = {
    'name': 'Lambert Jonard Dela Cruz',
    'sex': 'M',
    'nationality': 'Filipino',
    'birth_date': 'August 12, 1998',
    'email': 'misteryosow@gmail.com',
    'address': {
      "country": "Philippines",
      "province": "Misamis Oriental",
      "city_municipality": "Cagayan de Oro City"
    }
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        physics: PageScrollPhysics(),
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
                        'https://cdn.icon-icons.com/icons2/2643/PNG/512/male_boy_person_people_avatar_icon_159358.png'),
                    backgroundColor: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    children: [
                      BTReadonlyTextField(
                        label: 'Name',
                        text: '${details['name']}',
                      ),
                      BTReadonlyTextField(
                        label: 'Sex',
                        text: '${details['sex']}',
                      ),
                      BTReadonlyTextField(
                        label: 'Nationality',
                        text: '${details['nationality']}',
                      ),
                      BTReadonlyTextField(
                        label: 'Date of Birth',
                        text: '${details['birth_date']}',
                      ),
                      BTReadonlyTextField(
                        label: 'Email Address',
                        text: '${details['email']}',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    children: [
                      appText.heading(text: 'Permanent Address'),
                      BTReadonlyTextField(
                        label: 'Country',
                        text: '${details['address']['country']}',
                      ),
                      BTReadonlyTextField(
                        label: 'Provine',
                        text: '${details['address']['province']}',
                      ),
                      BTReadonlyTextField(
                        label: 'City/Municipality',
                        text: '${details['address']['city_municipality']}',
                      ),
                    ],
                  ),
                ),
                BTFullWidthButton(
                  onPressed: submitSignUp,
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
          MaterialPageRoute(builder: (context) => TouristContainer()),
          (route) => false);
    }
  }
}
