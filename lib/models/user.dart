class User {
  String firstName;
  String email;
  String passwordConfirmation;
  String phone;
  String password;
  User(
      {this.firstName,
      this.email,
      this.password,
      this.passwordConfirmation,
      this.phone});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        firstName: json['username'],
        passwordConfirmation: json['passwordConfirmation'],
        phone: json['phone'],
        email: json['email'],
        password: json['password']);
  }
}

class UserCredential {
  String usernameOrEmail;
  String passwordConfirmation;
  String phone;
  String password;
  UserCredential({this.usernameOrEmail, this.password});
}
