import 'package:flutter/material.dart';
import 'package:rentease/landowner/home/Graphs/dougnutgraph.dart';
import 'package:rentease/landowner/home/Graphs/lineGraph.dart';


import '../../../constants.dart';
import '../../../size_config.dart';

class rentGraph extends StatelessWidget {
  const rentGraph({
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
                    color: Colors.white
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13.0),
                      child: Text(
                        "Most Popular Houses",
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
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            width: 139,
            child: popular(),
          ),
          Container(
            height: getProportionateScreenHeight(370),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 25),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 9),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 5,
                          backgroundColor: kPrimaryColor,
                        ),
                        SizedBox(height: getProportionateScreenHeight(27),),
                        CircleAvatar(
                          radius: 5,
                          backgroundColor: Color(0xffE396BC),
                        ),
                        SizedBox(height: getProportionateScreenHeight(27),),
                        CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.pink,
                        ),
                        SizedBox(height: getProportionateScreenHeight(27),),
                        CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.purple,
                        ),
                        SizedBox(height: getProportionateScreenHeight(27),),
                        CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.orange,
                        ),
                        SizedBox(height: getProportionateScreenHeight(27),),
                        CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.red,
                        ),
                        SizedBox(height: getProportionateScreenHeight(27),),
                        CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.yellow,
                        ),
                        SizedBox(height: getProportionateScreenHeight(27),),
                        CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.purpleAccent,
                        ),
                        SizedBox(height: getProportionateScreenHeight(27),),
                        CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.deepOrange,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 9.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'THE GRAND ESTATE',
                          style: TextStyle(
                              fontSize: getProportionateScreenHeight(15),
                              color: kTextColor
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(14),),
                        Text(
                          'THE CHATEAU',
                          style: TextStyle(
                              fontSize: getProportionateScreenHeight(15),
                              color: kTextColor
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(14),),
                        Text(
                          'THE PALAZZO',
                          style: TextStyle(
                              fontSize: getProportionateScreenHeight(15),
                              color: kTextColor
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(14),),
                        Text(
                          'THE OASIS APARTMENT',
                          style: TextStyle(
                              fontSize: getProportionateScreenHeight(15),
                              color: kTextColor
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(14),),
                        Text(
                          'THE HIDDEN TREASURE',
                          style: TextStyle(
                              fontSize: getProportionateScreenHeight(15),
                              color: kTextColor
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(14),),
                        Text(
                          'THE PARADISE',
                          style: TextStyle(
                              fontSize: getProportionateScreenHeight(15),
                              color: kTextColor
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(14),),
                        Text(
                          'THE COUNTRY RETREAT',
                          style: TextStyle(
                              fontSize: getProportionateScreenHeight(15),
                              color: kTextColor
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(14),),
                        Text(
                          'THE RURAL RETREAT',
                          style: TextStyle(
                              fontSize: getProportionateScreenHeight(15),
                              color: kTextColor
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(14),),
                        Text(
                          'THE TRANQUIL ESCAPE',
                          style: TextStyle(
                              fontSize: getProportionateScreenHeight(15),
                              color: kTextColor
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}