// ignore_for_file: unused_field, prefer_const_constructors

import 'package:bt_frontend/core/constants/decoration/app_colors.dart';
import 'package:bt_frontend/core/constants/decoration/prop_values.dart';
import 'package:flutter/material.dart';

class BTFullWidthButton extends StatefulWidget {
  final double? height;
  final Function()? onPressed;
  final Widget? child;

  const BTFullWidthButton({super.key, this.height, this.onPressed, this.child});

  @override
  State<BTFullWidthButton> createState() => _BTFullWidthButtonState();
}

class _BTFullWidthButtonState extends State<BTFullWidthButton> {
  AppColors appColor = AppColors();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        height: 45.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              PropValues().borderRadius), // Rounded corners
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: const [Colors.blue, Colors.indigo]),
        ),
        child: SizedBox(
          height: widget.height,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: widget.onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              //make color or elevated button transparent
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
