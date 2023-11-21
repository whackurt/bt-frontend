import 'dart:io';
import 'package:flutter/material.dart';

class TouristAuthProvider extends ChangeNotifier {
  Map registeringTourist = {};
  File? picture;

  void updateData({required Map touristInfo}) {
    registeringTourist = touristInfo;
    notifyListeners();
  }

  void updatePicture({required image}) {
    picture = image;
    notifyListeners();
  }
}
