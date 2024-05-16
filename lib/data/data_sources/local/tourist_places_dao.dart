import 'package:floor/floor.dart';

import '../../../core/constants/constants.dart';
import '../../model/request/tourist_place_request.dart';


@dao
abstract class TouristPlacesDao {

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertTouristPlace();

  @delete
  Future<void> deleteTouristPlace();
  
  @Query('SELECT * FROM $touristPlacesTable')
  Future<List<TouristPlaceRequest>> getTouristPlaces();

  @Query('DELETE FROM $touristPlacesTable')
  Future<void> clearTouristPlaces();
}