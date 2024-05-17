import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rentease/constants.dart';
import 'package:rentease/size_config.dart';

import '../../model/House.dart';
import '../../screens/details/details_screen.dart';

class house_list extends StatefulWidget {
  house_list({
    super.key,
    required this.property,
  });
  final Map<String,dynamic> property;

  @override
  State<house_list> createState() => _house_listState();
}

class _house_listState extends State<house_list> {

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
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 8),
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
                        margin: EdgeInsets.only(top: 8,left: 10),
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
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
