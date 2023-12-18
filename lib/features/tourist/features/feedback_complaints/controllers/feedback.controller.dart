import 'package:bt_frontend/features/tourist/features/feedback_complaints/models/feedback.model.dart';
import 'package:bt_frontend/features/tourist/services/feedback.services.dart';

class FeedbackController {
  FeedbackServices feedbackServices = FeedbackServices();

  Future createFeedback({required FeedbackModel feedback}) async {
    var res = await feedbackServices.createFeedback(feedback: feedback);
    return res;
  }
}
