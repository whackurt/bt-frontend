import 'dart:typed_data';

import 'package:flutter/material.dart';

class TouristAuthProvider extends ChangeNotifier {
  Map registeringTourist = {};
  Uint8List? picture;

  void updateData({required Map touristInfo}) {
    registeringTourist = touristInfo;
    notifyListeners();
  }

  void updatePicture({required image}) {
    picture = image;
  }
}
