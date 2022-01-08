import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _getLocationData();
  }

  void _getLocationData() async {
    var location = Location();
    await location.getCurrentLocation();

    var apiKey = 'b2acc50dcb03e2e55c6326e72358a3ca';
    var url = 'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&unit=metric';

    var networkHelper = NetworkHelper(url);
    var data = await networkHelper.getData();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return LocationScreen(
            locationWeather: data,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
