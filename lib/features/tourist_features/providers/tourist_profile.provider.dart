import 'package:flutter/cupertino.dart';

class TouristProfileProvider extends ChangeNotifier {
  Map touristData = {};

  void setTouristData({required Map data}) {
    touristData = data;
    notifyListeners();
  }
}
