import 'package:flutter/material.dart';
import '../../components/coustom_bottom_nav_bar.dart';
import '../../enums.dart';
import 'components/Body.dart';

class favourite_screen extends StatelessWidget {

  final String? email;
  final String? password;

  const favourite_screen({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);

  static String routeName = "/favourite";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      body: Body(email: email,password: password,),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.favourite,email: email,password: password,),
    );
  }
}