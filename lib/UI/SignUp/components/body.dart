import 'package:elc/UI/Login/Components/already_have_an_account_acheck.dart';
import 'package:elc/UI/Login/Components/rounded_button.dart';
import 'package:elc/UI/Login/Components/rounded_input_field.dart';
import 'package:elc/UI/Login/Components/rounded_password_field.dart';
import 'package:elc/UI/Login/login_screen.dart';
import 'package:elc/UI/SignUp/components/social_icon.dart';
import 'package:elc/resources/values/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'background.dart';
import 'or_divider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: Text(
                "SignUp",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    letterSpacing: 1,
                    color: AppColors.kPrimaryColor),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.30,
            ),
            RoundedInputField(
              hintText: "Last Name",
              icon: Icons.drive_file_rename_outline,
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Your Email",
              icon: Icons.email,
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Phone",
              icon: Icons.phone,
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "Continue",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
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
    );
  }
}
