import "package:flutter/material.dart";
import "package:contact_picker/contact_picker.dart";
import 'package:road_safety/utilities/get_first_letter.dart';

class AddEmergencyContactsScreen extends StatefulWidget {
  @override
  _AddEmergencyContactsScreenState createState() =>
      _AddEmergencyContactsScreenState();
}

class _AddEmergencyContactsScreenState
    extends State<AddEmergencyContactsScreen> {
  final ContactPicker _contactPicker = new ContactPicker();
  List<Contact> _emergencyContacts = <Contact>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add contacts"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text("Please add at least 1 emergency contact"),
              Divider(),
              _displayListOfContacts(_emergencyContacts),
            ],
          ),
        ),
      ),
      floatingActionButton: RaisedButton(
        onPressed: () async {
          Contact contact = await _contactPicker.selectContact();

          //Check if exists
          bool exists = false;
          for (int i = 0; i < _emergencyContacts.length; i++) {
            Contact existing = _emergencyContacts[i];
            if (existing.fullName == contact.fullName &&
                existing.phoneNumber.number == contact.phoneNumber.number) {
              exists = true;
              break;
            }
          }

          if (exists) {
            return;
          }
          setState(() {
            _emergencyContacts.add(contact);
          });
        },
        clipBehavior: Clip.none,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(Icons.contacts),
            ),
            Text("Add from contacts"),
          ],
        ),
      ),
    );
  }

  Widget _displayListOfContacts(List<Contact> _contacts) {
    return Column(
      children: _contacts.map((Contact contact) {
        String firstLetter = getFirstLetter(contact.fullName);
        return ListTile(
          title: Text(contact.fullName),
          subtitle: Text(contact.phoneNumber.number),
          leading: CircleAvatar(
            backgroundColor: Colors.blue.shade800,
            child: Text(firstLetter),
          ),
        );
      }).toList(),
    );
  }
}
