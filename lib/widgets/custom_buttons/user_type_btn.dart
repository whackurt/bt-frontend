// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bt_frontend/core/constants/decoration/prop_values.dart';
import 'package:flutter/material.dart';

class BTUserTypeButton extends StatefulWidget {
  final Function()? onPressed;
  final IconData? icon;
  final String? label;
  final IconData? iconData;

  const BTUserTypeButton(
      {super.key, this.onPressed, this.icon, this.label, this.iconData});

  @override
  State<BTUserTypeButton> createState() => _BTUserTypeButtonState();
}

class _BTUserTypeButtonState extends State<BTUserTypeButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(PropValues().borderRadius),
        ),
        backgroundColor: Color.fromARGB(
            255, 247, 247, 247), // Set the background color to white
      ),
      child: Column(
        children: [
          Icon(
            widget.iconData,
            size: 100.0,
            // color: selectedUser == 'Tourist'
            //     ? Colors.indigo
            //     : Color.fromARGB(255, 97, 97, 97),
          ),
          Text(
            'Tourist',
            style: TextStyle(
              // color: selectedUser == 'Tourist'
              //     ? Colors.indigo
              //     : Color.fromARGB(255, 97, 97, 97),
              fontSize: 15.0,
            ),
          )
        ],
      ),
    );
  }
}
