import 'dart:developer';

import 'package:geocoding/geocoding.dart';

class LocationService {
  LocationService._internal();

  static final LocationService instance = LocationService._internal();

  Future<Map<String, double>?> getLatLngFromLocation(String address) async {
    try {
      List<Location> locations = await locationFromAddress(address);
      if (locations.isNotEmpty) {
        return {
          'latitude': locations.first.latitude,
          'longitude': locations.first.longitude,
        };
      } else {
        return null;
      }
    } catch (e) {
      log('Stack trace:\n$e');
      return null;
    }
  }

  // Method to get location address from latitude and longitude
  Future<String?> getLocationFromLatLng(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        return '${place.name}, ${place.locality}, ${place.administrativeArea}, ${place.country}';
      } else {
        return null;
      }
    } catch (e) {
      log('Stack trace:\n$e');
      return null;
    }
  }
}
