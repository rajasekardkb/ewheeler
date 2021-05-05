import 'package:elc/UI/Walkthrough/walhthrough.dart';
import 'package:flutter/material.dart';

import 'UI/Login/login_screen.dart';

final routes = {
  '/login': (BuildContext context) => new LoginScreen(),
  '/home': (BuildContext context) => new WalkThrough(),
  '/': (BuildContext context) => new LoginScreen(),
};
