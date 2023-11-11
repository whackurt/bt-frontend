// ignore_for_file: unused_field, prefer_const_constructors

import 'package:bt_frontend/core/constants/decoration/app_colors.dart';
import 'package:flutter/material.dart';

class BTFullWidthButton extends StatefulWidget {
  final double? height;
  final Function()? onPressed;
  final String? label;

  const BTFullWidthButton({super.key, this.height, this.onPressed, this.label});

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
        height: 35.0,
        decoration: appColor.btnLinearGradient(),
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
            child: Text(
              '${widget.label}',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0),
            ),
          ),
        ),
      ),
    );
  }
}
