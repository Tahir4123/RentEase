import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:rentease/components/bottom_nav_landowner.dart';
import '../../components/coustom_bottom_nav_bar.dart';
import '../../enums.dart';
import '../home/components/body.dart';

class HomeScreen_l extends StatelessWidget {

  final String? email;
  final String? password;

  const HomeScreen_l({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);

  static String routeName = "/home_l";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      body: Body(email: email,pass:password),
      bottomNavigationBar: bottom_nav_landowner(selectedMenu: MenuState.home,email: email,password: password,),
    );
  }
}