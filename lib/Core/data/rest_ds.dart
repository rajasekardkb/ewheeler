import 'dart:async';
import 'dart:convert';

 import 'package:elc/Core/model/respdata.dart';
import 'package:elc/UI/Login/login_screen.dart';
import 'package:elc/Utlis/network_util.dart';

import 'Mylogin.dart';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "http://192.168.116.148/elc/apiconnect.php";

  //static final _API_KEY = "somerandomkey";

  Future<LoginResponse> login(String username, String password) {
    String jwt;
    return _netUtil.post(Uri.parse(BASE_URL), body: {
      "parameters[email]": username,
      "parameters[password]": password
    }).then((dynamic res) {
      print(res.toString());
      LoginResponse response = new LoginResponse.fromJson(res);
      //int statusCode = res["status_code"];
      //if (statusCode < 200 || statusCode > 400 || res == null) {
      /*if (response.error.message != 'OK') {
        print("error" + res['message'].toString());
        throw new Exception(response.error.message);
      } else {*/
        print("succeeded");
        return new LoginResponse.fromJson(res);
      //}
      //var body = json.decode(res.body);
      //print(res.toString());
      //if(res["error"]) throw new Exception(res["error_msg"]);
      //return new User.map(res["user"]);
      //return new User(username,password);
      //return new User.map(res["user"]);
      //return new Future.value(new User(username, password));
    });
  }

  Future<LoginResponse> login_(String data) {
    return _netUtil
        .post(Uri.parse(BASE_URL), body: data)
        .then((dynamic res) {
      print(res.toString());
      LoginResponse response = new LoginResponse.fromJson(res);
      //int statusCode = res["status_code"];
      //if (statusCode < 200 || statusCode > 400 || res == null) {
     /* if (response.error.message != 'OK') {
        print("error" + res['message'].toString());
        throw new Exception(response.error.message);
      } else {*/
        print("succeeded");
        return new LoginResponse.fromJson(res);
    //  }
      //var body = json.decode(res.body);
      //print(res.toString());
      //if(res["error"]) throw new Exception(res["error_msg"]);
      //return new User.map(res["user"]);
      //return new User(username,password);
      //return new User.map(res["user"]);
      //return new Future.value(new User(username, password));
    });
  }
}
