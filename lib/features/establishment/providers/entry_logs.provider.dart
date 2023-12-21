import 'package:flutter/material.dart';

class EntryLogsProvider extends ChangeNotifier {
  List entryLogsToday = [];

  void setEntryLogs({required List data}) {
    entryLogsToday = data;
    notifyListeners();
  }
}
