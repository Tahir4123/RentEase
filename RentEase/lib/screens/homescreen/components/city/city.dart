import 'package:flutter/material.dart';
import 'package:rentease/screens/homescreen/components/city/city_widget.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class city extends StatelessWidget {
  final String? email;
  final String? password;

  const city({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 23.0),
          child: Text(
            'Explore popular cities',
            style: TextStyle(
                fontSize: getProportionateScreenWidth(20),
                fontWeight: FontWeight.bold,
                color: kblackcolor
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 23.0),
          child: Text(
            'Buy or rent properties in top cities',
            style: TextStyle(
                fontSize: getProportionateScreenWidth(14),
                color: kTextColor
            ),
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(10)),
        Container(
          height: 110,
          width: SizeConfig.screenWidth,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 15),
            children: [
              city_widget(image: 'assets/images/mumbai.png', location: 'Mumbai',email: email,password: password,),
              SizedBox(width: getProportionateScreenWidth(15)),
              city_widget(image: 'assets/images/delhi.png', location: 'Delhi',email: email,password: password,),
              SizedBox(width: getProportionateScreenWidth(15)),
              city_widget(image: 'assets/images/chennai.png', location: 'Chennai',email: email,password: password,),
              SizedBox(width: getProportionateScreenWidth(15)),
              city_widget(image: 'assets/images/bengluru.png', location: 'Bengaluru',email: email,password: password,),
              SizedBox(width: getProportionateScreenWidth(15)),
              city_widget(image: 'assets/images/hyderabad.png', location: 'Hyderabad',email: email,password: password,),
            ],
          ),
        ),
      ],
    );
  }
}
