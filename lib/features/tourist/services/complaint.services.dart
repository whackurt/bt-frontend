import 'dart:convert';
import 'package:bt_frontend/config/api.dart';
import 'package:bt_frontend/features/tourist/features/feedback_complaints/models/complaint.model.dart';
import 'package:http/http.dart' as http;

class ComplaintServices {
  Api api = Api();

  Future getComplaintsByTouristId({required String id}) async {
    http.Response response =
        await http.get(Uri.parse('${api.complaintsUrl}/$id'));

    Map jsonRes = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      return {"success": true, "data": jsonRes};
    } else {
      return {"success": false, "data": jsonRes};
    }
  }

  Future getAllEstablishments() async {
    http.Response response =
        await http.get(Uri.parse(api.establishmentBaseUrl));

    Map jsonRes = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      return {"success": true, "data": jsonRes};
    } else {
      return {"success": false, "data": jsonRes};
    }
  }

  Future getInvolvedEstablishment({required String id}) async {
    http.Response response =
        await http.get(Uri.parse('${api.establishmentBaseUrl}/$id'));

    Map jsonRes = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      return {"success": true, "data": jsonRes};
    } else {
      return {"success": false, "data": jsonRes};
    }
  }

  Future createComplaint({required Complaint complaint}) async {
    http.Response response = await http.post(
        Uri.parse('${api.complaintsUrl}/create'),
        body: complaint.toJson());

    Map jsonRes = jsonDecode(response.body) as Map<dynamic, dynamic>;

    if (response.statusCode == 201) {
      return {"success": true, "data": jsonRes};
    } else {
      return {"success": false, "data": jsonRes};
    }
  }
}
