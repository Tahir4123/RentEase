import 'package:flutter/material.dart';

import '../../model/ownerListing.dart';
import 'components/body.dart';
import 'components/contact_owner.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen_l extends StatelessWidget {
  static String routeName = "/details_l";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;

    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating: 8),
      ),
      body: Body(property: agrs.property),

    );
  }
}

class ProductDetailsArguments {
  ProductDetailsArguments({
    required this.property,
  });
  final Map<String,dynamic> property;
}
