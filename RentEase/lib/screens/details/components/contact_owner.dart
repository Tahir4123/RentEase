import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rentease/screens/Payment/paymentScreen.dart';
import 'package:rentease/screens/details/components/top_rounded_container.dart';
import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../model/House.dart';
import '../../../model/ownerListing.dart';
import '../../../size_config.dart';
import 'package:http/http.dart'as http;


class Contact extends StatefulWidget {
  Contact({
    super.key,
    required this.property,
  });
  final Map<String,dynamic> property;

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  bool isbooked= false;
  String email="";
  String pass="";
  String name="";

  @override
  void initState() {
    getcurrentData();
    getUserData();
    getbookingData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: TopRoundedContainer(
        color: Colors.white,
        child: Padding(
            padding: EdgeInsets.only(
              left: getProportionateScreenWidth(10),
              right: getProportionateScreenWidth(23),
              bottom: getProportionateScreenWidth(10),
              top: getProportionateScreenWidth(7),
            ),
            child: DefaultButton(
              text: isbooked==false?"Book Now":'Cancel Booking',icon:"signIn_forward",
              press: (){
                isbooked==false?Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => paymentScreen(property: widget.property),
                  ),
                ): showDialog(
                  context: context,
                  builder: (context) {
                    return cancelbooking();
                  },
                );
              },
            )
        ),
      ),
    );
  }

  AlertDialog cancelbooking(){
    return AlertDialog(
        content: Text(
          'Are you sure you want to cancel the booking...??',
          style: TextStyle(
            color: kblackcolor,
            fontSize: getProportionateScreenHeight(16)
          ),
        ),
      actions: [
        ElevatedButton(onPressed: (){
          setState(() {
            isbooked=false;
            deleteData();
            Navigator.pop(context);
          });
        },
            child: Text('Yes'),
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor,
            foregroundColor: Colors.white
          ),
        ),
        ElevatedButton(onPressed: (){Navigator.pop(context);},
            child: Text('No'),
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor,
            foregroundColor: Colors.white
          ),
        ),

      ],
        );
  }
  Future<void> getbookingData() async {
    final url = Uri.parse('http://'+api+':3000/getbookingdata');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Parse the JSON response
        final List<dynamic> houseData = jsonDecode(response.body);

        // Filter houses owned by the specific owner
        final user = houseData.firstWhere(
              (user) => user['name'] == widget.property['name'] && user['user_name']==name,
          orElse: () => null,
        );

        if (user!=null) {
          // Set the list of houses for the UI
          setState(() {
            isbooked=true;
          });
        } else {
          isbooked=false;// No houses found for the owner
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred. Please try again later.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> getUserData() async {
    final url = Uri.parse('http://'+api+':3000/getuserdata');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Parse the JSON response
        final List<dynamic> userData = jsonDecode(response.body);

        // Check if the provided email and password match any user record
        final user = userData.firstWhere(
              (user) => user['email'] == email && user['pass'] == pass,
          orElse: () => null,
        );

        if (user != null) {
          // Credentials are correct, navigate to the next page (HomeScreen)
          setState(() {
            name = user['fname'] + ' ' + user['lname'];
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

  Future<void> getcurrentData() async {
    final url = Uri.parse('http://'+api+':3000/getcurrentdata');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Parse the JSON response
        final List<dynamic> userData = jsonDecode(response.body);

        // Check if the provided email and password match any user record

        if (userData != null) {
          setState(() {
            email = userData.last['email'];
            pass = userData.last['pass'];
          });
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

  Future<void> deleteData() async {
    print("hi");

    final url = Uri.parse('http://' + api + ':3000/deletebooking');

    try {
      final response = await http.delete(
        Uri.parse('http://' + api + ':3000/deletebooking'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'user_name': name,
          'name': widget.property['name'],
          'address': widget.property['address'],
        }),
      );

      if (response.statusCode == 200) {
        print('Property removed from favorites successfully');
      } else {
        print('Failed to remove property from favorites');
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



