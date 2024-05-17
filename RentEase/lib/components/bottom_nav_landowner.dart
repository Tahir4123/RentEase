import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rentease/landowner/listing/listingScreen.dart';
import 'package:rentease/landowner/payment/payment.dart';
import 'package:rentease/screens/Payment/paymentScreen.dart';


import '../constants.dart';
import '../enums.dart';
import '../landowner/home/homescreen.dart';
import '../landowner/profile/profile_screen_l.dart';


class bottom_nav_landowner extends StatelessWidget {
  const bottom_nav_landowner({
    Key? key,
    required this.selectedMenu,
    required this.email,
    required this.password,
  }) : super(key: key);

  final String? email;
  final String? password;
  final MenuState selectedMenu;

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
                  "assets/icons/dashboard.svg",
                  color: MenuState.home == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen_l(email: email, password: password))),
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/listing.svg",
                  color: MenuState.bookings == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                  height: 27,),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>listingScreen(email: email, password: password)));
                },
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/payment.svg",
                  color: MenuState.message == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>payment_l(email: email, password: password))),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/User Icon.svg",
                  color: MenuState.profile == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen_l(email: email, password: password))),
              ),
            ],
          )),
    );
  }
}
