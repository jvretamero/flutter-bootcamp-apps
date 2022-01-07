import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void printPosition() async {
    if (await Geolocator.isLocationServiceEnabled()) {
      LocationPermission permission = await requestPermission();

      if (permission != LocationPermission.deniedForever) {
        print('Gettiong location...');
        Position position = await Geolocator.getCurrentPosition();
        print(position);
      }
    } else {
      print('Location not enabled');
    }
  }

  Future<LocationPermission> requestPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    while (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    return permission;
  }

  @override
  void initState() {
    super.initState();
    printPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            printPosition();
          },
          child: const Text('Get Location'),
        ),
      ),
    );
  }
}
