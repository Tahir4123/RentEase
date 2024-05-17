import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../../model/House.dart';
import '../../screens/details/details_screen.dart';
import '../../size_config.dart';

class house_tab extends StatefulWidget {
  house_tab({
    super.key,
    required this.property,
  });
  final Map<String,dynamic> property;

  @override
  State<house_tab> createState() => _house_tabState();
}

class _house_tabState extends State<house_tab> {
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
    return InkWell(
      onTap: ()=>
          Navigator.pushNamed(context, DetailsScreen.routeName,arguments: ProductDetailsArguments(property: widget.property),),
      child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          elevation: 2,
          child:Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    height: SizeConfig.screenWidth*0.5,
                    width: SizeConfig.screenWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                      image: DecorationImage(
                        image: AssetImage(imagePaths.isNotEmpty ? imagePaths[0] : 'assets/images/sample.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: SizeConfig.screenWidth*0.025,right: SizeConfig.screenWidth*0.025),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: kPrimaryColor,
                      ),
                      child: Text(
                        '₹'+widget.property["rent"],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),

                    ),
                  ),
                ],
              ),
              Text(
                widget.property['name'],
                style: TextStyle(
                    color: kblackcolor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 8,bottom: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SvgPicture.asset("assets/icons/bedroom.svg",height: 30,color: kTextColor,),
                          Padding(
                            padding: const EdgeInsets.only(left: 3.0),
                            child: Text(
                              widget.property['bedroom'],
                              style: TextStyle(
                                  color: kTextColor,
                                  fontSize: 15
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8,bottom:4,left:30),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/icons/bathroom.svg",height:30,color: kTextColor,),
                          Padding(
                            padding: const EdgeInsets.only(left:3.0),
                            child: Text(
                              widget.property['bathroom'],
                              style: TextStyle(
                                  color: kTextColor,
                                  fontSize: 15
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8,bottom: 4,left: 30),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/icons/area.svg",height:30,color: kTextColor,),
                          Padding(
                            padding: const EdgeInsets.only(left:3.0),
                            child: Text(
                              widget.property['area']+' Sqft',
                              style: TextStyle(
                                  color: kTextColor,
                                  fontSize: 15
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
      ),
    );
  }

  String formatNumberWithCommas(double number) {
    if (number == null) return "0";
    if (number < 1000) return number.toStringAsFixed(0);

    String originalString = number.toStringAsFixed(0);
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
