import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rentease/components/default_button.dart';
import 'package:rentease/landowner/home/homescreen.dart';
import 'package:rentease/size_config.dart';
import 'package:http/http.dart'as http;

import '../../../constants.dart';
import '../../../landowner/profile/components/profile_pic.dart';




class tenantdetails extends StatefulWidget {
  final String? fname,lname;

  const tenantdetails({
    Key? key,
    required this.fname,
    required this.lname
  }) : super(key: key);

  @override
  State<tenantdetails> createState() => _tenantdetailsState();
}

class _tenantdetailsState extends State<tenantdetails> {
  TextEditingController fname_c = TextEditingController();
  TextEditingController lname_c = TextEditingController();
  TextEditingController email_c = TextEditingController();
  TextEditingController address_c = TextEditingController();
  TextEditingController phone_c = TextEditingController();



  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.fname);
    print(widget.lname);
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            ProfilePic(name: fname_c.text+" "+lname_c.text,),
            SizedBox(height: 50),
            TextFormField(
              readOnly: true,
              controller: fname_c,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                label: Text(
                  'First Name',
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(18),
                    color: kblackcolor,
                  ),
                ),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: kTextColor,// Replace with your desired border color
                  ),
                  borderRadius: BorderRadius.circular(25), // Adjust the border radius as needed
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: kTextColor, // Replace with your desired border color
                  ),
                  borderRadius: BorderRadius.circular(25), // Adjust the border radius as needed
                ),
                fillColor: Color(0xFFF5F6F9),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              style: TextStyle(
                color: kblackcolor,
                fontSize: getProportionateScreenHeight(16),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              readOnly: true,
              controller: lname_c,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                label: Text(
                  'Last Name',
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(18),
                    color: kblackcolor,
                  ),
                ),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: kTextColor,// Replace with your desired border color
                  ),
                  borderRadius: BorderRadius.circular(25), // Adjust the border radius as needed
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: kTextColor, // Replace with your desired border color
                  ),
                  borderRadius: BorderRadius.circular(25), // Adjust the border radius as needed
                ),
                fillColor: Color(0xFFF5F6F9),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              style: TextStyle(
                color: kblackcolor,
                fontSize: getProportionateScreenHeight(16),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              readOnly: true,
              controller: phone_c,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                label: Text(
                  'Phone Number',
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(18),
                    color: kblackcolor,
                  ),
                ),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: kTextColor,// Replace with your desired border color
                  ),
                  borderRadius: BorderRadius.circular(25), // Adjust the border radius as needed
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: kTextColor, // Replace with your desired border color
                  ),
                  borderRadius: BorderRadius.circular(25), // Adjust the border radius as needed
                ),
                fillColor: Color(0xFFF5F6F9),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              style: TextStyle(
                color: kblackcolor,
                fontSize: getProportionateScreenHeight(16),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              readOnly: true,
              controller: email_c,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                label: Text(
                  'Email',
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(18),
                    color: kblackcolor,
                  ),
                ),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: kTextColor,// Replace with your desired border color
                  ),
                  borderRadius: BorderRadius.circular(25), // Adjust the border radius as needed
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: kTextColor, // Replace with your desired border color
                  ),
                  borderRadius: BorderRadius.circular(25), // Adjust the border radius as needed
                ),
                fillColor: Color(0xFFF5F6F9),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              style: TextStyle(
                color: kblackcolor,
                fontSize: getProportionateScreenHeight(16),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              readOnly: true,
              controller: address_c,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                label: Text(
                  'Address',
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(18),
                    color: kblackcolor,
                  ),
                ),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: kTextColor,// Replace with your desired border color
                  ),
                  borderRadius: BorderRadius.circular(25), // Adjust the border radius as needed
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: kTextColor, // Replace with your desired border color
                  ),
                  borderRadius: BorderRadius.circular(25), // Adjust the border radius as needed
                ),
                fillColor: Color(0xFFF5F6F9),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              style: TextStyle(
                color: kblackcolor,
                fontSize: getProportionateScreenHeight(16),
              ),
            ),
            SizedBox(height: 35),
          ],
        ),
      ),
    );
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
              (user) => user['fname'] == widget.fname && user['lname']==widget.lname,
          orElse: () => null,
        );

        if (user != null) {
          // Credentials are correct, navigate to the next page (HomeScreen)
          setState(() {
            email_c.text=user['email'];
            fname_c.text=user['fname'];
            lname_c.text=user['lname'];
            address_c.text=user['address'];
            phone_c.text=user['phone'];
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

/*
  Future<void> updateUserData() async {
    final url = Uri.parse('http://' + api + ':3000/updateuserdata');

    try {
      final response = await http.post(
        url,
        body: {
          'email': email_c.text,
          'fname': fname_c.text,
          'lname': lname_c.text,
          'address': address_c.text,
          'phone': phone_c.text,
        },
      );

      if (response.statusCode == 200) {
        // Data updated successfully, you can show a success message here
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Account updated successfully.'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        print('Failed to update data');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to update account data. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred while updating the account. Please try again later.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
*/


}

