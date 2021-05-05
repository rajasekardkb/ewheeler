import 'package:elc/Core/data/Mylogin.dart';
import 'package:elc/Core/data/rest_ds.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginScreenContract {
  void onLoginSuccess(LoginResponse response);

  void onLoginError(String errorTxt);
}

class LoginScreenPresenter {
  LoginScreenContract _view;
  RestDatasource api = new RestDatasource();

  LoginScreenPresenter(this._view);

  doLogin(String data) async {
    try {
      LoginResponse response = await api.login_(data);
      _view.onLoginSuccess(response);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('username', data);
    } catch (e) {
      _view.onLoginError(e.toString().substring(e.toString().indexOf(":") + 1));
    }
  }

  doLogin_(String data) async {
    try {
      // LoginResponse response = await api.login_(data);
      // _view.onLoginSuccess(response);
    } catch (e) {
      print("error----->" + e.toString());

      _view.onLoginError(e.toString().substring(e.toString().indexOf(":") + 1));
    }
  }
}
