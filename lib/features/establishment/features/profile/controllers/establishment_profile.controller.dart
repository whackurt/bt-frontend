import 'dart:io';

import 'package:bt_frontend/config/api.dart';
import 'package:bt_frontend/features/establishment/services/profile.services.dart';

class EstablishmentProfileController {
  Api api = Api();
  EstablishmentProfileServices profileServices = EstablishmentProfileServices();

  Future getEstHomeData({required String id}) async {
    var res = await profileServices.getEstablishmentHomeData(id: id);
    return res;
  }

  Future getEstProfileData({required String id}) async {
    var res = await profileServices.getEstablishmentProfile(id: id);
    return res;
  }

  Future updateEstProfile({required id, required Map updateData}) async {
    var res = await profileServices.updateEstablishmentProfile(
        id: id, updateData: updateData);
    return res;
  }

  Future updateEstPicture({required File? imageFile}) async {
    var res =
        await profileServices.updateEstablishmentPhoto(imageFile: imageFile);
    return res;
  }
}
