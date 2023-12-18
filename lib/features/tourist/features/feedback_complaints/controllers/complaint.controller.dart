import 'package:bt_frontend/features/tourist/features/feedback_complaints/models/complaint.model.dart';
import 'package:bt_frontend/features/tourist/services/complaint.services.dart';

class ComplaintController {
  ComplaintServices complaintServices = ComplaintServices();

  Future getComplaints({required String id}) async {
    var res = await complaintServices.getComplaintsByTouristId(id: id);
    return res;
  }

  Future getAllEstablishments() async {
    var res = await complaintServices.getAllEstablishments();
    return res;
  }

  Future getInvolvedEstablishment({required String id}) async {
    var res = await complaintServices.getInvolvedEstablishment(id: id);
    return res;
  }

  Future createComplaint({required Complaint complaint}) async {
    var res = await complaintServices.createComplaint(complaint: complaint);
    return res;
  }
}
