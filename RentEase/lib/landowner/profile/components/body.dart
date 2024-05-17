import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rentease/landowner/T&C.dart';
import 'package:rentease/landowner/help.dart';
import 'package:rentease/landowner/home/homescreen.dart';
import 'package:rentease/screens/splash/splash_screen.dart';
import 'package:http/http.dart'as http;

import '../../../constants.dart';
import '../../../landowner/edit_account/account_screen.dart';
import '../../../size_config.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatefulWidget {

  final String? email;
  final String? password;

  const Body({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  void initState() {
    super.initState();
    getownerData();
  }

  String name="";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(name: name,),
          SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(
                fontSize: getProportionateScreenHeight(18),
                fontWeight: FontWeight.bold,
                color: kblackcolor
            ),
          ),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>account_Screen(email: widget.email, password: widget.password)))
            },
          ),
          ProfileMenu(
            text: "Terms & Conditions",
            icon: "assets/icons/t_c.svg",
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Terms()));

            },
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>help()));

            },
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              Navigator.pushNamed(context, SplashScreen.routeName);
              deleteData();
            },
          ),
        ],
      ),
    );
  }

  Future<void> getownerData() async {
    final url = Uri.parse('http://'+api+':3000/getownerdata');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Parse the JSON response
        final List<dynamic> userData = jsonDecode(response.body);

        // Check if the provided email and password match any user record
        final user = userData.firstWhere(
              (user) => user['email'] == widget.email && user['pass'] == widget.password,
          orElse: () => null,
        );

        if (user != null) {
          // Credentials are correct, navigate to the next page (HomeScreen)
          print(user['fname']);
          print(user['lname']);
          setState(() {
            name = user['fname'] + ' ' + user['lname'];
          });
        } else {
          // Credentials are incorrect, show an error message
          print('wrong credentials');
        }
      } else {
        print('Failed to retrieve data');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to retrieve data. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print('Error: $e');

    }
  }

  Future<void> deleteData() async {
    print("hi");

    final url = Uri.parse('http://' + api + ':3000/deletecurrent');

    try {
      final response = await http.delete(
        Uri.parse('http://' + api + ':3000/deletecurrent'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email':widget.email,
          'pass':widget.password
        }),
      );

      if (response.statusCode == 200) {
        print('Property removed from favorites successfully');
      } else {
        print('Failed to remove property from favorites');
      }
    } catch (e) {
      print('Error: $e');

    }
  }

}
