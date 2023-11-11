// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bt_frontend/core/constants/decoration/app_colors.dart';
import 'package:bt_frontend/widgets/appbar.dart';
import 'package:bt_frontend/widgets/custom_buttons/full_width_btn.dart';
import 'package:bt_frontend/widgets/custom_buttons/user_type_btn.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:flutter/material.dart';

class SelectUserType extends StatefulWidget {
  const SelectUserType({super.key});

  @override
  State<SelectUserType> createState() => _SelectUserTypeState();
}

class _SelectUserTypeState extends State<SelectUserType> {
  AppColors appColor = AppColors();
  AppText appText = AppText();

  String uType = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: appText.title(text: 'Select User Type'),
              ),
              Column(
                children: [
                  Center(
                    child: Text(
                      uType,
                      style: TextStyle(fontSize: 20.0, color: Colors.indigo),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: BTUserTypeButton(
                      onPressed: () {
                        setState(() {
                          uType = 'Tourist';
                        });
                      },
                      label: 'Tourist',
                      icon: Icons.person_2_outlined,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: BTUserTypeButton(
                      onPressed: () {
                        setState(() {
                          uType = 'Establishment';
                        });
                      },
                      label: 'Establishment',
                      icon: Icons.store_outlined,
                    ),
                  ),
                ],
              ),
              BTFullWidthButton(
                onPressed: () {
                  if (uType != '' && uType == 'Tourist') {
                    Navigator.pushNamed(context, '/signup/tourist/create');
                  } else if (uType != '' && uType == 'Establishment') {
                    Navigator.pushNamed(
                        context, '/signup/establishment/create');
                  } else {
                    setState(() {
                      uType = 'Please select user type.';
                    });
                  }
                },
                height: 50.0,
                label: 'Next',
              )
            ],
          ),
        ),
      ),
    );
  }
}
