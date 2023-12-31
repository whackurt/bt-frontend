import 'dart:convert';
import 'dart:io';

import 'package:bt_frontend/config/api.dart';
import 'package:bt_frontend/features/auth/models/establishment.model.dart';
import 'package:bt_frontend/features/auth/models/tourist.model.dart';
import 'package:bt_frontend/features/auth/models/user.model.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  Api api = Api();

  Future loginUser({required User user}) async {
    http.Response response = await http
        .post(Uri.parse('${api.baseUrl}/auth/login'), body: user.toJson());

    Map jsonRes = jsonDecode(response.body) as Map<dynamic, dynamic>;

    if (response.statusCode == 200) {
      return {"success": true, "data": jsonRes};
    } else {
      return {"success": false, "data": jsonRes};
    }
  }

  Future registerTourist({required Tourist tourist}) async {
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

  Future registerEstablishment({required Establishment establishment}) async {
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

  Future uploadImage({required File? imageFile}) async {
    final url = Uri.parse(api.cloudinaryUrl);
    final request = http.MultipartRequest('POST', url);
    request.fields['upload_preset'] = 'vh4uwkje';
    request.files
        .add(await http.MultipartFile.fromPath('file', imageFile!.path));

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseData = await response.stream.toBytes();
      final responseString = String.fromCharCodes(responseData);
      final jsonMap = jsonDecode(responseString);

      return jsonMap['url'];
    }
  }
}
