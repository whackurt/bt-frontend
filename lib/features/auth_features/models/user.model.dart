class User {
  final String email;
  final String password;
  final int userType; // New field for user type

  User({required this.email, required this.password, required this.userType});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      userType: json['user_type'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'user_type': userType.toString(),
    };
  }
}
