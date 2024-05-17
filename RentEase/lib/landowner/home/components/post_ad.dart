import 'package:flutter/material.dart';
import 'package:rentease/constants.dart';

import '../../../size_config.dart';

class post_ad extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Text(
            'Post your property',
            style: TextStyle(
                fontSize: getProportionateScreenWidth(20),
                fontWeight: FontWeight.bold,
                color: kblackcolor
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0,),
          child: Text(
            'Get best prices and sales system',
            style: TextStyle(
                fontSize: getProportionateScreenWidth(14),
                color: kTextColor
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
                  image: AssetImage('assets/images/post.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10 )
            ),
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(10)),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Row(
            children: [
              Text(
                'Post your ad',
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



