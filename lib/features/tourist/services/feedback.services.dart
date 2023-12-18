import 'dart:convert';

import 'package:bt_frontend/config/api.dart';
import 'package:bt_frontend/features/tourist/features/feedback_complaints/models/feedback.model.dart';
import 'package:http/http.dart' as http;

class FeedbackServices {
  Api api = Api();

  Future createFeedback({required FeedbackModel feedback}) async {
    http.Response response = await http
        .post(Uri.parse('${api.feedbacksUrl}/create'), body: feedback.toJson());

    Map jsonRes = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 201) {
      return {"success": true, "data": jsonRes};
    } else {
      return {"success": false, "data": jsonRes};
    }
  }
}
