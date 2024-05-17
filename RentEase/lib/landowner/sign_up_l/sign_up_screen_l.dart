import 'package:flutter/material.dart';

import 'components/body.dart';

class SignUpScreen_l extends StatelessWidget {
  static String routeName = "/sign_up_l";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Body(),
    );
  }
}
