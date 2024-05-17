import 'package:flutter/material.dart';
import 'package:rentease/screens/city/city_screen.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class city_widget extends StatelessWidget {
  const city_widget({super.key,required this.image,required this.location,required this.email, required this.password,});
  final String image;
  final String location;
  final String? email;
  final String? password;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>city_screen(email: email,password: password,city: location,))),
      child: Column(
        children: [
          CircleAvatar(
            minRadius: 40,
            backgroundImage: AssetImage(image),
          ),
          SizedBox(height: getProportionateScreenWidth(5)),
          Text(
            location,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(14),
                fontWeight: FontWeight.bold,
                color: kblackcolor
            ),
          )
        ],
      ),
    );
  }
}
