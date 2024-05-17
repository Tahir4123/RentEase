import 'package:flutter/material.dart';
import 'package:rentease/constants.dart';
import 'package:rentease/landowner/add_property/components/First.dart';
import 'package:rentease/landowner/home/homescreen.dart';
import 'package:rentease/screens/sign_in/sign_in_screen.dart';
import 'package:rentease/size_config.dart';

// This is the best practice
import '../components/SplashContent.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  final String? email;
  final String? password;

  const Body({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  PageController _pageController = PageController();

  void dispose() {
    _pageController.dispose(); // Dispose the PageController to avoid memory leaks
    super.dispose();
  }

  List<Map<String, Widget>> splashData = [
    {
      "text": Padding(
        padding: EdgeInsets.symmetric(horizontal: 19),

      ),
      "Widget": Container()
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(

            height: 150,
            decoration: BoxDecoration(color: kPrimaryColor,),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40.0,right: 10,left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /*Padding(
                    padding: const EdgeInsets.only(left: 14.0),
                    child: InkWell(
                      onTap:()=> Navigator.pop(context),
                        child: CircleAvatar(
                          radius: 27,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                              radius: 25,
                              backgroundColor: kPrimaryColor,

                              child: Icon(
                                Icons.arrow_back_rounded,size: 30,color: Colors.white,),
                              )
                          ),
                        ),
                      ),*/

                  Padding(
                    padding: const EdgeInsets.only(left:30,right: 50.0),
                    child: Text(
                      'Add New Property',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: getProportionateScreenHeight(24),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 116.372),
                  child: Container(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight*0.86,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
                      color: Color(0xFFF5F6F9),
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: getProportionateScreenHeight(20),),
                        SplashContent(
                          email: widget.email,
                          password: widget.password,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
