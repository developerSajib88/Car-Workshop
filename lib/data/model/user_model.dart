class UserModel {
  final int? userId;
  final String? profileImage;
  final String? userType;
  final String? name;
  final String? email;
  final String? phone;
  final String? password;

  UserModel({
    this.profileImage,
    this.userId,
    this.userType,
    this.name,
    this.email,
    this.phone,
    this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      profileImage: json['profile'],
      userId: json['user_id'],
      userType: json['user_type'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
    );
  }

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
