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
                  'Everything you need to know about RentEase as landlord',
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
                      question: 'How can I list my rental property on Rentease?',
                      answer:
                        'To list your rental property, log in to your landlord account and click on the "Post property" in your home dashboard. Follow the steps to provide property details, including photos and rental terms.'
                    ),
                    FAQItem(
                        question: 'What information should I include in my property listing?',
                        answer:
                            'In your property listing, include accurate and detailed information about your rental property, such as location, rent amount, lease terms, and any specific features or requirements.'
                    ),
                    FAQItem(
                        question:
                        "How can I extend or renew a tenant's lease on Rentease?",
                        answer:
                        " Rentease does not currently offer the option for landlords to extend or renew a tenant's lease through the landlord dashboard. To continue a tenancy with an existing tenant, both parties will need to coordinate the process separately, and the tenant will need to book the property again if they wish to renew their lease. Please communicate with your tenant directly regarding lease extensions or renewals and follow the necessary steps to facilitate the process outside of Rentease. If you have any questions or need further guidance, please feel free to reach out to our customer support team."
                    ),
                    FAQItem(
                        question: 'What should I do if I have a dispute with a tenant?',
                        answer:
                            'If you have a dispute with a tenant, try to communicate and resolve the issue amicably. If needed, you can seek guidance from Rentease support to help mediate or resolve the dispute.'
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