import 'dart:io';
import 'package:bt_frontend/config/api.dart';
import 'package:bt_frontend/features/auth/models/establishment.model.dart';
import 'package:bt_frontend/features/auth/models/tourist.model.dart';
import 'package:bt_frontend/features/auth/models/user.model.dart';
import 'package:bt_frontend/features/auth/services/auth.services.dart';

class AuthController {
  Api api = Api();
  AuthServices authServices = AuthServices();

  Future login(User user) async {
    var res = await authServices.loginUser(user: user);

    return res;
  }

  Future registerTourist(Tourist tourist) async {
    var res = await authServices.registerTourist(tourist: tourist);

    return res;
  }

  Future registerEstablishment(Establishment establishment) async {
    var res =
        await authServices.registerEstablishment(establishment: establishment);

    return res;
  }

  Future uploadImage(File? imageFile) async {
    var res = await authServices.uploadImage(imageFile: imageFile);

    return res;
  }
}
