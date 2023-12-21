import 'package:bt_frontend/features/establishment/features/entry_logs/models/log.model.dart';
import 'package:bt_frontend/features/establishment/services/entry_logs.services.dart';

class EntryLogsController {
  EntryLogsServices entryLogsServices = EntryLogsServices();

  Future getEntryLogsToday() async {
    var res = await entryLogsServices.getEntryLogsToday();
    return res;
  }

  Future getEntryLogsByDate({required DateTime date}) async {
    var res = await entryLogsServices.getEntryLogsByDate(date: date);
    return res;
  }

  Future createLog({required Log log}) async {
    var res = await entryLogsServices.createLog(log: log);
    return res;
  }
}
