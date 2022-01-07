import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;

  void getCurrentLocation() async {
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
