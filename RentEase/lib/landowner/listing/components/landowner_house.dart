import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rentease/landowner/tenant/tenantScreen.dart';

import '../../../constants.dart';
import '../../../model/ownerListing.dart';
import '../../../size_config.dart';
import '../../details_l/details_screen_l.dart';

class landowner_house extends StatefulWidget {
  landowner_house({
    super.key,
    required this.property,
    required this.email,
    required this.password,
  });
  final Map<String,dynamic> property;
  final String? email,password;

  @override
  State<landowner_house> createState() => _landowner_houseState();
}

class _landowner_houseState extends State<landowner_house> {

  List<String> imagePaths = [];

  @override
  void initState() {
    super.initState();
    fetchImages(widget.property['name'], widget.property['address']);
  }

  Future<void> fetchImages(String name, String address) async {
    final response = await http.get(
      Uri.parse('http://' + api + ':3000/retrieveimages?name=$name&address=$address'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        imagePaths = List<String>.from(data['imagePaths']);
      });
    } else {
      print(widget.property['address']);
      // Handle errors here, such as displaying an error message
      print('Failed to retrieve images: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(), // Unique key for each card
      background: Container(
        color: Colors.red, // Background color for swipe action
        child: Icon(Icons.delete, color: Colors.white), // You can customize the delete icon
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 20),
      ),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          // Swipe left action
          deleteData();
        }
      },
      child: Card(
          margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 170,
                width: 114,
                decoration: BoxDecoration(
                    borderRadius:BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
                    image: DecorationImage(
                        image: AssetImage(imagePaths.isNotEmpty ? imagePaths[0] : 'assets/images/sample.jpg'),                      fit: BoxFit.cover
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:EdgeInsets.only(left: 10,top: 10),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: kPrimaryColor,
                        ),
                        child: Text(
                          '₹'+widget.property['rent'] ,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        widget.property['name']!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: getProportionateScreenHeight(16),
                            color: kblackcolor
                        ),
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(20),),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0,right: 7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color:kPrimaryColor
                            ),
                            child: TextButton(
                              child: Text(
                                'Check Details',
                                style: TextStyle(
                                    fontSize: getProportionateScreenHeight(13),
                                    color: Colors.white
                                ),
                              ),
                              onPressed: (){
                                Navigator.pushNamed(context, DetailsScreen_l.routeName,arguments: ProductDetailsArguments(property: widget.property),);
                              },
                            ),
                          ),
                          SizedBox(width: 5,),
                          Container(
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color:Colors.pink
                            ),
                            child: TextButton(
                              child: Text(
                                'Check Tenants',
                                style: TextStyle(
                                    fontSize: getProportionateScreenHeight(13),
                                    color: Colors.white
                                ),
                              ),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>tenantScreen(email: widget.email, password: widget.password,hname: widget.property['name'],)));
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
      ),
    );
  }

  String formatNumberWithCommas(String number) {
    double no = number as double ;
    if (no == null) return "0";
    if (no < 1000) return no.toStringAsFixed(0);

    String originalString = no.toStringAsFixed(0);
    String formattedString = "";

    int index = originalString.length;
    while (index > 3) {
      index -= 3;
      formattedString = "," + originalString.substring(index, index + 3) + formattedString;
    }

    formattedString = originalString.substring(0, index) + formattedString;
    return formattedString;
  }
  Future<void> deleteData() async {
    print("hi");

    final url = Uri.parse('http://' + api + ':3000/deletehouse');

    try {
      final response = await http.delete(
        Uri.parse('http://' + api + ':3000/deletehouse'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': widget.property['name'],
          'address': widget.property['address'],
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



}