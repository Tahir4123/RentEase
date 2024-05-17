import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../components/House_card/listview.dart';
import '../../../../constants.dart';import 'package:http/http.dart' as http;


import '../../../../model/House.dart';
import '../../../../size_config.dart';
import 'near_you_widget.dart';

class  near_you extends StatefulWidget {
  final String? email;
  final String? password;

  const near_you({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);

  @override
  State<near_you> createState() => _near_youState();
}

class _near_youState extends State<near_you> {
  List<dynamic> property=[];
  List<dynamic> booking=[];
  String name="";

  @override
  void initState() {
    super.initState();
    getUserData();
    getbookingData();
    gethouseData();
  }

  Future<void> getUserData() async {
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
          setState(() {
            name = user['fname']+" "+user['lname'];
          });
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

  Future<void> getbookingData() async {
    final url = Uri.parse('http://' + api + ':3000/getbookingdata');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Parse the JSON response
        final List<dynamic> bookingData = jsonDecode(response.body);

        // Filter bookings owned by the specific owner
        final List<dynamic> userBookings = bookingData.where(
              (booking) => booking['owner'] == name,
        ).toList();

        if (userBookings.isNotEmpty) {
          // You now have a list of all bookings for the owner
          // You can access the details using userBookings[index]
          // You can also set the list for UI if needed
          booking=userBookings;
        } else {
          booking=[];
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
    final url = Uri.parse('http://' + api + ':3000/gethousedata'); // Replace with your house data URL

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Parse the JSON response
        final List<dynamic> houseData = jsonDecode(response.body);

        // Filter houses that are in bookings
        final List<dynamic> housesInBookings = houseData.where(
              (house) =>
              booking.any((booking) =>
              booking['name'] == house['name'] &&
                  booking['address'] == house['address']),
        ).toList();

        if (housesInBookings.isNotEmpty) {
          // Set the list of houses in bookings for the UI
          setState(() {
            property = housesInBookings;
          });
        } else {
          property = []; // No houses found in bookings
          // Handle the case where no houses are found in bookings
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



  @override
  Widget build(BuildContext context) {
    if(property.isEmpty){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 23.0),
            child: Text(
              'Booked',
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(20),
                  fontWeight: FontWeight.bold,
                  color: kblackcolor
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 23.0),
            child: Text(
              'Check houses that are booked',
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(14),
                  color: kTextColor
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenWidth(10)),
          Container(
            height: getProportionateScreenHeight(250),
            width: SizeConfig.screenWidth*0.9,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/nobooking.png'),
                fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.circular(20)
            ),
          )
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 23.0),
          child: Text(
            'Booked',
            style: TextStyle(
                fontSize: getProportionateScreenWidth(20),
                fontWeight: FontWeight.bold,
                color: kblackcolor
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 23.0),
          child: Text(
            'Check houses that are booked',
            style: TextStyle(
                fontSize: getProportionateScreenWidth(14),
                color: kTextColor
            ),
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(10)),
    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
    child: Row(
    children: List.generate(
    property.length,
    (index) => near_you_widget(property: property[index]),
    ),
    ),),
      ],
    );
  }
}
