import 'package:flutter/material.dart';
import 'package:rentease/constants.dart';
import 'package:rentease/size_config.dart';

class Terms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
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
        padding: const EdgeInsets.only(left: 16.0, right: 13, top: 20),
        child: ListView(
          children: [
            // ... (previous tenant terms)

            // Landlord terms
            Text(
              'Terms & Conditions for Landlords',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
                fontSize: getProportionateScreenHeight(20),
              ),
            ),
            Text(
              'By listing your property on our platform, you agree to the following terms and conditions:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kblackcolor,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 13),
            Text(
              '1. Property Listing: ',
              style: TextStyle(fontSize: 16, color: kPrimaryColor),
            ),
            Text(
              '  - You are responsible for providing accurate and up-to-date property details, including rent, lease terms, and property conditions.\n  - Listings must comply with local laws and regulations.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '2. Lease Agreements:',
              style: TextStyle(fontSize: 16, color: kPrimaryColor),
            ),
            Text(
              '  - When a tenant books your property, a legally binding lease agreement is formed.\n  - You must provide a clear and comprehensive lease agreement to tenants before they move in.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '3. Maintenance and Repairs: ',
              style: TextStyle(fontSize: 16, color: kPrimaryColor),
            ),
            Text(
              "  - Ensure that your property is well-maintained and in good repair.\n  - Address maintenance requests from tenants promptly and professionally.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '4. Communication:',
              style: TextStyle(fontSize: 16, color: kPrimaryColor),
            ),
            Text(
              "  - Communicate with tenants respectfully and professionally.\n  - Use our messaging system for property-related communication.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '5. Security and Privacy:',
              style: TextStyle(fontSize: 16, color: kPrimaryColor),
            ),
            Text(
              "  - Protect tenant privacy and personal information.\n  - Report any suspicious activity to Rentease.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '6. Code of Conduct:',
              style: TextStyle(fontSize: 16, color: kPrimaryColor),
            ),
            Text(
              "  - Do not engage in unlawful, abusive, or discriminatory behavior on our platform.\n  - Respect tenant rights and privacy.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '7. Disputes:',
              style: TextStyle(fontSize: 16, color: kPrimaryColor),
            ),
            Text(
              "  - Attempt to resolve disputes with tenants directly.\n  - If needed, cooperate with Rentease support for dispute resolution.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '8. Cancellation and Refunds:',
              style: TextStyle(fontSize: 16, color: kPrimaryColor),
            ),
            Text(
              "  - Establish a clear cancellation policy for your property.\n  - Refund eligibility should align with your policy and be communicated to tenants.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '9. Termination of Account:',
              style: TextStyle(fontSize: 16, color: kPrimaryColor),
            ),
            Text(
              "  - Rentease reserves the right to terminate or suspend your account for violations of our terms and conditions.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '10. Liability:',
              style: TextStyle(fontSize: 16, color: kPrimaryColor),
            ),
            Text(
              "  - You are responsible for the safety and condition of your property.\n  - Rentease is not liable for any loss, damage, or injury related to your property.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '11. Changes to Terms:',
              style: TextStyle(fontSize: 16, color: kPrimaryColor),
            ),
            Text(
              "  - Rentease may update these terms and conditions; continued use of our platform constitutes acceptance of any changes.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '12. Governing Law:',
              style: TextStyle(fontSize: 16, color: kPrimaryColor),
            ),
            Text(
              "  - These terms are governed by [Jurisdiction]'s laws.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'If you have any questions or concerns about these terms and conditions, please contact our customer support team for clarification.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: kblackcolor,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Last Updated: 02-09-2023",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: kblackcolor,
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
