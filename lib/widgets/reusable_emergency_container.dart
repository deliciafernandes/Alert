import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ReusableEmergencyContainer extends StatelessWidget {
  final String emergency;
  final String phoneNumber;

  ReusableEmergencyContainer({
    this.emergency,
    this.phoneNumber,
  });

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (this.phoneNumber != null) {
          _launchURL("tel:"+this.phoneNumber);
        }
      },
      child: Material(
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          width: 150.0,
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[200]),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/images/$emergency.png',
                width: 80.0,
                height: 80.0,
              ),
              SizedBox(height: 15.0),
              Text(
                emergency,
                style: TextStyle(fontSize: 18.0, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
