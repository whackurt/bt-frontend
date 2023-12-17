import 'package:bt_frontend/features/tourist/services/tourist_hub.services.dart';

class TouristHubController {
  TouristHubServices touristHubServices = TouristHubServices();

  Future getTouristSpots() async {
    var res = await touristHubServices.getTouristSpots();
    return res;
  }

  Future getEssentialServiceProviders() async {
    var res = await touristHubServices.getEssentialServiceProviders();
    return res;
  }

  Future getEmergencyHotlineNumbers() async {
    var res = await touristHubServices.getEmergencyHotlineNumbers();
    return res;
  }

  Future getSchedules() async {
    var res = await touristHubServices.getSchedules();
    return res;
  }
}
