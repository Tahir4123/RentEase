import 'package:flutter/material.dart';
import '../../components/coustom_bottom_nav_bar.dart';
import '../../enums.dart';
import '../homescreen/components/body.dart';

class HomeScreen extends StatelessWidget {

  final String? email;
  final String? password;

  const HomeScreen({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);

  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(email: email,password: password,),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home,email: email,password: password,),
    );
  }
}