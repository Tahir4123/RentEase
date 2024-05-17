
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentease/screens/homescreen/components/search.dart';

import '../../../components/House_card/listview.dart';
import '../../../components/House_card/tab_view.dart';
import '../../../components/appbar_search.dart';
import '../../../components/list_gridToggle.dart';
import '../../../constants.dart';
import '../../../model/House.dart';
import 'package:http/http.dart' as http;
import '../../../size_config.dart';
import '../../search/searchScreen.dart';


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

  @override
  void initState() {
    super.initState();
    gethouseData();
  }  bool isListView = false; // Track the selected state of the toggle button

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: getProportionateScreenWidth(5),),
              InkWell(
                  onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>searchScreen(email: widget.email, password: widget.password)));},
                  child: search()),
              SizedBox(height: getProportionateScreenHeight(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Showing Result',
                        style: TextStyle(
                          color: kblackcolor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          height: 1,
                        ),
                      ),
                      Text(
                        property.length.toString() + ' properties found',
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  list_gridToggle(onToggle: (bool value) {
                    // Update the selected state of the toggle button
                    setState(() {
                      isListView = !isListView;
                    });
                  }),
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

  Future<void> gethouseData() async {
    final url = Uri.parse('http://'+api+':3000/gethousedata');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Parse the JSON response
        final List<dynamic> houseData = jsonDecode(response.body);

        // Filter houses owned by the specific owner
        final List<dynamic> userHouses = houseData.where(
              (house) => (house['type']=='Rent'||house['type']=='Both'),
        ).toList();

        if (userHouses.isNotEmpty) {
          // Set the list of houses for the UI
          setState(() {
            property = userHouses;
          });
        } else {
          property = [];// No houses found for the owner
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





}
