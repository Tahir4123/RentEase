import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;


import '../../../constants.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({
    Key? key,
    required this.name
  }) : super(key: key);

  final String name;
  @override
  _ProfilePicState createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  File? _pickedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _pickedImage = File(pickedImage.path);
      });
      sendImageToServer(_pickedImage, widget.name);

    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundImage: _pickedImage != null
                ? FileImage(_pickedImage!) as ImageProvider<Object>?
                : AssetImage("assets/images/Profile Image.png") as ImageProvider<Object>?,
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white),
                  ),
                  primary: Colors.white,
                  backgroundColor: Color(0xFFF5F6F9),
                ),
                onPressed: _pickImage,
                child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Future<void> sendImageToServer(File? image, String name) async {
    try {
      final url = Uri.parse('http://' + api + ':3000/insertprofile'); // Replace with your server URL
      final request = http.MultipartRequest('POST', url);
      request.fields['name'] = name;

      if (image != null) {
        final imageStream = http.ByteStream(image.openRead());
        final length = await image.length();
        final multipartFile = http.MultipartFile(
          'image', // Change 'image' to your desired field name
          imageStream,
          length,
          filename: 'image.png', // Change to an appropriate file extension
        );
        request.files.add(multipartFile);
      }

      final response = await request.send();

      if (response.statusCode == 200) {
        // Image uploaded successfully
        print('Image uploaded successfully');
      } else {
        // Handle the error
        print('Failed to upload image');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
