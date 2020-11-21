import 'dart:convert';

import "package:flutter/material.dart";
import 'package:location/location.dart';
import "package:http/http.dart" as http;
import 'package:road_safety/utilities/get_first_letter.dart';

// models
import "../models/Hospital.dart";

class NearbyHospitalScreen extends StatefulWidget {
  @override
  _NearbyHospitalScreenState createState() => _NearbyHospitalScreenState();
}

class _NearbyHospitalScreenState extends State<NearbyHospitalScreen> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();
  Location location = new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;
  List<Hospital> _hospitals;

  void initState() {
    super.initState();
    _locationConfig();
  }

  void _locationConfig() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    setState(() {});
  }

  Future<void> _fetchHospitals() async {
    String api = "AIzaSyBM3MbxHP6zHVobLI1WgLl6R_tJrxp8cYA";
    String latitude = _locationData.latitude.toString();
    String longitude = _locationData.longitude.toString();
    String requestUrl =
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latitude,$longitude&rankby=distance&type=hospital&key=$api";
    print(requestUrl);
    try {
      http.Response response = await http.get(requestUrl);
      if (response.statusCode == 200) {
        final extractedData = jsonDecode(response.body);

        _hospitals = extractedData["results"].map<Hospital>((data) {
          return Hospital.fromJson(data);
        }).toList();
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> _rebuild() async {
    print("HERE");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: _rebuild,
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: _locationData == null
            ? Center(
                child: Text("Allow location permission to view"),
              )
            : FutureBuilder(
                future: _fetchHospitals(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // loading results
                    return Text("Loading");
                  } else if (snapshot.hasError) {
                    Text(snapshot.error);
                  }
                  return Column(
                    children: _hospitals.map((hospital) {
                      return Card(
                        child: ListTile(
                          title: Text(hospital.name),
                          subtitle: Text(hospital.vicinity.toString()),
                          leading: CircleAvatar(
                            backgroundColor: Colors.red.shade100,
                            child: Text(
                              getFirstLetter(hospital.name),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                  return Text("test");
                },
              ),
      ),
    );
  }
}
