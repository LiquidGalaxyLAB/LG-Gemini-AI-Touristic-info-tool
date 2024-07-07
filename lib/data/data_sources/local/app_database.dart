import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../../core/constants/constants.dart';
import '../../model/request/tourist_place_request.dart';
import 'tourist_places_dao.dart';

part 'app_database.g.dart';

@Database(version: 2, entities: [TouristPlaceRequest])
abstract class AppDatabase extends FloorDatabase {
  TouristPlacesDao get touristPlacesDao;
}
