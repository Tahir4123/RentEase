import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rentease/landowner/home/Graphs/columnGraph.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class due_graph extends StatelessWidget {
  const due_graph({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 8,
              child: Container(
                width: 350 ,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kPrimaryColor
                ),
                child: Row(
                  children: [
                    Container(
                      width:210,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 13.0),
                            child: Text(
                              "Houses in City",
                              style: TextStyle(
                                  color: kblackcolor,
                                  fontSize: getProportionateScreenHeight(16),
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: getProportionateScreenHeight(150),
            child: columnGraph(),
          )
        ],
      ),
    );
  }

}