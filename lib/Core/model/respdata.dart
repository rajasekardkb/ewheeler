import 'dart:convert';

class DummyResponse {
  static String LoginParam() {
    return jsonEncode(<String, String>{
      'access': "GET_LOGIN",
      'email': 'dsfggfh',
      'password': 'dsfggfh',
      'type': 's',
      'token': 'n',
    });
  }
}
