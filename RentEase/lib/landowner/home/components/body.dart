import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

import 'package:rentease/constants.dart';
import 'package:rentease/landowner/add_property/addPropertyScreen.dart';
import 'package:rentease/landowner/home/components/booked/near_you.dart';
import 'package:rentease/landowner/home/components/dueGraph.dart';
import 'package:rentease/landowner/home/components/maintenanceGraph.dart';
import 'package:rentease/landowner/home/components/post_ad.dart';
import 'package:rentease/landowner/home/components/rentGraph.dart';
import 'package:rentease/landowner/home/components/stats.dart';
import 'package:rentease/size_config.dart';


class Body extends StatefulWidget {
  final String? email;
  final String? pass;

  const Body({super.key, required this.email, required this.pass});
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String name="";
  List<dynamic> property=[];
  List<dynamic> rental=[];
  List<dynamic> lease_h=[];
  List<dynamic> booking=[];
  List<dynamic> property_p=[];



  @override
  void initState() {
    getownerData();
    gethouseData();
    getrentalData();
    getlease_hData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(color: kPrimaryColor,),
            padding: EdgeInsets.only(bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: Text(
                    'Landlord Dashboard',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getProportionateScreenHeight(24),
                    ),),
                ),

              ],
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20),),
          Padding(
            padding: const EdgeInsets.only(top: 116.372),
            child: Stack(
              children: [
                Container(
                  height: SizeConfig.screenHeight*0.798,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
                    color: Color(0xFFF5F6F9),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: getProportionateScreenHeight(150),),
                      Container(
                        height: SizeConfig.screenHeight*0.545,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              near_you(email: widget.email, password: widget.pass),
                              InkWell(child: post_ad(),onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>addPropertyScreen(email: widget.email, password: widget.pass)))),
                              SizedBox(height: getProportionateScreenHeight(20),)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22.0,top: 20,bottom: 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child:
                    Row(
                      children: [
                        stats(
                          title: 'Properties',
                          number: property.length,
                          color: Colors.green,
                          icon: 'house',
                        ),
                        SizedBox(width: getProportionateScreenWidth(13),),
                        stats(
                          title: 'Rentals',
                          number: rental.length,
                          color: Colors.orange,
                          icon: 'house',
                        ),
                        SizedBox(width: getProportionateScreenWidth(13),),
                        stats(
                          title: 'Lease',
                          number: lease_h.length,
                          color: Colors.blue,
                          icon: 'house',
                        ),
                      ],
                    ),
                  ),
                ),
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
        final List<dynamic> userData = jsonDecode(response.body);

        final user = userData.firstWhere(
              (user) => user['email'] == widget.email && user['pass'] == widget.pass,
          orElse: () => null,
        );

        if (user != null) {
          setState(() {
            name = user['fname'] + ' ' + user['lname'];
          });
        } else {
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

  Future<void> gethouseData() async {
    final url = Uri.parse('http://'+api+':3000/gethousedata');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> houseData = jsonDecode(response.body);

        final List<dynamic> userHouses = houseData.where(
              (house) => house['owner'] == name,
        ).toList();

        if (userHouses.isNotEmpty) {
          setState(() {
            property = userHouses;
          });
        } else {
          property = [];
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

  Future<void> getrentalData() async {
    final url = Uri.parse('http://'+api+':3000/gethousedata');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> houseData = jsonDecode(response.body);

        final List<dynamic> userHouses = houseData.where(
              (house) => house['owner'] == name && (house['type']=='Rent'||house['type']=='Both'),
        ).toList();

        if (userHouses.isNotEmpty) {
          setState(() {
            rental = userHouses;
          });
        } else {
          rental = [];
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

  Future<void> getlease_hData() async {
    final url = Uri.parse('http://'+api+':3000/gethousedata');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> houseData = jsonDecode(response.body);

        final List<dynamic> userHouses = houseData.where(
              (house) => house['owner'] == name && (house['type']=='Lease'||house['type']=='Both'),
        ).toList();

        if (userHouses.isNotEmpty) {
          setState(() {
            lease_h = userHouses;
          });
        } else {
          lease_h = [];
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




