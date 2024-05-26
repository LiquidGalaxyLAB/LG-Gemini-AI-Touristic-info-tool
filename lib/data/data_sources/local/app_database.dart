import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../model/request/tourist_place_request.dart';
import 'tourist_places_dao.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [TouristPlaceRequest])
abstract class AppDatabase extends FloorDatabase {
  TouristPlacesDao get touristPlacesDao;
}
