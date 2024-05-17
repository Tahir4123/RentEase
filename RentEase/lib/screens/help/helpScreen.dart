import 'package:flutter/material.dart';

import '../../size_config.dart';

class searchScreen extends StatelessWidget {
  static String routeName = "/search";



  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Help"),
      ),
      body: Column(

      )
    );
  }
}
