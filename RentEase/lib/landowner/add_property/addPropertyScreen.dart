import 'package:flutter/material.dart';

import 'package:rentease/components/bottom_nav_landowner.dart';
import 'package:rentease/constants.dart';
import 'package:rentease/landowner/add_property/components/body.dart';
import '../../enums.dart';

class addPropertyScreen extends StatelessWidget {
  final String? email;
  final String? password;

  const addPropertyScreen({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);
  static String routeName = "/addProperty";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      body: Body(email: email,password: password,),
    );
  }
}