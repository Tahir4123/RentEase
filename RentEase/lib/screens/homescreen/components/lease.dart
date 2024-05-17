import 'package:flutter/material.dart';
import 'package:rentease/constants.dart';

import '../../../size_config.dart';

class buy extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 190),
          child: Text(
              'Lease a home',
            style: TextStyle(
              fontSize: getProportionateScreenWidth(20),
              fontWeight: FontWeight.bold,
              color: kblackcolor
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 60.0,),
          child: Text(
            'Apartments, pent houses, villas and more',
            style: TextStyle(
                fontSize: getProportionateScreenWidth(14),
                color: kTextColor
            ),
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(7)),
        Container(
          height: getProportionateScreenWidth(180),
          width: getProportionateScreenWidth(330),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/lease.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10 )
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(10)),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Row(
            children: [
              Text(
                'Explore all home lease options',
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(14),
                    color: kTextColor
                ),
              ),
              Icon(Icons.arrow_forward_sharp,size: 17,color: kTextColor,)
            ],
          ),
        ),

      ],
    );
  }
}



