import 'package:flutter/material.dart';
import 'package:rentease/routes.dart';
import 'package:rentease/screens/sign_in/sign_in_screen.dart';

import 'package:rentease/screens/splash/splash_screen.dart';
import 'package:rentease/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      //initialRoute: SignInScreen.routeName,
      routes: routes,
    );
  }
}
