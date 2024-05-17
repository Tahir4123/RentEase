import 'package:flutter/material.dart';
import '../../components/coustom_bottom_nav_bar.dart';
import '../../enums.dart';
import 'components/Body.dart';

class city_screen extends StatelessWidget {

  final String? email;
  final String? password;
  final String city;

  const city_screen({
    Key? key,
    required this.email,
    required this.password,
    required this.city,
  }) : super(key: key);


  static String routeName = "/Buy_screen";
  @override
  Widget build(BuildContext context) {
    print(city);
    return Scaffold(
      body: Body(city: city,email: email,password: password,),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home,email: email,password: password,),
    );
  }


}