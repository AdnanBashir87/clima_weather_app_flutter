import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;
  // Location({required this.latitude, required this.longitude});

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      print(e);
    }
  }
}
