import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../constants.dart';
import '../../../../model/House.dart';
import '../../../../size_config.dart';
import '../../../details/details_screen.dart';

class near_you_widget extends StatefulWidget {
  near_you_widget({
    super.key,
    required this.property,
  });
  final Map<String,dynamic> property;

  @override
  State<near_you_widget> createState() => _near_you_widgetState();
}

class _near_you_widgetState extends State<near_you_widget> {

  @override
  void initState() {
    super.initState();
    fetchImages(widget.property['name'], widget.property['address']);
  }

  List<String> imagePaths = [];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=>Navigator.pushNamed(context, DetailsScreen.routeName,arguments: ProductDetailsArguments(property: widget.property),),
      child: Stack(
          children: [
            Container(
              height: 350,
              width: 275,
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePaths.isNotEmpty ? imagePaths[0] : 'assets/images/sample.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15)
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 275.0,left: 30),
              child: Container(
                height: 124,
                width: 215,

                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.property['name'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                            color: kblackcolor
                        ),
                      ),
                      Text(
                        widget.property['city'],
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(14),
                            color: kTextColor
                        ),
                      ),
                      SizedBox(height: getProportionateScreenWidth(15)),
                      Text(
                        '₹'+widget.property['rent'],
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(14),
                            color: kblackcolor
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]
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
      print(widget.property['address']);
      // Handle errors here, such as displaying an error message
      print('Failed to retrieve images: ${response.statusCode}');
    }
  }
}