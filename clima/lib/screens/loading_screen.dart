import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            var location = Location();
            location.getCurrentLocation();

            var apiKey = 'b2acc50dcb03e2e55c6326e72358a3ca';
            var url = 'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey';

            var networkHelper = NetworkHelper(url);
            var data = await networkHelper.getData();
          },
          child: const Text('Get Location'),
        ),
      ),
    );
  }
}
