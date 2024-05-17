import 'package:flutter/material.dart';
import 'package:rentease/size_config.dart';

const api= "192.168.0.103";

const kPrimaryColor = Color(0xffFB6161);
const kPrimaryLightColor = Color(0xfffa7f7f);
const kPrimaryExtremeLightColor = Color(0xffff9191);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);
const kblackcolor = Colors.black;

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kPhoneNumbershortError = "Phone number too short";
const String kAddressNullError = "Please Enter your address";

const String ktguestNullError = "Please Enter how many guest you are";
const String klimitNullError = "Looks like you are more then allowed guests";
const String kdateNullError = "Please Enter date";



const String khNamelNullError = "Please Enter your house name";
const String khaddresslNullError = "Please Enter your house address";
const String kdecityNullError = "Please Enter city";
const String kstateNullError = "Please Enter State";
const String ktypeNullError = "Please Enter your house rent type";
const String kbuilt_yearNullError = "Please Enter year your house was built";
const String kguestNullError = "Please Enter no. of guest allowed";
const String kbedroomlNullError = "Please Enter no. of bedroom";
const String kbathroomNullError = "Please Enter no. of bathroom";
const String kareaNullError = "Please Enter area of your house";
const String krentNullError = "Please Enter rent you want for your house";
const String ksecuritylNullError = "Please Enter security needed";
const String kimageNullError = "Please Add an image";
const String kimagelongError = "You have exceeded limit of 10 images";






final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}
