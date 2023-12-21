import 'package:flutter/material.dart';

class AppData {
  Widget appNameLight() {
    return const Column(
      children: [
        Text(
          'Camiguin',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'PoppinsLight', fontSize: 15.0, color: Colors.white),
        ),
        Text(
          'Bantay Turista',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'PoppinsSemiBold',
              fontSize: 30.0,
              color: Colors.white),
        ),
      ],
    );
  }

  Widget appNameDark() {
    return const Column(
      children: [
        Text(
          'Camiguin',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'PoppinsLight', fontSize: 15.0, color: Colors.indigo),
        ),
        Text(
          'Bantay Turista',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'PoppinsSemiBold',
              fontSize: 30.0,
              color: Colors.indigo),
        ),
      ],
    );
  }
}
