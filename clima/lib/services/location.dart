import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude = 0;
  late double longitude = 0;

  Future getCurrentLocation() async {
    if (await Geolocator.isLocationServiceEnabled()) {
      LocationPermission permission = await _requestPermission();

      if (permission != LocationPermission.deniedForever) {
        Position position = await Geolocator.getCurrentPosition();

        latitude = position.latitude;
        longitude = position.longitude;
      }
    }
  }

  Future<LocationPermission> _requestPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    while (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    return permission;
  }
}
