import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rentease/components/filter/BedroomToggle.dart';
import 'package:rentease/components/filter/price_range.dart';

import '../../constants.dart';
import '../../size_config.dart';
import 'LookingForToggle.dart';

class Filter extends StatefulWidget {
  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  int selectedToggleIndex = 0;
  RangeValues currentRangeValues = RangeValues(0, 0);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Filters',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/cancel.svg',
              height: 20,
            ),
            onPressed: ()=>Navigator.pop(context),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Looking for',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  LookigForToggle(
                    onSelectedIndexChanged: (int index) {
                      setState(() {
                        selectedToggleIndex = index;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
              Divider(
                thickness: 0.5,
                color: Colors.black,
              ),
              SizedBox(height: 15),
              Text(
                'Property Type',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 5),
              Container(
                height: 200,
                decoration: BoxDecoration(border: Border.all()),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price Range',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    '\$${_getFormattedPrice(currentRangeValues.start)} - \$${_getFormattedPrice(currentRangeValues.end)}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              PriceRange(
                selectedToggleIndex: selectedToggleIndex,
                currentRangeValues: currentRangeValues,
                onChanged: (RangeValues values) {
                  setState(() {
                    currentRangeValues = values;
                  });
                },
              ),
              Text(
                'Bedrooms',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              BedroomToggle(
                onSelectedIndexChanged: (int index) {
                  setState(() {
                    selectedToggleIndex = index;
                  });
                },
              ),
              SizedBox(height: 10),
              Text(
                'Bathrooms',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              BedroomToggle(
                onSelectedIndexChanged: (int index) {
                  setState(() {
                    selectedToggleIndex = index;
                  });
                },
              ),
            ],
          ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(bottom: getProportionateScreenHeight(8),right: getProportionateScreenWidth(8) ),
          child: ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
              ),
              child: Text(
                'Filter',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: getProportionateScreenHeight(16)
                ),
              )
          ),
        )
      ],
      );
  }
  String _getFormattedPrice(double price) {
    if (price < 1000) {
      return '0';
    } else if (price >= 1000 && price < 1000000 && selectedToggleIndex==0) {
      return '${(price / 1000).toStringAsFixed(0)}k';
    }else if (price >= 1000 && price < 100000 && selectedToggleIndex==1) {
      return '${(price / 1000).toStringAsFixed(0)}k';
    } else if (price >= 100000 && selectedToggleIndex==1) {
      return '100k+';
    } else {
      return '${(price / 1000000).toStringAsFixed(0)}M+';
    }
  }
}


