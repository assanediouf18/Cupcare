class UserModel {
  String email, uid;
  String firstName;
  bool isConnected;

  UserModel(
      {required this.uid,
      required this.email,
      required this.firstName,
      this.isConnected = false});
}
