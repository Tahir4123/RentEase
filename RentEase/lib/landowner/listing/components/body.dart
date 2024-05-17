import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rentease/landowner/add_property/addPropertyScreen.dart';
import 'package:rentease/model/ownerListing.dart';
import 'package:rentease/size_config.dart';
import 'package:http/http.dart' as http;

import '../../../constants.dart';
import 'landowner_house.dart';

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
  String owner= "";
  String rent="";
  String name="";
  List<dynamic> property=[];

  @override
  void initState() {
    super.initState();
    getownerData();
    gethouseData();
  }

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
                  padding: EdgeInsets.only(left: 36,right: 36),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/addProperty.svg',height: 55,),
                      SizedBox(width: getProportionateScreenWidth(14),),
                      Text(
                        'No property added',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
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
      child: Stack(
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
                      'Properties List',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: getProportionateScreenHeight(24),
                      ),),
                  ),
                  /*Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 23,
                        backgroundColor: kPrimaryColor,
                        child: SvgPicture.asset('assets/icons/search.svg',color: Colors.white,height: 30,),
                      ),
                    ),
                  ),*/
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
                    color: Color(0xFFF5F6F9),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SizedBox(height: getProportionateScreenHeight(10)),
                        ...List.generate(
                          property.length,
                              (index) {
                            return landowner_house(property: property[index],email:widget.email,password: widget.password,);
                          },
                        ),
                        SizedBox(height: getProportionateScreenHeight(20)),
                      ],
                    ),
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
                        onPressed: () {
                          Navigator.pushNamed(context, addPropertyScreen.routeName);
                        },
                        child: SvgPicture.asset('assets/icons/add.svg',color: Colors.white,height: 55,),
                      ),
                    ),
                  ),
                )
              ],
            ),
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
          owner= user['fname']+" "+user['lname'];
          // Credentials are correct, navigate to the next page (HomeScreen)
        } else {
          // Credentials are incorrect, show an error message
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

  Future<void> gethouseData() async {
    final url = Uri.parse('http://'+api+':3000/gethousedata');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Parse the JSON response
        final List<dynamic> houseData = jsonDecode(response.body);

        // Filter houses owned by the specific owner
        final List<dynamic> userHouses = houseData.where(
              (house) => house['owner'] == owner,
        ).toList();

        if (userHouses.isNotEmpty) {
          // Set the list of houses for the UI
          setState(() {
            property = userHouses;
          });
        } else {
          property = []; // No houses found for the owner
          // Handle the case where no houses are found
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

}




