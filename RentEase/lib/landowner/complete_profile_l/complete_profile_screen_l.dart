import 'package:flutter/material.dart';

import 'components/body.dart';

class CompleteProfileScreen_l extends StatelessWidget {
  static String routeName = "/complete_profile";
  final String email;
  final String pass;

  CompleteProfileScreen_l({super.key, required this.email, required this.pass});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Body(email: email,pass: pass,),
    );
  }
}
