// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bt_frontend/core/constants/decoration/app_colors.dart';
import 'package:bt_frontend/widgets/appbar.dart';
import 'package:bt_frontend/widgets/custom_buttons/full_width_btn.dart';
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

  bool userNotSelected = false;
  String? selectedUser;

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
                    child: userNotSelected
                        ? Text(
                            'Please select a user type',
                            style: TextStyle(
                                fontSize: 15.0, color: Colors.red[600]),
                          )
                        : SizedBox(),
                  ),
                  // user type buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4.0,
                              color: selectedUser == 'Tourist'
                                  ? Colors.indigo
                                  : Color.fromARGB(255, 97, 97, 97)),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedUser = 'Tourist';
                              userNotSelected = false;
                            });
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.person_2_outlined,
                                  size: 100.0,
                                  color: selectedUser == 'Tourist'
                                      ? Colors.indigo
                                      : Color.fromARGB(255, 97, 97, 97),
                                ),
                                Text(
                                  'Tourist',
                                  style: TextStyle(
                                      color: selectedUser == 'Tourist'
                                          ? Colors.indigo
                                          : Color.fromARGB(255, 97, 97, 97),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )),
                    ),
                  ),

                  // user type buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4.0,
                              color: selectedUser == 'Establishment'
                                  ? Colors.indigo
                                  : Color.fromARGB(255, 97, 97, 97)),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedUser = 'Establishment';
                              userNotSelected = false;
                            });
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.person_2_outlined,
                                  size: 100.0,
                                  color: selectedUser == 'Establishment'
                                      ? Colors.indigo
                                      : Color.fromARGB(255, 97, 97, 97),
                                ),
                                Text(
                                  'Establishment',
                                  style: TextStyle(
                                      color: selectedUser == 'Establishment'
                                          ? Colors.indigo
                                          : Color.fromARGB(255, 97, 97, 97),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )),
                    ),
                  ),
                ],
              ),
              BTFullWidthButton(
                onPressed: () {
                  setState(() {
                    userNotSelected = false;
                  });
                  if (selectedUser != '' && selectedUser == 'Tourist') {
                    Navigator.pushNamed(context, '/signup/tourist/create');
                  } else if (selectedUser != '' &&
                      selectedUser == 'Establishment') {
                    Navigator.pushNamed(
                        context, '/signup/establishment/create');
                  } else {
                    setState(() {
                      userNotSelected = true;
                    });
                  }
                },
                height: 50.0,
                child: Text(
                  'Next',
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