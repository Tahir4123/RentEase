import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io'as io; // Import 'dart:io' for File class
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rentease/components/default_button.dart';
import 'package:rentease/constants.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:rentease/landowner/home/homescreen.dart';
import 'package:rentease/size_config.dart';

List<String> houseType=['House','Apartment','Villa'];

class FirstPage extends StatefulWidget {
  final String? email;
  final String? password;

  const FirstPage({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}


class _FirstPageState extends State<FirstPage> {


  String owner = "";
  String area ="";
  String rent ="";
  String security ="";
  String dropdownValue=houseType.first;
  String? selectedOption='Both';

  List<io.File> pickedImages = [];

  @override
  void initState() {
    super.initState();
    getownerData();
  }


  TextEditingController name_c = new TextEditingController();
  TextEditingController address_c = new TextEditingController();
  TextEditingController city_c = new TextEditingController();
  TextEditingController bedroom_c = new TextEditingController();
  TextEditingController bathroom_c = new TextEditingController();
  TextEditingController area_c = new TextEditingController();
  TextEditingController rent_c = new TextEditingController();
  TextEditingController description_c = new TextEditingController();
  TextEditingController security_c = new TextEditingController();
  TextEditingController guest_c = new TextEditingController();
  TextEditingController state_c = new TextEditingController();
  TextEditingController year = new TextEditingController();


  Future<void> pickImages() async {
    if (pickedImages.isNotEmpty) {
      // If 10 images have already been picked, show a message or handle accordingly
      removeError(error: kimageNullError);
      if (pickedImages.length > 10) {
        pickedImages = pickedImages.sublist(0, 10);
        removeError(error: kimagelongError);

      }
      else{
        addError(error: kimagelongError);
      }
    }
    else{
      addError(error: kimageNullError);
    }

    List<XFile>? picked = await ImagePicker().pickMultiImage(
      maxWidth: 800, // Adjust the image quality and size as needed
      imageQuality: 80,
    );
    if (picked != null) {
      setState(() {
        pickedImages.addAll(picked.map((XFile xFile) => io.File(xFile.path)));
        // Limit the number of images to 10
      });
    }
  }

  final List<String?> errors = [];
  final _formKey = GlobalKey<FormState>();


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
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              height: SizeConfig.screenHeight*0.535,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: getProportionateScreenHeight(5),),
                      TextFormField(
                        textCapitalization: TextCapitalization.characters,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            removeError(error: khNamelNullError);
                          }
                          return null;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            addError(error: khNamelNullError);
                            return "";
                          }
                          return null;
                        },
                        controller: name_c,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 15),
                            label: Text(
                              'Property Name',
                              style: TextStyle(
                                  fontSize: getProportionateScreenHeight(18),
                                  color: kblackcolor
                              ),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: 'Enter Property Name',
                            hintStyle: TextStyle(
                                color: kTextColor,
                                fontSize: getProportionateScreenHeight(16)
                            )
                        ),

                        style: TextStyle(
                            color: kblackcolor,
                            fontSize: getProportionateScreenHeight(16)
                        ),

                      ),
                      SizedBox(height: getProportionateScreenHeight(25),),
                      TextFormField(
                        textCapitalization: TextCapitalization.characters,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            removeError(error: khaddresslNullError);
                          }
                          return null;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            addError(error: khaddresslNullError);
                            return "";
                          }
                          return null;
                        },
                        controller: address_c,
                        style: TextStyle(
                            color: kblackcolor,
                            fontSize: getProportionateScreenHeight(16)
                        ),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 15),
                            label: Text(
                              'Address',
                              style: TextStyle(
                                  fontSize: getProportionateScreenHeight(18),
                                  color: kblackcolor
                              ),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: 'Enter Your Address',
                            hintStyle: TextStyle(
                                color: kTextColor,
                                fontSize: getProportionateScreenHeight(16)
                            )
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(25),),
                      Row(
                        children: [
                          Container(
                            width: getProportionateScreenWidth(167),
                            child: TextFormField(
                              textCapitalization: TextCapitalization.characters,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  removeError(error: kdecityNullError);
                                }
                                return null;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  addError(error: kdecityNullError);
                                  return "";
                                }
                                return null;
                              },
                              controller: city_c,
                              style: TextStyle(
                                  color: kblackcolor,
                                  fontSize: getProportionateScreenHeight(16)
                              ),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                                  label: Text(
                                    'City',
                                    style: TextStyle(
                                        fontSize: getProportionateScreenHeight(18),
                                        color: kblackcolor
                                    ),
                                  ),
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  hintText: 'Enter Your City',
                                  hintStyle: TextStyle(
                                      color: kTextColor,
                                      fontSize: getProportionateScreenHeight(16)
                                  )
                              ),
                            ),
                          ),
                          SizedBox(width: getProportionateScreenWidth(10),),
                          Container(
                            width: getProportionateScreenWidth(167),
                            child: TextFormField(
                              textCapitalization: TextCapitalization.characters,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  removeError(error: kstateNullError);
                                }
                                return null;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  addError(error: kstateNullError);
                                  return "";
                                }
                                return null;
                              },
                              controller: state_c,
                              style: TextStyle(
                                  color: kblackcolor,
                                  fontSize: getProportionateScreenHeight(16)
                              ),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                                  label: Text(
                                    'State',
                                    style: TextStyle(
                                        fontSize: getProportionateScreenHeight(18),
                                        color: kblackcolor
                                    ),
                                  ),
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  hintText: 'Enter Your State',
                                  hintStyle: TextStyle(
                                      color: kTextColor,
                                      fontSize: getProportionateScreenHeight(16)
                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(10),),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,),
                        child: Text(
                          'Select Rent Type',
                          style: TextStyle(
                            color: kblackcolor,
                            fontSize: getProportionateScreenHeight(18),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0,bottom: 5),
                        child: Row(
                          children: [
                            Radio<String>(
                              value: 'Rent',
                              groupValue: selectedOption,
                              onChanged: (value) {
                                setState(() {
                                  selectedOption = value!;
                                });
                              },
                            ),
                            Text(
                              'Rent',
                              style: TextStyle(
                                fontSize: getProportionateScreenHeight(16),
                                color: kblackcolor,
                              ),
                            ),
                            SizedBox(width: getProportionateScreenWidth(10),),
                            Radio<String>(
                              value: 'Lease',
                              groupValue: selectedOption,
                              onChanged: (value) {
                                setState(() {
                                  selectedOption = value!;
                                });
                              },
                            ),
                            Text(
                              'Lease',
                              style: TextStyle(
                                fontSize: getProportionateScreenHeight(16),
                                color: kblackcolor,
                              ),
                            ),
                            Radio<String>(
                              value: 'Both',
                              groupValue: selectedOption,
                              onChanged: (value) {
                                setState(() {
                                  selectedOption = value!;
                                });
                              },
                            ),
                            Text(
                              'Both',
                              style: TextStyle(
                                fontSize: getProportionateScreenHeight(16),
                                color: kblackcolor,
                              ),
                            ),

                          ],
                        ),
                      ),

                      SizedBox(height: getProportionateScreenHeight(25),),
                      Row(
                        children: [
                          Container(
                            width: getProportionateScreenWidth(167),
                            child: TextFormField(
                              textCapitalization: TextCapitalization.characters,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  removeError(error: kbuilt_yearNullError);
                                }
                                return null;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  addError(error: kbuilt_yearNullError);
                                  return "";
                                }
                                return null;
                              },
                              controller: year,
                              style: TextStyle(
                                  color: kblackcolor,
                                  fontSize: getProportionateScreenHeight(16)
                              ),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                                  label: Text(
                                    'Built Year',
                                    style: TextStyle(
                                        fontSize: getProportionateScreenHeight(18),
                                        color: kblackcolor
                                    ),
                                  ),
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  hintText: 'Enter Built Year',
                                  hintStyle: TextStyle(
                                      color: kTextColor,
                                      fontSize: getProportionateScreenHeight(16)
                                  )
                              ),
                            ),
                          ),
                          SizedBox(width: getProportionateScreenWidth(10),),
                          Container(
                            width: getProportionateScreenWidth(167),
                            child: TextFormField(
                              textCapitalization: TextCapitalization.characters,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  removeError(error: kguestNullError);
                                }
                                return null;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  addError(error: kguestNullError);
                                  return "";
                                }
                                return null;
                              },
                              controller: guest_c,
                              style: TextStyle(
                                  color: kblackcolor,
                                  fontSize: getProportionateScreenHeight(16)
                              ),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                                  label: Text(
                                    'No. of Guests',
                                    style: TextStyle(
                                        fontSize: getProportionateScreenHeight(18),
                                        color: kblackcolor
                                    ),
                                  ),
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  hintText: 'Allowed Guests',
                                  hintStyle: TextStyle(
                                      color: kTextColor,
                                      fontSize: getProportionateScreenHeight(16)
                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(25),),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
                          label: Text(
                            'Property Type',
                            style: TextStyle(
                                fontSize: getProportionateScreenHeight(18),
                                color: kblackcolor
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_drop_down_rounded,),
                        elevation: 16,
                        style: TextStyle(
                            color: kblackcolor,
                            fontSize: getProportionateScreenHeight(16)
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        items: houseType.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: getProportionateScreenHeight(25),),
                      Row(
                        children: [
                          Container(
                            width: getProportionateScreenWidth(167),
                            child: TextFormField(
                              textCapitalization: TextCapitalization.characters,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  removeError(error: kbedroomlNullError);
                                }
                                return null;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  addError(error: kbedroomlNullError);
                                  return "";
                                }
                                return null;
                              },
                              controller: bedroom_c,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  color: kblackcolor,
                                  fontSize: getProportionateScreenHeight(16)
                              ),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                                  label: Text(
                                    'Bedrooms',
                                    style: TextStyle(
                                        fontSize: getProportionateScreenHeight(18),
                                        color: kblackcolor
                                    ),
                                  ),
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  hintText: 'No. of Bedrooms',
                                  hintStyle: TextStyle(
                                      color: kTextColor,
                                      fontSize: getProportionateScreenHeight(16)
                                  )
                              ),
                            ),
                          ),
                          SizedBox(width: getProportionateScreenWidth(10),),
                          Container(
                            width: getProportionateScreenWidth(167),
                            child: TextFormField(
                              textCapitalization: TextCapitalization.characters,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  removeError(error: kbathroomNullError);
                                }
                                return null;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  addError(error: kbathroomNullError);
                                  return "";
                                }
                                return null;
                              },
                              controller: bathroom_c,
                              style: TextStyle(
                                  color: kblackcolor,
                                  fontSize: getProportionateScreenHeight(16)
                              ),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                                  label: Text(
                                    'Bathrooms',
                                    style: TextStyle(
                                        fontSize: getProportionateScreenHeight(18),
                                        color: kblackcolor
                                    ),
                                  ),
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  hintText: 'No. of Bathrooms',
                                  hintStyle: TextStyle(
                                      color: kTextColor,
                                      fontSize: getProportionateScreenHeight(16)
                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(25),),
                      Row(
                        children: [
                          Container(
                            width: getProportionateScreenWidth(167),
                            child: TextFormField(
                              textCapitalization: TextCapitalization.characters,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  setState(() {
                                    area = value;
                                  });
                                  removeError(error: kareaNullError);
                                }
                                return null;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  addError(error: kareaNullError);
                                  return "";
                                }
                                return null;
                              },
                              controller: area_c,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  color: kblackcolor,
                                  fontSize: getProportionateScreenHeight(16)
                              ),
                              decoration: InputDecoration(
                                  suffixText: area.isNotEmpty?'sq/ft':'',
                                  suffixStyle: TextStyle(
                                    color: kblackcolor,
                                    fontSize: getProportionateScreenHeight(16),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                                  label: Text(
                                    'Area/Size',
                                    style: TextStyle(
                                        fontSize: getProportionateScreenHeight(18),
                                        color: kblackcolor
                                    ),
                                  ),
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  hintText: 'Enter Area/Size',
                                  hintStyle: TextStyle(
                                      color: kTextColor,
                                      fontSize: getProportionateScreenHeight(16)
                                  )
                              ),
                            ),
                          ),
                          SizedBox(width: getProportionateScreenWidth(10),),
                          Container(
                            width: getProportionateScreenWidth(167),
                            child: TextFormField(
                              textCapitalization: TextCapitalization.characters,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  setState(() {
                                    rent = value; // Update the stored value when the user enters input
                                  });
                                  removeError(error: krentNullError);
                                }
                                return null;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  addError(error: krentNullError);
                                  return "";
                                }
                                return null;
                              },
                              controller: rent_c,
                              style: TextStyle(
                                  color: kblackcolor,
                                  fontSize: getProportionateScreenHeight(16)
                              ),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 15,),
                                  label: Text(
                                    'Rent Amount',
                                    style: TextStyle(
                                        fontSize: getProportionateScreenHeight(18),
                                        color: kblackcolor
                                    ),
                                  ),
                                  prefixText: rent.isNotEmpty ? '₹':'',
                                  prefixIconColor: kblackcolor,
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  hintText: 'Enter Rent',

                                  hintStyle: TextStyle(
                                      color: kTextColor,
                                      fontSize: getProportionateScreenHeight(16)
                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(25),),
                      Container(
                        width: getProportionateScreenWidth(167),
                        child: TextFormField(
                          textCapitalization: TextCapitalization.characters,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              removeError(error: ksecuritylNullError);
                              setState(() {
                                security = value; // Update the stored value when the user enters input
                              });
                            }
                            return null;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              addError(error: ksecuritylNullError);
                              return "";
                            }
                            return null;
                          },
                          controller: security_c,
                          style: TextStyle(
                              color: kblackcolor,
                              fontSize: getProportionateScreenHeight(16)
                          ),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 15,),
                              label: Text(
                                'Security Amount',
                                style: TextStyle(
                                    fontSize: getProportionateScreenHeight(18),
                                    color: kblackcolor
                                ),
                              ),
                              prefixText: rent.isNotEmpty ? '₹':'',
                              prefixIconColor: kblackcolor,
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              hintText: 'Enter Security',

                              hintStyle: TextStyle(
                                  color: kTextColor,
                                  fontSize: getProportionateScreenHeight(16)
                              )
                          ),
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(25),),
                      TextFormField(
                        textCapitalization: TextCapitalization.characters,
                        controller: description_c,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                            label: Text(
                              'Description (Optional)',
                              style: TextStyle(
                                  fontSize: getProportionateScreenHeight(18),
                                  color: kblackcolor
                              ),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: 'Enter Description',
                            hintStyle: TextStyle(
                                color: kTextColor,
                                fontSize: getProportionateScreenHeight(16)
                            ),
                            alignLabelWithHint: true
                        ),
                        style: TextStyle(
                            color: kblackcolor,
                            fontSize: getProportionateScreenHeight(16)
                        ),
                        maxLines: 5,
                      ),
                      SizedBox(height: getProportionateScreenHeight(25),),
                      InkWell(
                        onTap: () => pickImages(),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Add Image',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Visibility(
                              visible: pickedImages.isEmpty,
                              child: Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: EdgeInsets.all(15),
                                child: Icon(Icons.camera_alt_outlined, size: 50),
                              ),
                            ),
                            Visibility(
                              visible: pickedImages.isNotEmpty,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: pickedImages.map((io.File image) {
                                    return Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Container(
                                        height: 120,
                                        width: 120,
                                        decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Image.file(
                                          image,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(25),),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20, right: 20,bottom: 45),
              child: DefaultButton(
                text: 'Save',
                icon: 'signIn_forward',
                press: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    setState(() {
                      insertData();
                      sendImagesToServer(
                          pickedImages, name_c.text, address_c.text);
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) =>
                          HomeScreen_l(
                              email: widget.email, password: widget.password)));
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> insertData() async {
    print("hi");

    final url = Uri.parse('http://' + api + ':3000/inserthouse');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'owner': owner,
          'name': name_c.text,
          'address': address_c.text,
          'city': city_c.text,
          'built_type': dropdownValue,
          'bedroom': bedroom_c.text,
          'bathroom': bathroom_c.text,
          'area': area_c.text,
          'rent': rent_c.text,
          'state': state_c.text,
          'type':selectedOption,
          'description': description_c.text,
          'security': security_c.text,
          'built_year': year.text,
          'guest_limit': guest_c.text,
        }),
      );

      if (response.statusCode == 200) {
        print('Data inserted successfully');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Congratulations your property is listed'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        print('Failed to insert data');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Listing failed. Please try again.'),
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

  Future<void> getownerData() async {
    final url = Uri.parse('http://'+api+':3000/getownerdata');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Parse the JSON response
        final List<dynamic> userData = jsonDecode(response.body);

        // Check if the provided email and password match any user record
        final user = userData.firstWhere(
              (user) => user['email'] == widget.email && user['pass'] == widget.password,
          orElse: () => null,
        );

        if (user != null) {
          owner= user['fname']+" "+user['lname'];
          print(owner);
          // Credentials are correct, navigate to the next page (HomeScreen)
        } else {
          print('credentials are wrong');
          // Credentials are incorrect, show an error message
        }
      } else {
        print('Failed to retrieve data');

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

  Future<void> sendImagesToServer(List<io.File?> images, String name, String address) async {
    try {
      final url = Uri.parse('http://' + api + ':3000/insertimage'); // Replace with your server URL
      final request = http.MultipartRequest('POST', url);
      request.fields['name'] = name;
      request.fields['address'] = address;

      for (int i = 0; i < images.length; i++) {
        io.File? image = images[i];

        if (image != null) {
          final imageStream = http.ByteStream(image.openRead());
          final length = await image.length();
          final multipartFile = http.MultipartFile(
            'image$i+1', // Change 'image$i' to your desired field name
            imageStream,
            length,
            filename: 'image$i.png', // Change to an appropriate file extension
          );
          request.files.add(multipartFile);
        }
      }

      final response = await request.send();

      if (response.statusCode == 200) {
        // Images uploaded successfully
        print('Images uploaded successfully');
      } else {
        // Handle the error
        print('Failed to upload images');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

}


