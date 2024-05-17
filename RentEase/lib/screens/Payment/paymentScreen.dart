import 'package:flutter/material.dart';
import 'package:rentease/screens/Payment/components/dateselect.dart';

import '../../../../model/House.dart';
import 'components/body.dart';


class paymentScreen extends StatelessWidget {
  static String routeName = "/payment";
  paymentScreen({
    super.key,
    required this.property,
  });
  final Map<String,dynamic> property;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: dateselect(property: property,),
    );
  }
}

