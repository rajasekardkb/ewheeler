import 'dart:convert';

import 'package:elc/Core/data/JsonParcer.dart';
import 'package:elc/Core/data/Mylogin.dart';
import 'package:elc/Core/data/rest_ds.dart';
import 'package:elc/Core/model/loginModel.dart';
import 'package:elc/Core/model/test.dart';
import 'package:elc/Core/model/user.dart';
import 'package:elc/UI/Login/Components/already_have_an_account_acheck.dart';
import 'package:elc/UI/Login/Components/rounded_button.dart';
import 'package:elc/UI/Login/Components/rounded_input_field.dart';
import 'package:elc/UI/Login/presenter/login_screen_presenter.dart';
import 'package:elc/UI/SignUp/components/or_divider.dart';
import 'package:elc/UI/SignUp/components/social_icon.dart';
import 'package:elc/UI/SignUp/signup_screen.dart';
import 'package:elc/resources/values/app_colors.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Components/background.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    implements LoginScreenContract {
  BuildContext _ctx;

  bool isLoggedIn = false;
  String name = '';

  @override
  void initState() {
    super.initState();
    autoLogIn();
  }

  void autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userId = prefs.getString('username');
    print(userId);
    if (userId != null) {
      setState(() {
        isLoggedIn = true;
        name = userId;
      });
      Navigator.of(_ctx).pushReplacementNamed("/home");
      return;
    }
  }

  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _password, _username;

  LoginScreenPresenter _presenter;

  _LoginScreenState() {
    _presenter = new LoginScreenPresenter(this);
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      setState(() => _isLoading = true);
      form.save();

      print(LoginParam);
      _presenter.doLogin(LoginParam());
    }
  }

  String LoginParam() {
    return jsonEncode(<String, String>{
      'access': "GET_LOGIN",
      'email': _username,
      'password': 'rajasekar',
      'type': 'sds',
      'token': '',
    });
  }

  String _phoneNumberValidator(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,15}$)';
    RegExp regex = new RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regex.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  final color = const Color(0xffF2CE5E);

  void _showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Login successful!"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Background(
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Login",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    letterSpacing: 1,
                    color: AppColors.kPrimaryColor),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                icon: Icons.phone,
                hintText: "Phone",
                onChanged: (value) {
                  print("I am here");
                },
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                // Only numbers can be entered
                onSaved: (val) => _username = val,
                validator: (val) {
                  return _phoneNumberValidator(val);
                },
              ),
              _isLoading
                  ? new CircularProgressIndicator(
                      backgroundColor: color,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    )
                  : RoundedButton(
                      text: "Continue",
                      press: () {
                        _submit();
                      },
                    ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              ),
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocalIcon(
                    iconSrc: "assets/icons/facebook.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/twitter.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/google-plus.svg",
                    press: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }

  @override
  void onLoginError(String errorTxt) {
    //_onHideLoading();
    setState(() => _isLoading = false);
    Fluttertoast.showToast(msg: errorTxt, toastLength: Toast.LENGTH_SHORT);

    print("onLoginError" + errorTxt);
    _showSnackBar(errorTxt);
  }

  @override
  void onLoginSuccess(LoginResponse response) async {
    if (response.sTATUS) {
      Fluttertoast.showToast(
          msg: response.mESSAGE, toastLength: Toast.LENGTH_SHORT);
    } else {
      Fluttertoast.showToast(
          msg: response.mESSAGE, toastLength: Toast.LENGTH_SHORT);
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() => _isLoading = false);

    /*// _onHideLoading();
    _showSnackBar("Login successful!");
    Navigator.of(_ctx).pushReplacementNamed("/home");
    setState(() {
      name = prefs.getString('username');
      isLoggedIn = true;
    });*/
  }

  void _onHideLoading() {
    Navigator.pop(scaffoldKey.currentState.context); //pop dialog
  }

  Future<bool> getLoginState() async {
    SharedPreferences pf = await SharedPreferences.getInstance();
    bool loginState = pf.getBool('loginState');
    return loginState;
    // return pf.commit();
  }
}
