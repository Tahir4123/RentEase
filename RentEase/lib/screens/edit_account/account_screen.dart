import 'package:flutter/material.dart';
import 'package:rentease/components/coustom_bottom_nav_bar.dart';
import 'package:rentease/enums.dart';

import 'components/body.dart';

class account_Screen extends StatelessWidget {

  final String? email;
  final String? password;

  const account_Screen({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);

  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Body(email: email,password: password,),
    );
  }
}
