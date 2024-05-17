import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../components/House_card/listview.dart';
import '../../../components/House_card/tab_view.dart';
import '../../../components/coustom_bottom_nav_bar.dart';
import '../../../components/list_gridToggle.dart';
import '../../../constants.dart';
import '../../../enums.dart';
import '../../../model/House.dart';
import '../../../size_config.dart';
import 'package:http/http.dart' as http;



class Search_house extends StatelessWidget {

  final String? email;
  final String? password;
  final String city;
  final String guests;

  const Search_house({
    Key? key,
    required this.email,
    required this.password,
    required this.city,
    required this.guests,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(city: city,guests: guests,),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home,email: email,password: password,),
    );
  }
}

class Body extends StatefulWidget {

  final String city;
  final String guests;

  const Body({
    Key? key,
    required this.city,
    required this.guests,

  }) : super(key: key);
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<void> gethouseData(String searchedCity, String minGuests) async {
    final url = Uri.parse('http://' + api + ':3000/gethousedata');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Parse the JSON response
        final List<dynamic> houseData = jsonDecode(response.body);

        // Filter houses based on city and number of guests
        final List<dynamic> filteredHouses = houseData.where((house) {
          final String houseCity = house['city'] ?? ''; // Replace 'city' with the correct field name
          final String guestsStr = house['guest_limit'] ?? '0'; // Replace 'guests' with the correct field name

          // Convert guestsStr to an integer
          final int guests = int.tryParse(guestsStr) ?? 0;

          return houseCity.toUpperCase() == searchedCity.toUpperCase() && guests >= int.parse(minGuests);
        }).toList();

        if (filteredHouses.isNotEmpty) {
          // Set the list of filtered houses for the UI
          setState(() {
            property = filteredHouses;
          });
        } else {
          property = []; // No matching houses found
          // Handle the case where no matching houses are found
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

  List<dynamic> property=[];
  @override
  void initState() {
    super.initState();
    gethouseData(widget.city,widget.guests);
  }  bool isListView = false; // Track the selected state of the toggle button

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
                        'No property found',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                            color: kblackcolor
                        ),
                      )
                    ],
                  ),
                ),
/*
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
*/
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
              SizedBox(width: getProportionateScreenWidth(5),),
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
}
