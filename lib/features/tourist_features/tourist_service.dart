import 'dart:convert';
import 'package:bt_frontend/config/api.dart';
import 'package:http/http.dart' as http;

class TouristService {
  Api api = Api();

  Future getTouristById({required String id}) async {
    http.Response response =
        await http.get(Uri.parse('${api.touristBaseUrl}/$id/home'));

    Map jsonRes = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      return {"success": true, "data": jsonRes};
    } else {
      return {"success": false, "data": jsonRes};
    }
  }
}
