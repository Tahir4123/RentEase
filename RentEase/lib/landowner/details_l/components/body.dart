import 'package:flutter/material.dart';
import 'package:rentease/landowner/details_l/components/contact_owner.dart';
import 'package:rentease/landowner/details_l/components/product_description.dart';
import 'package:rentease/landowner/details_l/components/product_images.dart';
import 'package:rentease/screens/details/components/product_images.dart';
import 'package:rentease/size_config.dart';

import '../../../model/ownerListing.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  Body({
    super.key,
    required this.property,
  });
  final Map<String,dynamic> property;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        propertyImages(property: property),
        SizedBox(height: getProportionateScreenHeight(10),),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              propertyDescription(
                property: property,
                pressOnSeeMore: () {},
              ),
              SizedBox(height: getProportionateScreenHeight(10),),
            ],
          ),

        ),
      ],
    );
  }
}
