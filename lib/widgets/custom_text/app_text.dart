// ignore_for_file: prefer_const_constructors

import 'package:bt_frontend/core/constants/decoration/app_colors.dart';
import 'package:flutter/material.dart';

class AppText {
  AppColors appColor = AppColors();

  Widget title({String? text}) {
    return Text(
      '$text',
      style: TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 30.0,
        color: appColor.titleColor(),
      ),
      maxLines: 5,
    );
  }

  Widget titleWithInstruction(
      {String? title, String? instruction, var context}) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * .85,
                  child: this.title(
                    text: '$title',
                  )),
              SizedBox(
                  width: MediaQuery.of(context).size.width * .85,
                  child: Text(
                    '$instruction',
                    style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.grey[800],
                    ),
                    maxLines: 5,
                  )),
            ],
          ),
        ),
      ],
    );
  }

  Widget heading({String? text}) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            '$text',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
              color: appColor.titleColor(),
            ),
          ),
        ),
      ],
    );
  }

  Widget darkHeading({String? text}) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            '$text',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20.0,
              color: Colors.grey[800],
            ),
          ),
        ),
      ],
    );
  }

  Widget boldHeader({String? text}) {
    return Row(
      children: [
        Text(
          '$text',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25.0),
        ),
      ],
    );
  }

  Widget purpleBoldHeader({String? text}) {
    return Row(
      children: [
        Text(
          '$text',
          style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 25.0,
              color: AppColors().titleColor()),
        ),
      ],
    );
  }

  Widget subHeader({String? text}) {
    return Row(
      children: [
        Text(
          '$text',
          maxLines: 2,
          style: TextStyle(fontSize: 15.0, color: Colors.grey[700]),
        ),
      ],
    );
  }
}
