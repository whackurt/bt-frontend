import 'package:flutter/cupertino.dart';

class TouristProfileProvider extends ChangeNotifier {
  Map touristData = {};
  Map touristHomeData = {};

  void setTouristData({required Map data}) {
    touristData = data;

    touristHomeData['photo_url'] = '${data['photo_url']}';
    touristHomeData['full_name'] = '${data['first_name']} ${data['last_name']}';
    touristHomeData['address_1'] = data['address_1'];
    touristHomeData['city_municipality'] = data['city_municipality'];
    touristHomeData['state_province'] = data['state_province'];
    touristHomeData['country'] = data['country'];
    touristHomeData['qr_code'] = data['qr_code'];
    notifyListeners();
  }

  void setTouristHomeData({required Map data}) {
    touristHomeData = data;
    notifyListeners();
  }
}
