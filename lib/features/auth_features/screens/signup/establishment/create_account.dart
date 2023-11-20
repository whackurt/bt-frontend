// ignore_for_file: prefer_const_constructors

import 'package:bt_frontend/widgets/appbar.dart';
import 'package:bt_frontend/widgets/custom_buttons/dropdown_btn.dart';
import 'package:bt_frontend/widgets/custom_buttons/full_width_btn.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:bt_frontend/widgets/custom_text_field/password_field.dart';
import 'package:bt_frontend/widgets/custom_text_field/text_field.dart';
import 'package:bt_frontend/widgets/custom_text_field/text_field_with_label.dart';
import 'package:flutter/material.dart';

class EstablishmentCreateAccount extends StatefulWidget {
  const EstablishmentCreateAccount({super.key});

  @override
  State<EstablishmentCreateAccount> createState() =>
      _EstablishmentCreateAccountState();
}

class _EstablishmentCreateAccountState
    extends State<EstablishmentCreateAccount> {
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
                          placeholder: 'Establishment Name',
                        ),
                        BTTextField(
                          placeholder: 'Contact Number',
                        ),
                        BTDropdownBtn(
                          hint: 'Establishment Type',
                          dropdownValues: const [
                            'Cafe',
                            'ATM',
                            'Convenience Store',
                            'Mall'
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      children: [
                        apptext.heading(text: 'Location'),
                        BTTextField(
                          placeholder: 'City / Municipality',
                        ),
                        BTTextField(
                          placeholder: 'Barangay',
                        ),
                        BTTextField(
                          placeholder: 'Complete Address',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        apptext.heading(
                          text: 'Owner\'s Information',
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                            'Business Owner, Manager or Local Chief Executive/Authorized Representative'),
                        SizedBox(
                          height: 8.0,
                        ),
                        BTTextField(
                          placeholder: 'Name of Owner',
                        ),
                        BTTextField(
                          placeholder: 'Owner\'s Email Address',
                        ),
                        BTTextField(
                          placeholder: 'Owner\'s Contact Number',
                        ),
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
                  Navigator.pushNamed(
                      context, '/signup/establishment/uploadPic');
                },
                height: 50.0,
                child: Text(
                  'Proceed',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
