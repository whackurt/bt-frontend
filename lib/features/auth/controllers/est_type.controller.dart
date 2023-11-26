import 'package:bt_frontend/config/api.dart';
import 'package:bt_frontend/features/auth/services/est_auth.services.dart';

class EstablishmentTypeController {
  Api api = Api();
  EstablishmentAuthServices estAuthServices = EstablishmentAuthServices();

  Future getEstTypes() async {
    var res = await estAuthServices.getEstTypes();

    return res;
  }
}
