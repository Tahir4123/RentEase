import 'package:flutter/material.dart';

import '../../../../model/House.dart';
import 'components/body.dart';
import 'components/contact_owner.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;

    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating: 7),
      ),
      body: Body(property: agrs.property),
      bottomNavigationBar: Contact(property:agrs.property),
    );
  }
}

class ProductDetailsArguments {
  ProductDetailsArguments({
    required this.property,
  });
  final Map<String,dynamic> property;
}
