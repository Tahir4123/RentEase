import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rentease/constants.dart';
import 'package:rentease/size_config.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../../model/House.dart';
import '../../details/details_screen.dart';

class booking_card extends StatefulWidget {
  booking_card({
    super.key,
    required this.property,
    required this.start,
    required this.end,
  });
  final Map<String,dynamic> property;
  final String start;

  final String end;

  @override
  State<booking_card> createState() => _booking_cardState();
}

class _booking_cardState extends State<booking_card> {
  List<String> imagePaths = [];

  @override
  void initState() {
    fetchImages(widget.property['name'], widget.property['address']);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0,),
      child: InkWell(
        onTap: ()=>
            Navigator.pushNamed(context, DetailsScreen.routeName,arguments: ProductDetailsArguments(property: widget.property),),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          elevation: 2,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: SizeConfig.screenHeight*0.18,
                width: SizeConfig.screenWidth*0.35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)),
                  image: DecorationImage(
                    image: AssetImage(imagePaths.isNotEmpty ? imagePaths[0] : 'assets/images/sample.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding:EdgeInsets.only(left: 10,top: 10,right: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: kPrimaryColor,
                      ),
                      child: Text(
                        widget.property['type']=='Rent'?'\$'+widget.property['rent']+'/day'
                            :'₹'+widget.property['rent']+'/month',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Text(
                      widget.property['name'],
                      style: TextStyle(
                          color: kblackcolor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Text(
                          'From: ',
                          style: TextStyle(
                            fontSize: getProportionateScreenHeight(16),
                            color: kTextColor,
                          ),
                        ),
                        Text(
                         widget.start,
                          style: TextStyle(
                            fontSize: getProportionateScreenHeight(14),
                            color: kblackcolor
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'To: ',
                          style: TextStyle(
                            fontSize: getProportionateScreenHeight(16),
                            color: kTextColor,
                          ),
                        ),
                        Text(
                          widget.end,
                          style: TextStyle(
                              fontSize: getProportionateScreenHeight(14),
                              color: kblackcolor
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
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
      // Handle errors here, such as displaying an error message
      print('Failed to retrieve images: ${response.statusCode}');
    }
  }

}
