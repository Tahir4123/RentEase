import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rentease/model/House.dart';
import 'package:http/http.dart' as http;

import '../../../constants.dart';
import '../../../model/ownerListing.dart';
import '../../../size_config.dart';

class propertyImages extends StatefulWidget {
  propertyImages({
    super.key,
    required this.property,
  });
  final Map<String,dynamic> property;

  @override
  _propertyImagesState createState() => _propertyImagesState();
}

class _propertyImagesState extends State<propertyImages> {
  int selectedImage = 0;
  List<String> imagePaths = [];

  @override
  void initState() {
    super.initState();
    fetchImages(widget.property['name'], widget.property['address']);
  }

  Future<void> fetchImages(String name, String address) async {
    final response = await http.get(
      Uri.parse('http://' + api + ':3000/retrieveimages?name=$name&address=$address'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        imagePaths = List<String>.from(data['imagePaths']);
      });
    } else {
      print(widget.property['address']);
      // Handle errors here, such as displaying an error message
      print('Failed to retrieve images: ${response.statusCode}');
    }
  }

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
                      image: AssetImage(imagePaths[selectedImage]),
                      fit: BoxFit.cover
                  )
              ),
            ),
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(imagePaths.length,
                (index) => buildSmallpropertyPreview(index)),
          ],
        )
      ],
    );
  }

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
        child: Image.asset(imagePaths[index]),
      ),
    );
  }
}
