import 'package:flutter/cupertino.dart';

class EstablishmentProfileProvider extends ChangeNotifier {
  Map profileData = {};

  void setProfileData(Map data) {
    profileData = data;
    notifyListeners();
  }
}
