import 'dart:convert';

import 'package:contact_picker/contact_picker.dart';

class User {
  String name;
  String phone;
  String email;
  List<Contact> emergencyContacts;

  User({this.name, this.phone, this.email, this.emergencyContacts});

  factory User.fromJson(Map<String, dynamic> jsonData) {
    return User(
      name: jsonData["name"],
      phone: jsonData["phone"],
      email: jsonData["email"],
      /***
       * Remember that Contact takes paramerters fullName and phoneNumber
       * where phoneNumber is a map of number and label('work', 'home', etc)
       */
      emergencyContacts: jsonData["emergencyContacts"].map((item) {
        Contact.fromMap(item);
      }).toList(),
    );
  }

  toJson() {
    return jsonEncode({
      "name": this.name,
      "phone": this.phone,
      "email": this.email,
      "emergencyContacts": this.emergencyContacts.map((contact) {
        return {
          "fullName": contact.fullName,
          "phoneNumber": {
            "number": contact.phoneNumber.number,
            "label": contact.phoneNumber.label,
          }
        };
      }).toList(),
    });
  }
}
