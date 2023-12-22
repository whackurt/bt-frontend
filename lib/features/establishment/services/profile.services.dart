import 'dart:convert';
import 'dart:io';

import 'package:bt_frontend/config/api.dart';
import 'package:http/http.dart' as http;

class EstablishmentProfileServices {
  Api api = Api();

  Future getEstablishmentHomeData({required String id}) async {
    http.Response response =
        await http.get(Uri.parse('${api.establishmentBaseUrl}/$id/home'));

    Map jsonRes = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      return {"success": true, "data": jsonRes};
    } else {
      return {"success": false, "data": jsonRes};
    }
  }

  Future getEstablishmentProfile({required String id}) async {
    http.Response response =
        await http.get(Uri.parse('${api.establishmentBaseUrl}/$id/profile'));

    Map jsonRes = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      return {"success": true, "data": jsonRes};
    } else {
      return {"success": false, "data": jsonRes};
    }
  }

  Future updateEstablishmentProfile(
      {required String id, required Map updateData}) async {
    http.Response response = await http.put(
        Uri.parse('${api.establishmentBaseUrl}/$id/profile/update'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(updateData));

    Map jsonRes = jsonDecode(response.body) as Map<dynamic, dynamic>;

    if (response.statusCode == 200) {
      return {"success": true, "data": jsonRes};
    } else {
      return {"success": false, "data": jsonRes};
    }
  }

  Future updateEstablishmentPhoto({required File? imageFile}) async {
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
