import 'package:flutter/material.dart';
import 'package:rentease/constants.dart';
import 'package:rentease/size_config.dart';

class Terms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed:()=> Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
        ),
        elevation: 4,
        title: Text("Terms & Conditions"),
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0,right: 13,top: 20,),
        child: ListView(
          children: [
            Text(
              'Welcome to Rentease!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
                fontSize: getProportionateScreenHeight(20),
              ),
            ),
            Text(
              'Your use of our platform is subject to the following terms and conditions.\nBy using Rentease, you agree to comply with these terms.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kblackcolor,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 13),
            Text(
              '1. Account Registration: ',
              style: TextStyle(
                  fontSize: 16,
                color: kPrimaryColor
              ),
            ),
            Text(
              '  - You must create an account to use our platform. \n  - Provide accurate and up-to-date information during registration. \n  - Keep your login credentials secure and confidential.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '2. Property Listings:',
              style: TextStyle(
                  fontSize: 16,
                  color: kPrimaryColor
              ),
            ),
            Text(
              '	- Property listings are provided by landlords. We do not guarantee the accuracy or availability of listings.	\n	- Verify property details, lease terms, and conditions before booking.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '3. Booking and Payments: ',
              style: TextStyle(
                  fontSize: 16,
                  color: kPrimaryColor
              ),
            ),
            Text(
                "	- Booking a property constitutes a legally binding agreement.\n	- Pay all applicable fees and rents as specified in the listing.\n	- Payment methods and terms are subject to the landlord's discretion.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '4. Lease Agreements: ',
              style: TextStyle(
                  fontSize: 16,
                  color: kPrimaryColor
              ),
            ),
            Text(
              "	- Review and sign a lease agreement with the landlord before moving in.\n	- Lease terms, obligations, and responsibilities will be outlined in the agreement.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '5. Maintenance and Repairs:',
              style: TextStyle(
                  fontSize: 16,
                  color: kPrimaryColor
              ),
            ),
            Text(
              "	- Report maintenance issues promptly through our platform.\n	- Coordinate with the landlord for repairs and maintenance.\n	- Comply with the property's care and maintenance guidelines.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '6. Communication:',
              style: TextStyle(
                  fontSize: 16,
                  color: kPrimaryColor
              ),
            ),
            Text(
              "	- Communicate with landlords and other users respectfully and professionally.\n	- Use our messaging system for property-related communication.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '7. Security and Privacy:',
              style: TextStyle(
                  fontSize: 16,
                  color: kPrimaryColor
              ),
            ),
            Text(
              "	- Protect your personal information and report any suspicious activity.\n	- Review our Privacy Policy for details on data handling and protection.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '8. Code of Conduct:',
              style: TextStyle(
                  fontSize: 16,
                  color: kPrimaryColor
              ),
            ),
            Text(
              "	- Do not engage in unlawful, abusive, or discriminatory behavior on our platform.\n	- Respect the rights and privacy of others.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '9. Disputes:',
              style: TextStyle(
                  fontSize: 16,
                  color: kPrimaryColor
              ),
            ),
            Text(
              "	- Attempt to resolve disputes with landlords directly.\n	- If needed, contact Rentease support for assistance in dispute resolution.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '10. Cancellation and Refunds:',
              style: TextStyle(
                  fontSize: 16,
                  color: kPrimaryColor
              ),
            ),
            Text(
              "	- Review the cancellation policy of the property before booking.\n	- Refund eligibility is subject to the landlord's policies.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '11. Termination of Account:',
              style: TextStyle(
                  fontSize: 16,
                  color: kPrimaryColor
              ),
            ),
            Text(
              "	- We reserve the right to terminate or suspend your account for violations of our terms and conditions.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '12. Liability:',
              style: TextStyle(
                  fontSize: 16,
                  color: kPrimaryColor
              ),
            ),
            Text(
              "	- Rentease is not responsible for any loss, damage, or injury related to your use of our platform.\n	- Landlords are responsible for property conditions and safety.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '13. Changes to Terms:',
              style: TextStyle(
                  fontSize: 16,
                  color: kPrimaryColor
              ),
            ),
            Text(
              "	- We may update these terms and conditions; continued use of our platform constitutes acceptance of any changes.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '14. Governing Law:',
              style: TextStyle(
                  fontSize: 16,
                  color: kPrimaryColor
              ),
            ),
            Text(
              "	- These terms are governed by [Jurisdiction]'s laws.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'If you have any questions or concerns about these terms and conditions, please contact our customer support team for clarification.\nYour use of Rentease implies your acceptance of these terms and conditions.',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kblackcolor
              ),
            ),
            SizedBox(height: 8,),
            Text(
              "Last Updated: 02-09-2023",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kblackcolor
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}