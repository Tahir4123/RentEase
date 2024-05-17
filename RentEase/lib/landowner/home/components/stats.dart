import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../size_config.dart';

class stats extends StatelessWidget {
  const stats({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.number,
  });

  final String title,icon;
  final Color color;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      width: 150,
      height: 110,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10.0,top: 10 ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  number.toString(),
                  style: TextStyle(
                      fontSize: getProportionateScreenHeight(24),
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
                SvgPicture.asset(
                  'assets/icons/'+icon+'.svg',
                  height: getProportionateScreenHeight(35),
                  color: Colors.white,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'Total',
              style: TextStyle(
                fontSize: getProportionateScreenHeight(16),
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: getProportionateScreenHeight(16),
                  color: Colors.white,
                  height: 1
              ),
            ),
          )
        ],
      ),
    );
  }
}