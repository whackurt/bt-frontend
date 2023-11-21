class Establishment {
  final String name;
  final String contactNo;
  final int type;
  final String cityMunicipality;
  final String barangay;
  String? address1 = '';
  final String oName;
  final String oEmail;
  final String oContactNo;
  final String email;
  final String password;
  final String photoUrl;
  final int userType = 2;

  Establishment(
      {required this.name,
      required this.email,
      required this.password,
      required this.contactNo,
      required this.type,
      required this.cityMunicipality,
      required this.barangay,
      this.address1,
      required this.oName,
      required this.oEmail,
      required this.oContactNo,
      required this.photoUrl});

  factory Establishment.fromJson(Map<String, dynamic> json) {
    return Establishment(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      contactNo: json['contact_number'] ?? '',
      type: json['type_id'] ?? '',
      cityMunicipality: json['city_municipality'] ?? '',
      barangay: json['barangay'] ?? '',
      address1: json['address1'] ?? '',
      oName: json['owner_name'] ?? '',
      oEmail: json['owner_email'] ?? '',
      oContactNo: json['owner_phone'] ?? '',
      photoUrl: json['photo_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'contact_number': contactNo,
      'type_id': type.toString(),
      'city_municipality': cityMunicipality,
      'barangay': barangay,
      'address_1': address1,
      'owner_name': oName,
      'owner_email': oEmail,
      'owner_phone': oContactNo,
      'email': email,
      'password': password,
      'photo_url': photoUrl,
      'user_type': userType.toString(),
    };
  }
}
