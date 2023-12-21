import 'dart:convert';

import 'package:bt_frontend/config/api.dart';
import 'package:bt_frontend/features/establishment/features/entry_logs/models/log.model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class EntryLogsServices {
  Api api = Api();

  Future getEntryLogsToday() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    DateTime now = DateTime.now();

    String today = now.toString().substring(0, 10);

    http.Response response = await http.get(Uri.parse(
        '${api.logsUrl}?date=$today&establishment_id=${pref.getInt('establishmentId')}'));

    Map jsonRes = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      return {"success": true, "data": jsonRes};
    } else {
      return {"success": false, "data": jsonRes};
    }
  }

  Future getEntryLogsByDate({required DateTime date}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    DateTime dateToGet = date;

    String logDate = dateToGet.toString().substring(0, 10);

    http.Response response = await http.get(Uri.parse(
        '${api.logsUrl}?date=$logDate&establishment_id=${pref.getInt('establishmentId')}'));

    Map jsonRes = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      return {"success": true, "data": jsonRes};
    } else {
      return {"success": false, "data": jsonRes};
    }
  }

  Future createLog({required Log log}) async {
    http.Response response =
        await http.post(Uri.parse('${api.logsUrl}/create'), body: log.toJson());

    Map jsonRes = jsonDecode(response.body) as Map<dynamic, dynamic>;
    print(jsonRes);
    if (response.statusCode == 201) {
      return {"success": true, "data": jsonRes};
    } else {
      return {"success": false, "data": jsonRes};
    }
  }
}
