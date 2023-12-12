// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bt_frontend/core/constants/decoration/app_colors.dart';
import 'package:bt_frontend/widgets/custom_buttons/full_width_btn.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:bt_frontend/widgets/wrapper/content_wrapper.dart';
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
    return BTContentWrapper(
      onRefresh: () async {
        // getTouristData();
      },
      title: '',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: appText.title(text: 'Select User Type'),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .15,
          ),
          Column(
            children: [
              Center(
                child: userNotSelected
                    ? Text(
                        'Please select a user type',
                        style:
                            TextStyle(fontSize: 15.0, color: Colors.red[600]),
                      )
                    : SizedBox(),
              ),
              // user type buttons
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedUser = 'Tourist';
                    userNotSelected = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  backgroundColor:
                      Colors.white, // Set the background color to white
                ),
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
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedUser = 'Establishment';
                    userNotSelected = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  backgroundColor:
                      Colors.white, // Set the background color to white
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.domain,
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
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .20,
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
                Navigator.pushNamed(context, '/signup/establishment/create');
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
    );
  }
}
