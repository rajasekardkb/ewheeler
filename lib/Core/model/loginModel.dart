class LoginModel {
  final String access;
  final String email;
  final String password;
  final String type;
  final String token;

  LoginModel({this.access, this.email, this.password, this.type, this.token});

  Map toJson() => {
        'access': access,
        'email': email,
        'password': password,
        'type': type,
        'token': token
      };
}
