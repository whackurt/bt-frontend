import 'package:flutter/material.dart';

class AppColors {
  final int textShade = 800;

  Color? titleColor() {
    return Colors.indigo;
  }

  BoxDecoration btnLinearGradient() {
    return const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.indigo]));
  }

  BoxDecoration linearGradient() {
    return const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.indigo]));
  }
}
