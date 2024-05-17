import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rentease/screens/Booked/booked_screen.dart';
import 'package:rentease/screens/favourites/favourites_screen.dart';
import 'package:rentease/screens/homescreen/home.dart';

import '../constants.dart';
import '../enums.dart';
import '../screens/profile/profile_screen.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
    required this.email,
    required this.password,
  }) : super(key: key);

  final MenuState selectedMenu;
  final String? email;
  final String? password;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/homeicon.svg",
                  color: MenuState.home == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen(email: email,password: password))),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Heart Icon.svg",
                  color: MenuState.favourite == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>favourite_screen(email: email,password: password))),

              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/booking.svg",
                  color: MenuState.bookings == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                  height: 27,),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>booked_screen(email: email,password: password)));
                },
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/User Icon.svg",
                  color: MenuState.profile == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen(email: email,password: password))),
              ),
            ],
          )),
    );
  }
}
