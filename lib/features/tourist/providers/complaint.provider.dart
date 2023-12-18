import 'package:flutter/material.dart';

class ComplaintProvider extends ChangeNotifier {
  List complaints = [];
  List establishments = [];

  void setComplaints({required List data}) {
    complaints = data;
    notifyListeners();
  }

  void setEstablishments({required List data}) {
    establishments = data;
    notifyListeners();
  }
}
