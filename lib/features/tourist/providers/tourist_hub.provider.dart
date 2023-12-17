import 'package:flutter/material.dart';

class TouristHubProvider extends ChangeNotifier {
  List touristSpots = [];
  List essentialServiceProviders = [];
  List schedules = [];
  List hotlines = [];
  Map ferrySchedule = {};
  Map flightSchedule = {};

  void setTouristSpots({required List data}) {
    touristSpots = data;
    notifyListeners();
  }

  void setEssentialServiceProviders({required List data}) {
    essentialServiceProviders = data;
    notifyListeners();
  }

  void setSchedules({required List data}) {
    schedules = data;
    notifyListeners();
  }

  void setHotlines({required List data}) {
    hotlines = data;
    notifyListeners();
  }
}
