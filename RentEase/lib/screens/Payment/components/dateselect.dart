import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rentease/constants.dart';

import '../../../components/CalenderPage.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../size_config.dart';
import 'package:intl/intl.dart';

import 'body.dart';


class dateselect extends StatefulWidget {
  dateselect({
    super.key,
    required this.property,
  });
  final Map<String,dynamic> property;


  @override
  State<dateselect> createState() => _dateselectState();
}

class _dateselectState extends State<dateselect> {
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

  Future<void> _openBottomSheet() async {

    final result = await showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20)
          )
      ),
      builder: (BuildContext context) {
        return CalendarPage();
      },
    );

    if (result != null && result is Map<String, dynamic>) {
      setState(() {
        startDate = result['startDate'] as DateTime?;
        endDate = result['endDate'] as DateTime?;
      });
    }
  }

  final _formKey = GlobalKey<FormState>();

  String? no_of_guest;
  DateTime? startDate;
  DateTime? endDate;
  TextEditingController datecontrol= new TextEditingController();
  TextEditingController numberguest= new TextEditingController();


  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: Theme.of(context).copyWith(
            dialogBackgroundColor: Colors.white,
            // Customize the background color
            dialogTheme: DialogTheme(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(10.0),
                // Customize the border radius
              ),
            ),
          ),
          child: AlertDialog(
            title: Text(
              'Error',
              style: TextStyle(
                  fontSize: getProportionateScreenHeight(18),
                  color: kblackcolor,
                  fontWeight: FontWeight.bold
              ),
            ),
            content: Text(
              message,
              style: TextStyle(
                  color: kTextColor,
                  fontSize: getProportionateScreenHeight(16)
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  foregroundColor: Colors.white,
                ),
                child: Text("OK"),
              ),
            ],
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: customInputDecorationTheme(),
      ),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: ()=>Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_rounded,
                size: 30,
                color: kblackcolor,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: getProportionateScreenHeight(40)),
                          Text(
                            'Would you like',
                            style: TextStyle(
                              color: kblackcolor,
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            widget.property['name'],
                            style: TextStyle(
                                color: kblackcolor,
                                fontSize: 34,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            'to be your new home',
                            style: TextStyle(
                              color: kblackcolor,
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(height: getProportionateScreenHeight(30),),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                buildDateFormField(),
                                SizedBox(height: getProportionateScreenHeight(20)),
                                buildGuestFormField(),
                                SizedBox(height: getProportionateScreenHeight(40)),
                                DefaultButton(
                                  text: "Confirm Booking",
                                  press: () {
                                    if (startDate == null ||
                                        endDate == null ||
                                        numberguest.text == null
                                    ) {
                                      // Show an error dialog
                                      _showErrorDialog('Please fill all fields.');
                                    }
                                    else{
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Bill(property: widget.property,start: DateFormat('d-MMMM').format(startDate!),end: DateFormat('d-MMMM').format(endDate!))));
                                    }
                                    // if all are valid then go to success screen
                                  },
                                ),
                              ],
                            ),
                          )
                        ]
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
  Container buildGuestFormField() {
    String? guests;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 0.5,color: kTextColor))
      ),
      padding: EdgeInsets.only(left: 8),
      child: Row(
        children: [
          SvgPicture.asset('assets/icons/guests.svg',height: 25,color: kTextColor,),
          Container(
            width: SizeConfig.screenWidth*0.7,
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: numberguest,
              onSaved: (newValue) => guests = newValue,
              decoration: InputDecoration(
                hintText: "Number of Guest",
                border: InputBorder.none,
                // If  you are using latest version of flutter then lable text and hint text shown like this
                // if you r using flutter less then 1.20.* then maybe this is not working properly
              ),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  removeError(error: ktguestNullError);
                }
                else if(int.parse(value)<=int.parse(widget.property['guest_limit'])){
                  removeError(error: klimitNullError);
                }
                return null;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  addError(error: ktguestNullError);
                  return "";
                }
                else if(int.parse(value) > int.parse(widget.property['guest_limit'])){
                  addError(error: klimitNullError);
                  return "";
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }

  InkWell buildDateFormField() {
    return InkWell(
      onTap: _openBottomSheet,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.5,color: kTextColor))
        ),
        padding: EdgeInsets.only(top: 10,bottom: 10,left: 8),
        child: Row(
          children: [
            SvgPicture.asset('assets/icons/booking.svg',height: 25,color: kTextColor,),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                '${startDate==null && endDate==null?'Select a date': 'From '+DateFormat('d-MMMM').format(startDate!)+' to '+DateFormat('d-MMMM').format(endDate!)}',
                style: TextStyle(
                    color: kTextColor,
                    fontSize: getProportionateScreenHeight(15)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  InputDecorationTheme customInputDecorationTheme() {
    return InputDecorationTheme(
      labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      floatingLabelBehavior:
      FloatingLabelBehavior.always, // Customize the label behavior if needed
      contentPadding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20), // Customize the content padding if needed
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      border: InputBorder.none,
    );
  }

}


