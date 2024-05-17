import 'package:flutter/widgets.dart';
import 'package:rentease/landowner/details_l/details_screen_l.dart';
import 'package:rentease/landowner/listing/listingScreen.dart';
import 'package:rentease/screens/Booked/booked_screen.dart';
import 'package:rentease/screens/complete_profile/complete_profile_screen.dart';
import 'package:rentease/screens/details/details_screen.dart';
import 'package:rentease/screens/favourites/favourites_screen.dart';
import 'package:rentease/screens/forgot_password/forgot_password_screen.dart';
import 'package:rentease/screens/homescreen/home.dart';
import 'package:rentease/screens/profile/profile_screen.dart';
import 'package:rentease/screens/sign_in/sign_in_screen.dart';
import 'package:rentease/screens/splash/splash_screen.dart';
import 'package:rentease/screens/search/searchScreen.dart';
import 'landowner/add_property/addPropertyScreen.dart';
import 'landowner/complete_profile_l/complete_profile_screen_l.dart';
import 'landowner/forgot_password_l/forgot_password_screen_l.dart';
import 'landowner/home/homescreen.dart';
import 'landowner/profile/profile_screen_l.dart';
import 'landowner/sign_in_l/sign_in_screen_l.dart';
import 'landowner/sign_up_l/sign_up_screen_l.dart';
import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  SignInScreen_l.routeName: (context) => SignInScreen_l(),
  ForgotPasswordScreen_l.routeName: (context) => ForgotPasswordScreen_l(),
  SignUpScreen_l.routeName: (context) => SignUpScreen_l(),
  DetailsScreen_l.routeName: (context) => DetailsScreen_l(),



};
