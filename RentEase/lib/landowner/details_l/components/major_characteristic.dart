import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../model/House.dart';
import '../../../model/ownerListing.dart';
import '../../../size_config.dart';

class MajorCharacteristic extends StatelessWidget {
  MajorCharacteristic({
    super.key,
    required this.property,
  });
  final Map<String,dynamic> property;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.all(getProportionateScreenWidth(10)),
          height: 55,
          width: getProportionateScreenWidth(94),
          child: Column(
            children: [
              SvgPicture.asset("assets/icons/bedroom.svg",height: 30,color: kblackcolor,),
              Text(property['bedroom']+' Bedroom')
            ],
          ),
        ),
        Container(
          height: 60,
          child: VerticalDivider(
            thickness: 0.25,
            color: kblackcolor,
            indent: 10,
            endIndent: 10,
          ),
        ),
        Container(
          margin: EdgeInsets.all(getProportionateScreenWidth(10)),
          height: 55,
          width: getProportionateScreenWidth(94),
          child: Column(
            children: [
              SvgPicture.asset("assets/icons/bathroom.svg",height: 30,color: kblackcolor,),
              Text(property['bathroom']+' Bathroom')
            ],
          ),
        ),
        Container(
          height: 60,
          child: VerticalDivider(
            thickness: 0.25,
            color: kblackcolor,
            indent: 10,
            endIndent: 10,
          ),
        ),
        Container(
          margin: EdgeInsets.all(getProportionateScreenWidth(10)),
          height: 55,
          width: getProportionateScreenWidth(94),
          child: Column(
            children: [
              SvgPicture.asset("assets/icons/area.svg",height: 30,color: kblackcolor,),
              Text(property['area']+' Sqft')
            ],
          ),
        ),
      ],
    );
  }
}
