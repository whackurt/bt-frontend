import 'dart:io';
import 'package:flutter/material.dart';

class EstablishmentAuthProvider extends ChangeNotifier {
  Map registeringEstablishment = {};
  File? picture;
  List establishmentTypes = [];

  void updateData({required Map establishmentInfo}) {
    registeringEstablishment = establishmentInfo;
    notifyListeners();
  }

  void updatePicture({required image}) {
    picture = image;
    notifyListeners();
  }

  void setEstablishmentType({required List establishmentTypes}) {
    this.establishmentTypes = establishmentTypes;
    notifyListeners();
  }
}
