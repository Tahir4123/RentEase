import 'package:flutter/material.dart';

import 'package:rentease/components/bottom_nav_landowner.dart';
import '../../enums.dart';
import '../listing/components/body.dart';

class listingScreen extends StatelessWidget {
  final String? email;
  final String? password;

  const listingScreen({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);

  static String routeName = "/listing_l";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),

      body: Body(email: email,password: password,),
      bottomNavigationBar: bottom_nav_landowner(selectedMenu: MenuState.bookings,email: email,password: password,),
    );
  }
}