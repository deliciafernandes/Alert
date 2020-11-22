import 'package:contact_picker/contact_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:road_safety/providers/user_provider.dart';
import 'package:road_safety/utilities/constants.dart';
import 'package:road_safety/views/login_screen.dart';
import "../models/User.dart";

import 'register_screen.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    User user = userProvider.user;
    return userProvider.getUid() == null
        ? RegisterScreenBody()
        : Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(user.name),
                Text(user.phone),
                Text(user.email),
                getContactList(user.emergencyContacts),
              ],
            ),
          );
  }

  Widget getContactList(List<Contact> contacts) {
    print(contacts.toString());
    return Column(
      children: contacts
          .map(
            (contact) => ListTile(
              title: Text(contact.fullName),
              subtitle: Text(contact.phoneNumber.number),
            ),
          )
          .toList(),
    );
  }
}
