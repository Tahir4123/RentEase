import 'package:flutter/material.dart';

import '../../size_config.dart';
import 'components/Body.dart';

class searchScreen extends StatelessWidget {
  static String routeName = "/search";
  final String? email;
  final String? password;

  const searchScreen({
    Key? key,
    required this.email,
    required this.password,

  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Body(email: email,password: password,),
    );
  }
}
