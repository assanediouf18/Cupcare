class UserModel {
  String email, password;
  String firstName;
  bool isConnected;

  UserModel({
    required this.email,
    required this.password,
    required this.firstName,
    this.isConnected = false
  });
}
