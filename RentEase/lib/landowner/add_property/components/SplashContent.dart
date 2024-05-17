import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'First.dart';

class SplashContent extends StatefulWidget {
  final String? email;
  final String? password;

  const SplashContent({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);

  @override
  State<SplashContent> createState() => _SplashContentState();
}

class _SplashContentState extends State<SplashContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: getProportionateScreenHeight(30),),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 19),
          child: Text(
            "Get Started Managing Your Property",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: kblackcolor,
                fontWeight: FontWeight.bold,
                fontSize: getProportionateScreenHeight(19)
            ),
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(30),),
        FirstPage(email: widget.email,password: widget.password,)      ],
    );
  }
}
