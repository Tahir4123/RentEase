import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../constants.dart';
import '../../../../model/House.dart';
import '../../../../size_config.dart';
import '../../../details_l/details_screen_l.dart';

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
  String start="";
  String end="";
  @override
  void initState() {
    super.initState();
    fetchImages(widget.property['name'], widget.property['address']);
    getbookingData();
  }

  List<String> imagePaths = [];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=>Navigator.pushNamed(context, DetailsScreen_l.routeName,arguments: ProductDetailsArguments(property: widget.property),),
      child: Stack(
          children: [
            Container(
              height: 390,
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
                height: getProportionateScreenHeight(175),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'From: ',
                            style: TextStyle(
                              fontSize: getProportionateScreenHeight(16),
                              color: kTextColor,
                            ),
                          ),
                          Text(
                            start,
                            style: TextStyle(
                                fontSize: getProportionateScreenHeight(14),
                                color: kblackcolor
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'To: ',
                            style: TextStyle(
                              fontSize: getProportionateScreenHeight(16),
                              color: kTextColor,
                            ),
                          ),
                          Text(
                            end,
                            style: TextStyle(
                                fontSize: getProportionateScreenHeight(14),
                                color: kblackcolor
                            ),
                          ),
                        ],
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

  Future<void> getbookingData() async {
    final url = Uri.parse('http://'+api+':3000/getbookingdata');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Parse the JSON response
        final List<dynamic> houseData = jsonDecode(response.body);

        // Filter houses owned by the specific owner
        final user = houseData.firstWhere(
              (user) => user['name'] == widget.property['name']&&user['address']==widget.property['address'] ,
          orElse: () => null,
        );

        if (user!=null) {
          // Set the list of houses for the UI
          setState(() {
            start = user['start'];
            end=user['end'];

          });
        } else {
          start="";
          end="";// No houses found for the owner
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