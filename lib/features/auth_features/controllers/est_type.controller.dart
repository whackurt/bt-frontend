import 'dart:convert';

import 'package:bt_frontend/config/api.dart';
import 'package:http/http.dart' as http;

class EstablishmentTypeController {
  Api api = Api();

  Future getEstTypes() async {
    http.Response response =
        await http.get(Uri.parse('${api.baseUrl}/v1/establishment-type'));

    Map jsonRes = jsonDecode(response.body) as Map<dynamic, dynamic>;

    if (response.statusCode == 200) {
      return {"success": true, "data": jsonRes};
    } else {
      return {"success": false, "data": jsonRes};
    }
  }
}
