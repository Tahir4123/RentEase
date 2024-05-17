import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rentease/screens/homescreen/components/search.dart';
import 'package:rentease/screens/search/searchScreen.dart';
import 'package:rentease/size_config.dart';
import 'package:http/http.dart' as http;

import '../../../../constants.dart';
import '../../../../model/House.dart';
import 'ad_widget.dart';

class advertisement extends StatefulWidget{
  final String? email;
  final String? password;

  const advertisement({
    Key? key,
    required this.email,
    required this.password,

  }) : super(key: key);
  @override
  State<advertisement> createState() => _advertisementState();
}

class _advertisementState extends State<advertisement> {

  List<dynamic> property=[];

  @override
  void initState() {
    super.initState();
    gethouseData();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      height: 270,
      child: Stack(
        children: [
          CarouselSlider(
            items: [
              ...List.generate(
                property.length,
                    (index) {
                    return Ad_widget(property: property[index]);
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
            options: CarouselOptions(
                height: 240,
                autoPlay: true,
                enableInfiniteScroll: true,
                viewportFraction: 1,
                initialPage: 0,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 220,left: 20),
            child: InkWell(
              onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>searchScreen(email: widget.email, password: widget.password)));},
                child: search()
            )
            ),

        ],
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
              (house) => house['built_type'] == 'Villa',
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

