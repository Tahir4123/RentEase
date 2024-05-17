import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rentease/screens/details/components/top_rounded_container.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../model/House.dart';
import '../../../model/ownerListing.dart';
import '../../../size_config.dart';

class Contact extends StatelessWidget {
  Contact({
    super.key,
    required this.property,
  });
  final Map<String,dynamic> property;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: TopRoundedContainer(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(10),
            right: getProportionateScreenWidth(23),
            bottom: getProportionateScreenWidth(10),
            top: getProportionateScreenWidth(7),
          ),
          child: DefaultButton(text: "Next",icon:"signIn_forward",press:(){})
        ),
      ),
    );
  }
}

