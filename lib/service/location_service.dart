import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationService {
  static final LocationService instance = LocationService._internal();

  LocationService._internal();

  factory LocationService() {
    return instance;
  }


  Future<LatLng?> getLatLngFromLocation(String address) async {
    try {
      List<Location> locations = await locationFromAddress(address);
      if (locations.isNotEmpty) {
        return LatLng(
          locations.first.latitude,
          locations.first.longitude,
        );
      } else {
        return null;
      }
    } catch (e) {
      log('Stack trace:\n$e');
      return null;
    }
  }

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
