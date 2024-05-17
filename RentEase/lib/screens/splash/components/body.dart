import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rentease/constants.dart';
import 'package:rentease/screens/sign_in/sign_in_screen.dart';
import 'package:rentease/size_config.dart';

// This is the best practice
import '../../../components/default_button.dart';
import '../../../landowner/sign_in_l/sign_in_screen_l.dart';
import '../../sign_up/sign_up_screen.dart';


class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/splash.png',),
              fit: BoxFit.cover
          )
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 250,),
              child: Text(
                'RentEase',
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(20),
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height:3,
                )
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 105 ,),
              child: Text(
                'Find Your',
                style: TextStyle(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height: 1.2
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 165),
              child: Text(
                  'Perfect',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    height: 1
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 187),
              child: Text('Rental',
                  style: TextStyle(
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    height: 1
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:12,right: 12,top: 13),
              child: SizedBox(
                width: double.infinity,
                height: getProportionateScreenHeight(50),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    primary: Colors.white,
                    backgroundColor: kPrimaryColor,
                  ),
                  onPressed:() {
                    Navigator.pushNamed(context, SignInScreen_l.routeName);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13.0,),
                        child: Text(
                          'Continue as Landlord',
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: SvgPicture.asset('assets/icons/signIn_forward.svg',height: 20,color: kPrimaryColor,)
                      )
                    ],
                  ),
                ),
              )
            ),
            Padding(
                padding: const EdgeInsets.only(left:12,right: 12,top: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: getProportionateScreenHeight(50),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      primary: Colors.white,
                      backgroundColor: kPrimaryColor,
                    ),
                    onPressed:(){
                      Navigator.pushNamed(context, SignInScreen.routeName);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13.0,),
                          child: Text(
                            'Continue as Tenant',
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(18),
                              color: Colors.white,
                            ),
                          ),
                        ),
                        CircleAvatar(
                            backgroundColor: Colors.white,
                            child: SvgPicture.asset('assets/icons/signIn_forward.svg',height: 20,color: kPrimaryColor,)
                        )
                      ],
                    ),
                  ),
                )
            ),
          ],
        ),
      )
    );
  }
}
