import 'package:flutter/material.dart';
import 'package:rentease/constants.dart';
import 'package:rentease/screens/homescreen/components/Advertisement/advertisement.dart';
import 'package:rentease/screens/homescreen/components/city/city.dart';
import 'package:rentease/screens/homescreen/components/near_you/near_you.dart';
import 'package:rentease/landowner/home/components/post_ad.dart';
import 'package:rentease/screens/homescreen/components/rent.dart';
import 'package:rentease/screens/homescreen/components/lease.dart';

import '../../../model/House.dart';
import '../../../size_config.dart';
import '../../lease/leaseScreen.dart';
import '../../rent/rent_screen.dart';

class Body extends StatelessWidget{
  final String? email;
  final String? password;

  const Body({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            advertisement(email: email,password: password,),
            SizedBox(height: getProportionateScreenWidth(10)),
            SizedBox(height: getProportionateScreenWidth(10)),
            InkWell(child:rent(),onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>Rent_screen(email: email,password: password,))),),
            SizedBox(height: getProportionateScreenWidth(13)),
            Divider(thickness: 2,indent: 25,endIndent: 25,color: kTextColor,),
            SizedBox(height: getProportionateScreenWidth(7)),
            near_you(email: email,password: password,),
            SizedBox(height: getProportionateScreenWidth(10)),
            const Divider(thickness: 2,indent: 75,endIndent: 75,color: kTextColor,),
            InkWell(child:buy(),onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>leaseScreen(email: email,password: password,))),),
            SizedBox(height: getProportionateScreenWidth(15)),
            const Divider(thickness: 2,indent: 25,endIndent: 25,color: kTextColor,),
            SizedBox(height: getProportionateScreenWidth(10)),
            city(email: email,password: password,),
            SizedBox(height: getProportionateScreenWidth(10)),
            /*Divider(thickness: 2,indent: 75,endIndent: 75,color: kTextColor,),*/
           /* InkWell(child:post_ad(),onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>add_property_screen())),),*/
            /*SizedBox(height: getProportionateScreenWidth(30)),
            //PopularProducts(),*/
            SizedBox(height: getProportionateScreenWidth(12)),
          ],
        ),
      ),
    );
  }


}