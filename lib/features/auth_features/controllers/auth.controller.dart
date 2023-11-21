import 'dart:convert';
import 'package:bt_frontend/config/api.dart';
import 'package:bt_frontend/features/auth_features/models/establishment.model.dart';
import 'package:bt_frontend/features/auth_features/models/tourist.model.dart';
import 'package:bt_frontend/features/auth_features/models/user.model.dart';
import 'package:http/http.dart' as http;

class AuthController {
  Api api = Api();

  Future login(User user) async {
    http.Response response = await http
        .post(Uri.parse('${api.baseUrl}/auth/login'), body: user.toJson());

    Map jsonRes = jsonDecode(response.body) as Map<dynamic, dynamic>;

    if (response.statusCode == 200) {
      return {"success": true, "data": jsonRes};
    } else {
      return {"success": false, "data": jsonRes};
    }
  }

  Future registerTourist(Tourist tourist) async {
    http.Response response = await http.post(
        Uri.parse('${api.baseUrl}/auth/register'),
        body: tourist.toJson());

    Map jsonRes = jsonDecode(response.body) as Map<dynamic, dynamic>;

    if (response.statusCode == 201) {
      return {"success": true, "data": jsonRes};
    } else {
      return {"success": false, "data": jsonRes};
    }
  }

  Future registerEstablishment(Establishment establishment) async {
    http.Response response = await http.post(
        Uri.parse('${api.baseUrl}/auth/register'),
        body: establishment.toJson());

    Map jsonRes = jsonDecode(response.body) as Map<dynamic, dynamic>;

    if (response.statusCode == 201) {
      return {"success": true, "data": jsonRes};
    } else {
      return {"success": false, "data": jsonRes};
    }
  }
}
