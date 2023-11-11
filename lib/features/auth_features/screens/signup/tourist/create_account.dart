// ignore_for_file: prefer_const_constructors

import 'package:bt_frontend/widgets/appbar.dart';
import 'package:bt_frontend/widgets/custom_buttons/dropdown_btn.dart';
import 'package:bt_frontend/widgets/custom_buttons/full_width_btn.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:bt_frontend/widgets/custom_text_field/password_field.dart';
import 'package:bt_frontend/widgets/custom_text_field/text_field.dart';
import 'package:bt_frontend/widgets/custom_text_field/text_field_with_label.dart';
import 'package:flutter/material.dart';

class TouristCreateAccount extends StatefulWidget {
  const TouristCreateAccount({super.key});

  @override
  State<TouristCreateAccount> createState() => _TouristCreateAccountState();
}

class _TouristCreateAccountState extends State<TouristCreateAccount> {
  AppText apptext = AppText();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Column(
                children: [
                  apptext.titleWithInstruction(
                      context: context,
                      title: 'Create an Account',
                      instruction:
                          'Please enter all necessary information requested below.'),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        apptext.heading(
                          text: 'Basic Information',
                        ),
                        BTTextField(
                          placeholder: 'First Name',
                        ),
                        BTTextField(
                          placeholder: 'Last Name',
                        ),
                        BTDropdownBtn(
                          hint: 'Sex',
                          dropdownValues: const ['Male', 'Female'],
                        ),
                        BTDropdownBtn(
                          hint: 'Nationality',
                          dropdownValues: const [
                            'Filipino',
                            'American',
                            'Australian',
                            'Chinese',
                            'Japanese',
                            'Korean',
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      children: [
                        apptext.heading(text: 'Date of Birth'),
                        const BTDropdownBtn(
                          hint: 'Month',
                          dropdownValues: [
                            'January',
                            'February',
                            'March',
                            'April',
                            'May',
                            'June',
                            'July',
                            'August',
                            'September',
                            'October',
                            'November',
                            'December',
                          ],
                        ),
                        BTDropdownBtn(
                          hint: 'Date',
                          dropdownValues: List<String>.generate(
                              31, (int index) => (1 + index).toString()),
                        ),
                        BTDropdownBtn(
                          hint: 'Year',
                          dropdownValues: List<String>.generate(
                              103, (int index) => (1920 + index).toString()),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      children: [
                        apptext.heading(text: 'Permanent Address'),
                        BTTextField(
                          placeholder: 'Country',
                        ),
                        BTTextField(
                          placeholder: 'Province',
                        ),
                        BTTextField(
                          placeholder: 'City / Municipality',
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      children: [
                        apptext.heading(text: 'Account Details'),
                        BTTextFieldWithLabel(
                          label: 'Email Address',
                          placeholder: 'john@example.com',
                        ),
                        BTPasswordField(
                            label: 'Password', placeholder: '••••••••••'),
                        BTPasswordField(
                            label: 'Confirm Password',
                            placeholder: '••••••••••'),
                      ],
                    ),
                  ),
                ],
              ),
              BTFullWidthButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup/tourist/uploadPic');
                },
                height: 50.0,
                label: 'Proceed',
              )
            ],
          ),
        ),
      ),
    );
  }
}
