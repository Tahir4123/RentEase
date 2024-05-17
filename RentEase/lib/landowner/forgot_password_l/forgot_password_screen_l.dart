import 'package:flutter/material.dart';

import 'components/body.dart';

class ForgotPasswordScreen_l extends StatelessWidget {
  static String routeName = "/forgot_password_l";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: Body(),
    );
  }
}
