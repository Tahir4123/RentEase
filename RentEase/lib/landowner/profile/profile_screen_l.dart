import 'package:flutter/material.dart';
import 'package:rentease/components/bottom_nav_landowner.dart';
import 'package:rentease/enums.dart';

import 'components/body.dart';

class ProfileScreen_l extends StatelessWidget {
  final String? email;
  final String? password;

  const ProfileScreen_l({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);

  static String routeName = "/profile_l";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Body(email: email,password: password,),
      bottomNavigationBar: bottom_nav_landowner(selectedMenu: MenuState.profile,email: email,password: password,),
    );
  }
}
