import 'dart:convert';

import 'package:bt_frontend/config/api.dart';
import 'package:http/http.dart' as http;

class TouristHubServices {
  Api api = Api();

  Future getTouristSpots() async {
    http.Response response = await http.get(Uri.parse(api.touristSpotUrl));

    Map jsonRes = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      return {"success": true, "data": jsonRes};
    } else {
      return {"success": false, "data": jsonRes};
    }
  }

  Future getEssentialServiceProviders() async {
    http.Response response =
        await http.get(Uri.parse(api.essentialServiceProvidersUrl));

    Map jsonRes = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      return {"success": true, "data": jsonRes};
    } else {
      return {"success": false, "data": jsonRes};
    }
  }

  Future getEmergencyHotlineNumbers() async {
    http.Response response =
        await http.get(Uri.parse(api.emergencyHotlineNumbersUrl));

    Map jsonRes = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      return {"success": true, "data": jsonRes};
    } else {
      return {"success": false, "data": jsonRes};
    }
  }

  Future getSchedules() async {
    http.Response response = await http.get(Uri.parse(api.schedulesUrl));

    Map jsonRes = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      return {"success": true, "data": jsonRes};
    } else {
      return {"success": false, "data": jsonRes};
    }
  }
}
