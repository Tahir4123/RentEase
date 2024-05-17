import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rentease/constants.dart';
import 'package:rentease/screens/details/details_screen.dart';
import 'package:http/http.dart' as http;
import '../../../../model/House.dart';
import '../../../../size_config.dart';

class Ad_widget extends StatefulWidget {
  Ad_widget({
    super.key,
    required this.property,
  });

  final Map<String, dynamic> property;

  @override
  State<Ad_widget> createState() => _Ad_widgetState();
}

class _Ad_widgetState extends State<Ad_widget> {
  List<String> imagePaths = [];

  @override
  void initState() {
    super.initState();
    fetchImages(widget.property['name'], widget.property['address']);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        DetailsScreen.routeName,
        arguments: ProductDetailsArguments(property: widget.property),
      ),
      child: Container(
        width: SizeConfig.screenWidth,
        height: 240,
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: 0.8,
            image: AssetImage(imagePaths.isNotEmpty ? imagePaths[0] : 'assets/images/sample.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 150, left: 35),
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/icons/Location point.svg",
                color: Colors.white,
              ),
              Text(
                ' ' + widget.property['city'],
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(16),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

/*
  Future<void> getimageData() async {
    final url = Uri.parse('http://'+api+':3000/retrieveimages'); // Adjust the API endpoint accordingly

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> imageData = jsonDecode(response.body);

        // Filter image URLs based on name and address
        final filteredImageUrls = imageData
            .where((image) =>
        image['name'] == widget.property['name'] &&
            image['address'] == widget.property['address'])
            .map<String>((image) => image['imageurl'])
            .toList();
        print(filteredImageUrls);
        setState(() {
          imageUrls = filteredImageUrls;
        });
      } else {
        print('Failed to retrieve image data');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to retrieve image data. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print('Error: $e');

    }
  }
*/

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
}
