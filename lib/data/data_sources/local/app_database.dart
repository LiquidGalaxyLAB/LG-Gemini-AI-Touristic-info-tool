import 'package:floor/floor.dart';
import 'package:touristic/data/data_sources/local/tourist_places_dao.dart';
import 'package:touristic/data/model/tourist_place.dart';

@Database(version: 1, entities: [TouristPlace])
abstract class AppDatabase extends FloorDatabase {
  TouristPlacesDao get touristPlacesDao;
}