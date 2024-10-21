class UserModel {
  final String userId;
  final String userType;
  final String name;
  final String email;
  final String password;

  // Constructor to initialize the model
  UserModel({
    required this.userId,
    required this.userType,
    required this.name,
    required this.email,
    required this.password,
  });

  // Factory method to create a UserModel from JSON (Map<String, dynamic>)
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['user_id'] ?? '',         // Default to an empty string if null
      userType: json['user_type'] ?? 'admin',// Default to 'admin' if null
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }

  // Method to convert UserModel to JSON (Map<String, dynamic>)
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'user_type': userType,
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
