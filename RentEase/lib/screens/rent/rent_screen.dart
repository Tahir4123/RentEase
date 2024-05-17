import 'package:flutter/material.dart';
import '../../components/coustom_bottom_nav_bar.dart';
import '../../enums.dart';
import 'components/Body.dart';

class Rent_screen extends StatelessWidget {

  final String? email;
  final String? password;

  const Rent_screen({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);

  static String routeName = "/Buy_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(email: email,password: password,),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home,email: email,password: password,),
    );
  }
}