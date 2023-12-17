import 'dart:io';
import 'package:bt_frontend/config/api.dart';
import 'package:bt_frontend/features/tourist/services/profile.services.dart';

class TouristProfileController {
  Api api = Api();
  TouristProfileServices profileServices = TouristProfileServices();

  Future getTouristHomeData({required String id}) async {
    var res = await profileServices.getTouristHome(id: id);
    return res;
  }

  Future getTouristProfileData({required String id}) async {
    var res = await profileServices.getTouristProfile(id: id);
    return res;
  }

  Future updateTouristProfile({required id, required Map updateData}) async {
    var res = await profileServices.updateTouristProfile(
        id: id, updateData: updateData);
    return res;
  }

  Future updateProfilePicture({required File? imageFile}) async {
    var res = await profileServices.updateTouristPhoto(imageFile: imageFile);
    return res;
  }
}
