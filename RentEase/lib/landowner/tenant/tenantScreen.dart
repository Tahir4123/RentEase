import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rentease/landowner/tenant/tenantdetails.dart';

import '../../../../components/House_card/listview.dart';
import '../../../../constants.dart';import 'package:http/http.dart' as http;


import '../../../../model/House.dart';
import '../../../../size_config.dart';

class  tenantScreen extends StatefulWidget {
  final String? email;
  final String? password;
  final String? hname;

  const tenantScreen({
    Key? key,
    required this.email,
    required this.password,
    required this.hname
  }) : super(key: key);

  @override
  State<tenantScreen> createState() => _tenantScreenState();
}

class _tenantScreenState extends State<tenantScreen> {
  String name="";
  String t_name="";

  @override
  void initState() {
    super.initState();
    getUserData();
    getbookingData();
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
    final url = Uri.parse('http://'+api+':3000/getbookingdata');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Parse the JSON response
        final List<dynamic> houseData = jsonDecode(response.body);

        // Filter houses owned by the specific owner
        final user = houseData.firstWhere(
              (user) => user['owner'] == name && user['name']==widget.hname,
          orElse: () => null,
        );

        if (user!=null) {
          // Set the list of houses for the UI
          setState(() {
            t_name = user['user_name'];

          });
        } else {
          t_name="";
          // No houses found for the owner
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

  @override
  Widget build(BuildContext context) {
    if(t_name==""){
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back_rounded,size: 40,color: kblackcolor,),
                onPressed: (){Navigator.pop(context);}
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 20),
            child: Column(
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
            ),
          ),
        ),
      );
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded,size: 40,color: kblackcolor,),
            onPressed: (){Navigator.pop(context);}
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 23.0),
                child: Text(
                  'This',
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
                  'is the gentleman that',
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                      color: kTextColor
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 23.0),
                child: Text(
                  'booked your house',
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                      color: kTextColor
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenWidth(10)),
              tenantdetails(fname: t_name.split(" ")[0],lname: t_name.split(" ")[1],),
            ],
          ),
        ),
      ),
    );
  }
}
