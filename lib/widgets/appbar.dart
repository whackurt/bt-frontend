import 'package:bt_frontend/core/constants/decoration/app_colors.dart';
import 'package:flutter/material.dart';

AppBar appBar({String? title}) {
  title = title ?? '';
  // automaticallyImplyLeading = automaticallyImplyLeading ?? true;

  AppColors appColor = AppColors();

  return AppBar(
    title: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.w600),
    ),
    // automaticallyImplyLeading: automaticallyImplyLeading,
    centerTitle: true,
    flexibleSpace: Container(
      decoration: appColor.linearGradient(),
    ),
  );
}
