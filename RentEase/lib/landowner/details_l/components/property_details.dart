import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../model/House.dart';
import '../../../model/ownerListing.dart';
import '../../../size_config.dart';

class property_details extends StatelessWidget {
  property_details({
    super.key,
    required this.property,
  });
  final Map<String,dynamic> property;
  bool islease = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'Property Details',
            style: TextStyle(
                color: kblackcolor,
                fontWeight: FontWeight.bold,
                fontSize: getProportionateScreenWidth(20)
            ),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Type',
                      style: TextStyle(
                          color: kTextColor,
                          fontSize: getProportionateScreenWidth(15)
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      property['type'],
                      style: TextStyle(
                          color: kblackcolor,
                          fontSize: getProportionateScreenWidth(16)
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: getProportionateScreenWidth(100),),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Property Type',
                  style: TextStyle(
                      color: kTextColor,
                      fontSize: getProportionateScreenWidth(15)
                  ),
                ),
                Text(
                  property['built_type'],
                  style: TextStyle(
                      color: kblackcolor,
                      fontSize: getProportionateScreenWidth(16)
                  ),
                ),
              ],
            )
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Built Year',
                      style: TextStyle(
                          color: kTextColor,
                          fontSize: getProportionateScreenWidth(15)
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      property['built_year'],
                      style: TextStyle(
                          color: kblackcolor,
                          fontSize: getProportionateScreenWidth(16)
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: getProportionateScreenWidth(116 ),),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Size Area',
                  style: TextStyle(
                      color: kTextColor,
                      fontSize: getProportionateScreenWidth(15)
                  ),
                ),
                Text(
                  property['area']+' Sqft',
                  style: TextStyle(
                      color: kblackcolor,
                      fontSize: getProportionateScreenWidth(16)
                  ),
                ),
              ],
            )
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Lease Terms',
                      style: TextStyle(
                          color: kTextColor,
                          fontSize: getProportionateScreenWidth(15)
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Monthly',
                      style: TextStyle(
                          color: kblackcolor,
                          fontSize: getProportionateScreenWidth(16)
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: getProportionateScreenWidth(96),),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'No. of Guest',
                  style: TextStyle(
                      color: kTextColor,
                      fontSize: getProportionateScreenWidth(15)
                  ),
                ),
                Text(
                  '10',
                  style: TextStyle(
                      color: kblackcolor,
                      fontSize: getProportionateScreenWidth(16)
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
