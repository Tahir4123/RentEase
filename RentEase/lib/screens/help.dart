import 'package:flutter/material.dart';
import 'package:rentease/constants.dart';
import 'package:rentease/size_config.dart';

class help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                    'The FAQs',
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(15),
                    color: kPrimaryColor
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'Help Centre',
                  style: TextStyle(
                      fontSize: getProportionateScreenHeight(26),
                      fontWeight: FontWeight.bold,
                      color: kblackcolor
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(10),),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'Everything you need to know about RentEase as tenant',
                  style: TextStyle(
                      fontSize: getProportionateScreenHeight(16),
                      color: kTextColor
                  ),
                ),
              ),
              Container(
                height: SizeConfig.screenHeight*0.6,
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    FAQItem(
                      question: 'How can I search for available rental properties?',
                      answer:
                      'To search for rental properties, use the search bar on the homepage. Enter your desired location, date, and number of persons you are, then click "Search."',
                    ),
                    FAQItem(
                      question: 'How can I pay my rent through Rentease?',
                      answer:
                        'You can pay your rent through Rentease using the provided payment options, such as UPI or bank transfers. Look for the "Book Now" section in the house description'
                    ),
                    FAQItem(
                      question:
                      "How can I renew my lease through Rentease?",
                      answer:
                        "Unfortunately, Rentease does not currently offer a lease renewal option. To continue your tenancy, you will need to search for available properties and book a new rental as your current lease approaches its expiration date. We recommend starting your search early to secure your next rental property. If you have any questions or need assistance with the process, feel free to reach out to our customer support team."
                    ),
                    FAQItem(
                      question: 'What should I do if I want to move out of my rental property?',
                      answer:
                        "To move out of your rental property, simply locate the property listing in your account dashboard and click the 'Cancel Booking' button in the house description. This will initiate the move-out process and notify your landlord or property manager. Please ensure you have reviewed your lease agreement for any specific notice requirements and follow the move-out procedures outlined in your lease. If you have any questions or encounter any issues during the process, don't hesitate to contact our customer support team for assistance."
                    ),
                    FAQItem(
                      question: ' Is my personal information secure on Rentease?',
                      answer:
                        "Yes, Rentease takes security seriously. Your personal information is protected using industry-standard security measures. However, it's essential to use strong passwords and be cautious about sharing sensitive information online."
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FAQItem extends StatefulWidget {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});

  @override
  _FAQItemState createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              widget.question,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: kPrimaryColor,
              ),
            ),
            trailing: IconButton(
              icon:
              _expanded ? Icon(Icons.minimize) : Icon(Icons.add),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                widget.answer,
                style: TextStyle(
                  color: kTextColor,
                  fontSize: 16.0,
                ),
              ),
            ),
        ],
      ),
    );
  }
}