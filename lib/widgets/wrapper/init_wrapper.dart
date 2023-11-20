// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:bt_frontend/core/constants/decoration/app_colors.dart';
import 'package:flutter/material.dart';

Widget InitWrapper({Widget? child}) {
  AppColors appColor = AppColors();
  return Container(
    decoration: appColor.linearGradient(),
    child: child,
  );
}
