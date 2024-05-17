import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../size_config.dart';
import 'filter/filter.dart';

class appbar_search extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 8,
      child: Container(
        width: 305 ,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: kPrimaryColor
        ),
        child: Row(
          children: [
            Container(
              width:235,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white
              ),
              child: Row(
                children: [
                  /*IconButton(
                    icon: SvgPicture.asset("assets/icons/search.svg",
                      color: kblackcolor,),
                    onPressed: () {},
                  ),*/
                  Text("Search Location",style: TextStyle(fontSize: getProportionateScreenWidth(16)),)
                ],
              ),
            ),
            SizedBox(width: 15,),
            SvgPicture.asset("assets/icons/search.svg",
              height: 20,
              color: Colors.white,),
            /*IconButton(
              icon: SvgPicture.asset("assets/icons/filter.svg",
                color: Colors.white,),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Filter();
                    }
                );
              },
            ),*/
          ],
        ),
      ),);
  }

}