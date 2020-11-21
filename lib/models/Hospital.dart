import "package:flutter/foundation.dart";

class Hospital {
  String name;
  String vicinity;

  Hospital({
    this.name,
    this.vicinity,
  });

  factory Hospital.fromJson(Map<String, dynamic> jsonData) {
    print(jsonData["name"]);
    return Hospital(
      name: jsonData["name"],
      vicinity: jsonData["vicinity"],
    );
  }
}
