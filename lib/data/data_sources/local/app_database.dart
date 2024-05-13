import 'package:floor/floor.dart';
import 'package:touristic/data/data_sources/local/tourist_places_dao.dart';

@Database(version: 1, entities: [])
abstract class AppDatabase extends FloorDatabase {
  TouristPlacesDao get touristPlacesDao;
}