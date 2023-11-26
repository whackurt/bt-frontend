import 'package:flutter/cupertino.dart';

class EstablishmentProfileProvider extends ChangeNotifier {
  Map profileData = {};
  Map estHomeData = {};

  void setProfileData({required Map data}) {
    profileData = data;
    estHomeData['photo_url'] = data['photo_url'];
    estHomeData['name'] = data['name'];
    estHomeData['address_1'] = data['address_1'];
    estHomeData['barangay'] = data['barangay'];
    estHomeData['city_municipality'] = data['city_municipality'];
    notifyListeners();
  }

  void setHomeData({required Map data}) {
    estHomeData = data;
    notifyListeners();
  }
}
