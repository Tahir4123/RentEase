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

  @override
  void initState() {
    super.initState();
    gethouseData();
  }

  String city='MUMBAI';
  Future<void> gethouseData() async {
    final url = Uri.parse('http://'+api+':3000/gethousedata');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Parse the JSON response
        final List<dynamic> houseData = jsonDecode(response.body);

        // Filter houses owned by the specific owner
        final List<dynamic> userHouses = houseData.where(
              (house) => house['city'] ==city,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 23.0),
          child: Text(
            'Near You',
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
            'Get home near you',
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
