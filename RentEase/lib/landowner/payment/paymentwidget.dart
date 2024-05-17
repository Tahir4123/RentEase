import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rentease/landowner/tenant/tenantScreen.dart';

import '../../../constants.dart';
import '../../../model/ownerListing.dart';
import '../../../size_config.dart';

class paymentwidget extends StatefulWidget {
  paymentwidget({
    super.key,
    required this.property,
    required this.email,
    required this.password,
    required this.booking,
  });
  final Map<String,dynamic> property,booking;
  final String? email,password;

  @override
  State<paymentwidget> createState() => _paymentwidgetState();
}

class _paymentwidgetState extends State<paymentwidget> {

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
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            color: kPrimaryExtremeLightColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
            ),
            elevation: 3,
            child: Container(
              height: getProportionateScreenHeight(45),
              decoration: BoxDecoration(
                color: kPrimaryExtremeLightColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Payment Recieved from: ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getProportionateScreenHeight(16)
                    ),
                  ),
                  Text(
                    widget.booking['user_name'],
                    style: TextStyle(
                        color: kblackcolor,
                        fontSize: getProportionateScreenHeight(18)
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13.0,vertical: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'House Rented: ',
                      style: TextStyle(
                          color: kTextColor,
                          fontSize: getProportionateScreenHeight(16)
                      ),
                    ),
                    Spacer(),
                    Text(
                      widget.property['name'],
                      style: TextStyle(
                          color: kblackcolor,
                          fontSize: getProportionateScreenHeight(16)
                      ),
                    ),
                  ],
                ),
                Divider(thickness: 2,indent: 20,endIndent: 20,color: kTextColor,),
                Row(
                  children: [
                    Text(
                      'Total Payment: ',
                      style: TextStyle(
                          color: kTextColor,
                          fontSize: getProportionateScreenHeight(16)
                      ),
                    ),
                    Spacer(),
                    Text(
                      '₹'+ (int.parse(widget.property['rent'])+int.parse(widget.property['security'])+300).toString(),
                      style: TextStyle(
                          color: kblackcolor,
                          fontSize: getProportionateScreenHeight(16)
                      ),
                    ),
                  ],
                ),
                Divider(thickness: 2,indent: 20,endIndent: 20,color: kTextColor,),
                Row(
                  children: [
                    Text(
                      'Payment Status: ',
                      style: TextStyle(
                          color: kTextColor,
                          fontSize: getProportionateScreenHeight(16)
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Paid',
                      style: TextStyle(
                          color: kblackcolor,
                          fontSize: getProportionateScreenHeight(16)
                      ),
                    ),
                  ],
                ),
                Divider(thickness: 2,indent: 20,endIndent: 20,color: kTextColor,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13.0),
            child: Text(
              'House booked: ',
              style: TextStyle(
                  color: kTextColor,
                  fontSize: getProportionateScreenHeight(16)
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'From: ',
                      style: TextStyle(
                          color: kTextColor,
                          fontSize: getProportionateScreenHeight(16)
                      ),
                    ),
                    Text(
                      widget.booking['start'],
                      style: TextStyle(
                          color: kblackcolor,
                          fontSize: getProportionateScreenHeight(16)
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'To: ',
                      style: TextStyle(
                          color: kTextColor,
                          fontSize: getProportionateScreenHeight(16)
                      ),
                    ),
                    Text(
                      widget.booking['end'],
                      style: TextStyle(
                          color: kblackcolor,
                          fontSize: getProportionateScreenHeight(16)
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(15),)
        ],
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



}