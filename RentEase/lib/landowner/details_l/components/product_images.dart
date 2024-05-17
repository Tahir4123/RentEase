import 'package:flutter/material.dart';
import 'package:rentease/model/House.dart';

import '../../../constants.dart';
import '../../../model/ownerListing.dart';
import '../../../size_config.dart';

class propertyImages_l extends StatefulWidget {
  propertyImages_l({
    super.key,
    required this.property,
  });
  final Map<String,dynamic> property;

  @override
  _propertyImages_lState createState() => _propertyImages_lState();
}

class _propertyImages_lState extends State<propertyImages_l> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: SizeConfig.screenWidth,
          child: AspectRatio(
            aspectRatio: 1.5,
            child: Container(
              width: SizeConfig.screenWidth,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
                image: DecorationImage(
                  image: AssetImage('assets/images/sample.jpg'),
                  fit: BoxFit.cover
                )
              ),
            ),
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(10)),
        /*Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(widget.property.images.length,
                (index) => buildSmallpropertyPreview(index)),
          ],
        )*/
      ],
    );
  }

/*
  GestureDetector buildSmallpropertyPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: kPrimaryColor.withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: Image.asset(widget.property.images[index]),
      ),
    );
  }
*/
}
