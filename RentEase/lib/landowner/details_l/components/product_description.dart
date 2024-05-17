import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rentease/model/House.dart';
import 'package:rentease/landowner/details_l/components/major_characteristic.dart';
import 'package:rentease/landowner/details_l/components/property_details.dart';
import 'package:http/http.dart' as http;

import '../../../constants.dart';
import '../../../model/ownerListing.dart';
import '../../../size_config.dart';
import '../../tenant/tenantScreen.dart';

class propertyDescription extends StatefulWidget {
  propertyDescription({
    super.key,
    required this.property,
    this.pressOnSeeMore
  });
  final Map<String,dynamic> property;
  final GestureTapCallback? pressOnSeeMore;

  @override
  State<propertyDescription> createState() => _propertyDescriptionState();
}

class _propertyDescriptionState extends State<propertyDescription> {
  String? email="";
  String? password="";

  @override
  void initState() {
    getcurrentData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    print(email);
    print(password);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.property['name'],
                style: Theme.of(context).textTheme.headline6,
              ),
              IconButton(
                  onPressed: (){},
                  icon: SvgPicture.asset(
                    'assets/icons/edit.svg',
                    height: 20,
                    color: kblackcolor,
                  )
              )
            ],
          ),
        ),
        SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Asking',
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(14),
                        color: kTextColor
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    '₹'+widget.property['rent'],
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(20),
                        fontWeight: FontWeight.bold,
                        color: kTextColor
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: getProportionateScreenWidth(200),
              height: getProportionateScreenHeight(45),
              margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kPrimaryColor,
                ),
                child: TextButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>tenantScreen(email: email, password: password,hname: widget.property['name'],)));
                },
                child: Text(
                    "Check Tenant",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                )
            )
          ],
        ),
        SizedBox(height: 5,),
        Divider(
          thickness: 0.25,
          color: kblackcolor,
          indent: 20,
          endIndent: 20,
        ),
        MajorCharacteristic(property: widget.property),
        Divider(
          thickness: 0.25,
          color: kblackcolor,
          indent: 20,
          endIndent: 20,
        ),
        SizedBox(height: 25,),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(44),
          ),
          child: Text(
            'Description',
            style: TextStyle(
                fontSize: getProportionateScreenWidth(20),
                fontWeight: FontWeight.bold,
                color: kblackcolor
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(64),
          ),
          child: Text(
            widget.property['description'],
            maxLines: 3,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: 10,
          ),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Text(
                  "See More Detail",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kPrimaryColor,
                ),
              ],
            ),
          ),
        ),
        property_details(property: widget.property),
      ],
    );
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
            password = userData.last['pass'];
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
}
