import 'package:flutter/material.dart';

import '../services/location.dart';
import '../services/networking.dart';

const apiKey = '8977e4968e093b847c45b34f2ec4c127';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  // Must add permissions for Android and ios into correct files before use
  void getLocationData() async {
    Location myLocation = Location();
    await myLocation.getCurrentLocation();
    latitude = myLocation.latitude;
    longitude = myLocation.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = await networkHelper.getData();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
