class Complaint {
  final int? id;
  final String description;
  final String response;
  final DateTime? incidentDate;
  final int resolved;
  final int? touristId;
  final int? involvedEstablishmentId;

  Complaint({
    this.id,
    required this.description,
    required this.response,
    required this.incidentDate,
    required this.resolved,
    required this.touristId,
    required this.involvedEstablishmentId,
  });

  factory Complaint.fromJson(Map<String, dynamic> json) {
    return Complaint(
      id: json['id'],
      incidentDate: json['date_of_incident'],
      involvedEstablishmentId: json['involved_establishment_id'],
      description: json['description'],
      response: json['response'],
      resolved: json['resolved'],
      touristId: json['tourist_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'resolved': resolved.toString(),
      'tourist_id': touristId.toString(),
      'date_of_incident': incidentDate.toString(),
      'involved_establishment_id': involvedEstablishmentId.toString()
    };
  }
}
