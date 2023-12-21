class Log {
  final String qrCode;
  final DateTime dateTime;
  final int? touristId;
  final int? establishmentId;

  Log({
    required this.qrCode,
    required this.dateTime,
    this.touristId,
    required this.establishmentId,
  });

  factory Log.fromJson(Map<String, dynamic> json) {
    return Log(
      qrCode: json['qr_code'],
      dateTime: DateTime.parse(json['date_time']),
      touristId: json['tourist_id'],
      establishmentId: json['establishment_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'qr_code': qrCode,
      'date_time': dateTime.toIso8601String(),
      'establishment_id': establishmentId.toString(),
    };
  }
}
