import 'package:flutter/material.dart';
import 'package:rentease/constants.dart';

import '../../../size_config.dart';

class review extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Text(
            'Review your payment collected',
            style: TextStyle(
                fontSize: getProportionateScreenWidth(20),
                fontWeight: FontWeight.bold,
                color: kblackcolor
            ),
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(7)),
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Container(
            height: getProportionateScreenWidth(180),
            width: getProportionateScreenWidth(330),
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/payment.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10 )
            ),
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(10)),

      ],
    );
  }
}



