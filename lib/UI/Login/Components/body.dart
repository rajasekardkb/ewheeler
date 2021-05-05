import 'package:elc/UI/Login/Components/rounded_button.dart';
import 'package:elc/UI/Login/Components/rounded_input_field.dart';
import 'package:elc/UI/Login/Components/rounded_password_field.dart';
import 'package:elc/UI/SignUp/components/or_divider.dart';
import 'package:elc/UI/SignUp/components/social_icon.dart';
import 'package:elc/UI/SignUp/signup_screen.dart';
import 'package:elc/resources/values/app_colors.dart';
import 'package:elc/resources/values/colorSystem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'already_have_an_account_acheck.dart';
import 'background.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
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
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "Continue",
              press: () {},
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
    );
  }
}
