// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class BTUserTypeButton extends StatefulWidget {
  final Function()? onPressed;
  final IconData? icon;
  final String? label;

  const BTUserTypeButton({super.key, this.onPressed, this.icon, this.label});

  @override
  State<BTUserTypeButton> createState() => _BTUserTypeButtonState();
}

class _BTUserTypeButtonState extends State<BTUserTypeButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Icon(
                  widget.icon,
                  size: 100.0,
                  color: Colors.grey[700],
                ),
                Text(
                  '${widget.label}',
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          )),
    );
  }
}
