import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rentease/components/custom_surfix_icon.dart';
import 'package:rentease/components/default_button.dart';
import 'package:rentease/components/form_error.dart';
import 'package:rentease/screens/complete_profile/complete_profile_screen.dart';
import 'package:http/http.dart' as http;


import '../../../constants.dart';
import '../../../size_config.dart';
import '../../complete_profile_l/complete_profile_screen_l.dart';



class SignUpForm_l extends StatefulWidget {
  @override
  _SignUpForm_lState createState() => _SignUpForm_lState();
}

class _SignUpForm_lState extends State<SignUpForm_l> {

  bool register=false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emails=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController conform_password=TextEditingController();
  bool remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConformPassFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                getUserData();
                // if all are valid then go to success screen
                if (register==false){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CompleteProfileScreen(email: emails.text,pass: password.text,)));
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Email already registered'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }              }
            },
          ),
        ],
      ),
    );
  }
  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: emails,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: password,
      obscureText: true,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }

      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      controller: conform_password,
      obscureText: true,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && password.text == conform_password.text) {
          removeError(error: kMatchPassError);
        }
/*
        conform_password.text = value;
*/
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((password.text != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }
/*Future<void> insertData(String pass,String email) async {
    String email = emails.text;
    String pass = password.text;
    String fname="";
    String lname="";
    String phone="";
    String address="";
    String profilepic = "user.svg";

    final url = Uri.parse('http://192.168.0.109/3000/insertdata');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'fname':fname,
        'lname':lname,
        'email':email,
        'pass':pass,
        'phone':phone,
        'address':address,
        'profilepic':profilepic
      }),
    );

    if (response.statusCode == 200) {
      print('Data inserted successfully');
    } else {
      print('Failed to insert data');
    }
  }*/
/*Future<void> insertData(String email, String pass) async {
     String email = emails.text;
     String pass = password.text;
     String fname="";
     String lname="";
     String phone="";
     String address="";
     String profilepic = "user.svg";

     final url = Uri.parse('http://192.168.0.101:3000/insertData');

     final response = await http.get(url);
     try {

       if (response.statusCode == 200) {
         print('Data inserted successfully');
       } else {
        print('Failed to insert data');
       }
     } catch (e) {
       print('Error ${response.statusCode}');
       }
   }*/

/*void submitForm() async{
    String Email = email.text;
    String Password = password.text;
    String FName="";
    String LName="";
    String Phone="";
    String Address="";
    String Profilepic = "user.svg";

    String apiUrl= 'http://192.168.0.105:8000/Tenants_create/';

    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'FName':FName,
          'LName':LName,
          'Email':Email,
          'Password':Password,
          'Phone':Phone,
          'Address':Address,
          'Profilepic':Profilepic
        },
      );

      if (response.statusCode == 200) {
        print("Data Saved successfully");

        // Clear fields and update data list if needed
        setState(() {
          email.clear();
          password.clear();
          // Update your userDataList if required
          // userDataList.add({
          //   'license': licenses,
          //   'carbrand': carBrand,
          //   'carmodel': carModel,
          //   'carcity': carCity,
          //   // ... add other fields here
          // });
        });
      } else {
        print('Error saving data');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }*/

  Future<void> getUserData() async {
    final url = Uri.parse('http://'+api+':3000/getuserdata');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Parse the JSON response
        final List<dynamic> userData = jsonDecode(response.body);

        // Check if the provided email and password match any user record
        final user = userData.firstWhere(
              (user) => user['email'] == emails.text,
          orElse: () => null,
        );

        if (user != null) {
          // Credentials are correct, navigate to the next page (HomeScreen)
          setState(() {
            register=true;
          });
        } else {
          // Credentials are incorrect, show an error message
          register = false;
        }
      } else {
        print('Failed to retrieve data');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to retrieve data. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred. Please try again later.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

/*Future<void> insertData(String pass, String email) async {
    String email = emails.text;
    String pass = password.text;
    String fname = "";
    String lname = "";
    String phone = "";
    String address = "";
    String profilepic = "user.svg";

    final url = Uri.parse('http://192.168.0.109/3000/insertdata');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'fname': fname,
          'lname': lname,
          'email': email,
          'pass': pass,
          'phone': phone,
          'address': address,
          'profilepic': profilepic
        }),
      );

      if (response.statusCode == 200) {
        print('Data inserted successfully');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Registration successful!'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        print('Failed to insert data');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Registration failed. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred. Please try again later.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }*/

}

