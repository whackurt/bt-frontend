class Tourist {
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String country;
  final String stateProvince;
  final String cityMunicipality;
  final String address1;
  String? address2 = '';
  final String gender;
  final String nationality;
  final String photoUrl;
  final String contactNumber;
  final String email;
  final String password;
  final int userType = 1;

  Tourist({
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.country,
    required this.stateProvince,
    required this.cityMunicipality,
    required this.address1,
    this.address2,
    required this.gender,
    required this.nationality,
    required this.photoUrl,
    required this.contactNumber,
    required this.email,
    required this.password,
  });

  factory Tourist.fromJson(Map<String, dynamic> json) {
    return Tourist(
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      dateOfBirth: json['date_of_birth'] ?? '',
      country: json['country'] ?? '',
      stateProvince: json['state_province'] ?? '',
      cityMunicipality: json['city_municipality'] ?? '',
      address1: json['address_1'] ?? '',
      address2: json['address_2'] ?? '',
      gender: json['gender'] ?? '',
      nationality: json['nationality'] ?? '',
      photoUrl: json['photo_url'] ?? '',
      contactNumber: json['contact_number'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'date_of_birth': dateOfBirth,
      'country': country,
      'state_province': stateProvince,
      'city_municipality': cityMunicipality,
      'address_1': address1,
      'address_2': address2,
      'gender': gender,
      'nationality': nationality,
      'photo_url': photoUrl,
      'contact_number': contactNumber,
      'email': email,
      'password': password,
      'user_type': userType.toString(),
    };
  }
}
