import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../models/User.dart" as model;
import 'package:firebase_auth/firebase_auth.dart';
import "package:cloud_firestore/cloud_firestore.dart";

class UserProvider with ChangeNotifier {
  model.User user;
  final firestoreInstance = FirebaseFirestore.instance;

  String getUid() {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    if (_auth.currentUser == null) {
      return null;
    }
    return _auth.currentUser.uid;
  }

  Future<void> fetchCurrentUser() {
    firestoreInstance.collection("users").doc(getUid()).get().then((value) {
      // print(value.data());
      user = model.User.fromJson(value.data());
      notifyListeners();
      // print(user.emergencyContacts);
    });
  }

  Future<void> addUser() {
    firestoreInstance.collection("users").doc(getUid()).set({
      "name": "Alan Anand Dsilva",
      "phone": "7030218024",
      "email": "alandsilva2001@gmail.com",
      "emergencyContacts": [
        {
          "fullName": "test contact 1",
          "phoneNumber": {
            "number": "70230213213",
            "label": "work",
          },
        },
        {
          "fullName": "test contact 2",
          "phoneNumber": {
            "number": "70230213213",
            "label": "work",
          },
        },
        {
          "fullName": "test contact 3",
          "phoneNumber": {
            "number": "70230213213",
            "label": "work",
          },
        },
      ],
    }).then((_) {
      print("success!");
    });
  }
}
