import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rentease/model/House.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants.dart';
import '../../../landowner/details_l/components/major_characteristic.dart';
import '../../../landowner/details_l/components/property_details.dart';
import '../../../model/ownerListing.dart';
import 'package:http/http.dart' as http;

import '../../../size_config.dart';
import 'map.dart';

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

  String user_name='';
  String uname='';
  String name='';
  String address="";
  bool isFav = false;

  @override
  void initState() {
    super.initState();
    getfavData(widget.property['name'], widget.property['address']);
    // Load the isFav state from SharedPreferences when the widget is initialized.
  }

  @override
  Widget build(BuildContext context) {
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
            ],
          ),
        ),
        SizedBox(height: 15,),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Text(
              'Property From '+widget.property['owner'],
                style: TextStyle(
                  fontSize: 15,
                  color: kTextColor
                )
            ),
          ),
        ),
        SizedBox(height: 5,),
        /*Divider(
          thickness: 0.25,
          color: kblackcolor,
          indent: 20,
          endIndent: 20,
        ),*/
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
            InkWell(
              onTap: ()=>setState(() {
                isFav=!isFav;
                if (isFav==true){
                  setState(() {
                    user_name=uname;
                    name=widget.property['name'];
                    address= widget.property['address'];
                    insertData();
                  });
                }else{
                  setState(() {
                    user_name=uname;
                    name=widget.property['name'];
                    address= widget.property['address'];
                    deleteData();
                  });
                }
              }),
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                  width: getProportionateScreenWidth(64),
                  decoration: BoxDecoration(
                    color:
                    isFav ? Color(0xFFFFE6E6) : Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/Heart Icon_2.svg",
                    color:
                    isFav ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
                    height: getProportionateScreenWidth(16),
                  ),
                ),
              ),
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
        map(property: widget.property,),
      ],
    );
  }


  Future<void> getfavData(String propertyName, String propertyAddress) async {
    final url = Uri.parse('http://' + api + ':3000/getfav');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Parse the JSON response
        final List<dynamic> favData = jsonDecode(response.body);

        // Check if there is a favorite entry with the specified name and address
        final bool isFavorite = favData.any((fav) =>
        fav['user_name'] == user_name &&
            fav['name'] == propertyName &&
            fav['address'] == propertyAddress);

        if (isFavorite) {
          // The property is in the favorites list
          setState(() {
            isFav=true;
          });
          // You can handle this case accordingly
        } else {
          setState(() {
            isFav=false;
          });
          // The property is not in the favorites list
          // You can handle this case accordingly
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

  Future<void> insertData() async {
    print("hi");

    final url = Uri.parse('http://' + api + ':3000/insertfav');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'user_name':user_name,
          'name':name,
          'address':address,
        }),
      );

      if (response.statusCode == 200) {
        print('Data inserted successfully');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Registration successful!'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        print('Failed to insert data');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Registration failed. Please try again.'),
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

    final url = Uri.parse('http://' + api + ':3000/deletefav');

    try {
      final response = await http.delete(
        Uri.parse('http://' + api + ':3000/deletefav'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'user_name': user_name,
          'name': name,
          'address': address,
        }),
      );

      if (response.statusCode == 200) {
        print('Property removed from favorites successfully');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Property removed from favorites!'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        print('Failed to remove property from favorites');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to remove property from favorites. Please try again.'),
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
            uname=userData.last['fname']+userData.last['lname'];
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
