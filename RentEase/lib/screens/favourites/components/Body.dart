import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/House_card/listview.dart';
import '../../../components/House_card/tab_view.dart';
import '../../../components/appbar_search.dart';
import '../../../components/list_gridToggle.dart';
import '../../../constants.dart';
import '../../../model/House.dart';
import '../../../size_config.dart';
import 'package:http/http.dart' as http;



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
  List<dynamic> property=[];
  String name='';
  String address='';
  String uname="";

  @override
  void initState() {
    super.initState();
    getfavData();
    gethouseData(name, address);
  }

  bool isListView = false; // Track the selected state of the toggle button
  String email="";
  String password="";
  @override
  Widget build(BuildContext context) {
    if(property.isEmpty){
      return Stack(
        children: [
          Container(

            height: 150,
            decoration: BoxDecoration(color: kPrimaryColor,),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40.0,right: 10,left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0),
                    child: Text(
                      'Empty Properties',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: getProportionateScreenHeight(24),
                      ),),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 116.372),
            child: Stack(
              children: [
                Container(
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight*0.798,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
                      color: Color(0xFFF5F6F9)
                  ),
                  padding: EdgeInsets.only(left: 36,right: 24),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/addProperty.svg',height: 55,),
                      SizedBox(width: getProportionateScreenWidth(14),),
                      Text(
                        'No favourite property',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: kblackcolor
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 320.0,right: 30,top: 625,bottom: 20),
                  child: Container(
                    height: 80.0,
                    width: 80.0,
                    child: FittedBox(
                      child: FloatingActionButton(
                        backgroundColor: kPrimaryColor,
                        onPressed: () {},
                        child: SvgPicture.asset('assets/icons/add.svg',color: Colors.white,height: 55,),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      );
    }
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getProportionateScreenHeight(5),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      'Favourites',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenHeight(30),
                        color: kblackcolor
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:7.0),
                    child: list_gridToggle(onToggle: (bool value) {
                      // Update the selected state of the toggle button
                      setState(() {
                        isListView = !isListView;
                      });
                    }),
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(15)),
              // Conditional rendering of the appropriate view based on selected state
              isListView
                  ? SingleChildScrollView(
                child:Column(
                  children: List.generate(
                    property.length,
                        (index) => house_tab(property: property[index]),
                  ),
                ),
              )
                  : SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    property.length,
                        (index) => house_list(property: property[index]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> getfavData() async {
    final url = Uri.parse('http://'+api+':3000/getfav');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Parse the JSON response
        final List<dynamic> favData = jsonDecode(response.body);

        // Filter fav data for the specific user
        final List<dynamic> userFavData = favData.where(
              (fav) => fav['user_name'] == uname,
        ).toList();

        if (userFavData.isNotEmpty) {
          // Extract the name and address values from the fav data
          final List<String> names = [];
          final List<String> addresses = [];

          for (final fav in userFavData) {
            names.add(fav['name']);
            addresses.add(fav['address']);
          }

          // Use the names and addresses to retrieve additional data from the house table
          final List<dynamic> houseData = [];

          for (int i = 0; i < names.length; i++) {
            final user = await gethouseData(names[i], addresses[i]);
            if (user != null) {
              houseData.add(user);
            }
          }

          // Set the list of houses for the UI
          setState(() {
            property = houseData;
          });
        } else {
          property = []; // No favorite data found for the user
          // Handle the case where no favorite data is found
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred. Please try again later.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<dynamic> gethouseData(String name, String address) async {
    final url = Uri.parse('http://'+api+':3000/gethousedata');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Parse the JSON response
        final List<dynamic> userData = jsonDecode(response.body);

        // Check if the provided name and address match any user record
        final user = userData.firstWhere(
              (user) => user['name'] == name && user['address'] == address,
          orElse: () => null,
        );

        return user;
      }
    } catch (e) {
      print('Error: $e');
    }

    return null; // Return null if no user data is found
  }
  Future<void> getUserData() async {
    final url = Uri.parse('http://'+api+':3000/getuserdata');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> userData = jsonDecode(response.body);

        final user = userData.firstWhere(
              (user) => user['email'] == email && user['pass'] == password,
          orElse: () => null,
        );

        if (user != null) {
          setState(() {
            uname = user['fname'] + ' ' + user['lname'];
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Invalid email or password. Please try again.'),
              backgroundColor: Colors.red,
            ),
          );
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred. Please try again later.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> getcurrentData() async {
    final url = Uri.parse('http://'+api+':3000/getcurrentdata');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> userData = jsonDecode(response.body);


        if (userData != null) {
          setState(() {
            email = userData.last['email'];
            password = userData.last['pass'];
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Invalid email or password. Please try again.'),
              backgroundColor: Colors.red,
            ),
          );
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred. Please try again later.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }


}
