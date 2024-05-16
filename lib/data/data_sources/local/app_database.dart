import 'package:floor/floor.dart';

import '../../model/request/tourist_place_request.dart';
import 'tourist_places_dao.dart';

@Database(version: 1, entities: [TouristPlaceRequest])
abstract class AppDatabase extends FloorDatabase {
  TouristPlacesDao get touristPlacesDao;
}
