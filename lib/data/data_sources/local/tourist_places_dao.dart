import 'package:floor/floor.dart';

import '../../../core/constants/constants.dart';
import '../../model/tourist_place.dart';


@dao
abstract class TouristPlacesDao {

  @Insert()
  Future<void> insertTouristPlace();

  @delete
  Future<void> deleteTouristPlace();
  
  @Query('SELECT * FROM $touristPlacesTable')
  Future<List<TouristPlace>> getTouristPlaces();

  @Query('DELETE FROM $touristPlacesTable')
  Future<void> clearTouristPlaces();
}