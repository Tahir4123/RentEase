import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:rentease/model/House.dart';
import 'package:rentease/screens/homescreen/home.dart';
import 'package:http/http.dart' as http;

import '../../../constants.dart';
import '../../../size_config.dart';

class Bill extends StatefulWidget {
  final Map<String,dynamic> property;
  final String? start,end;

  const Bill({super.key,required this.property,required this.start,required this.end});

  @override
  State<Bill> createState() => _BillState();
}

class _BillState extends State<Bill> {

  String email="";
  String pass="";
  String name="";
  int cf = 300;
  late var _razorpay;

  @override
  void initState() {
    // TODO: implement initState
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    getcurrentData();
    getUserData();
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    insertData();
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen(email: email, password: pass)));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Payment Failed"),
          content: Text("There was an issue processing your payment. Please try again."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
    print("Payment Fail");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
  }


  @override
  Widget build(BuildContext context) {
    num tf = int.parse(widget.property['rent']) + int.parse(widget.property['security']) + cf;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: ()=>Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_rounded,
              color: kblackcolor,
              size: 30,
            ),
          ),
        ),
        body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Card(
                    elevation: 8,
                    child: Container(
                      height: 350,
                      width: 530,
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        child: Column(
                          children: [
                            Text(
                              "Rent Summary",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: 10),
                              leading: Container(
                                  width: 150,
                                  child:
                                  Text("House Rent")),
                              trailing: Text("₹" + widget.property['rent']),
                            ),
                            Divider(),
                            ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: 10),
                              leading: Text("Maintenance Fee"),
                              trailing: Text("₹" + widget.property['security']),
                            ),
                            Divider(),
                            ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: 10),
                              leading: Text("Convenience Fees"),
                              trailing: Text("₹" + cf.toString()),
                            ),
                            Divider(),
                            ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: 10),
                              leading: Text(
                                "Total Rent",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, color: Colors.black),
                              ),
                              trailing: Text(tf.toString()),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    child: Text("Pay Amount"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      foregroundColor: Colors.white
                    ),
                    onPressed: () {
                      ///Make payment
                      var options = {
                        'key': "rzp_test_UWNue9UPsKaP3f",
                        'amount': (tf * 100).toString(), //So its pay 500
                        'name': 'RentEase',
                        'description': 'Demo',
                        'timeout': 500, // in seconds
                        'prefill': {
                          'contact': '8097809001',
                          'email': 'rentease@gmail.com'
                        }
                      };
                      _razorpay.open(options);
                    })
              ],

        ),
      ),
    );
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  Future<void> insertData() async {

    final url = Uri.parse('http://' + api + ':3000/insertbooking');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'user_name':name,
          'name':widget.property['name'],
          'address':widget.property['address'],
          'owner': widget.property['owner'],
          'rent': (int.parse(widget.property['rent']) + int.parse(widget.property['security']) + cf).toString(),
          'start': widget.start,
          'end':widget.end
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
  }

  Future<void> getUserData() async {
    final url = Uri.parse('http://'+api+':3000/getuserdata');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> userData = jsonDecode(response.body);

        final user = userData.firstWhere(
              (user) => user['email'] == email && user['pass'] == pass,
          orElse: () => null,
        );

        if (user != null) {
          setState(() {
            name = user['fname'] + ' ' + user['lname'];
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Invalid email or password. Please try again.'),
              backgroundColor: Colors.red,
            ),
          );
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

  Future<void> getcurrentData() async {
    final url = Uri.parse('http://'+api+':3000/getcurrentdata');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> userData = jsonDecode(response.body);


        if (userData != null) {
          setState(() {
            email = userData.last['email'];
            pass = userData.last['pass'];
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Invalid email or password. Please try again.'),
              backgroundColor: Colors.red,
            ),
          );
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

}