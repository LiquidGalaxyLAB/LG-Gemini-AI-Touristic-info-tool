import 'package:floor/floor.dart';


@dao
abstract class TouristPlacesDao {

  @Insert()
  Future<dynamic> insertTouristPlace();

  @delete
  Future<dynamic> deleteTouristPlace();
  
  @Query('SELECT * FROM tourist_places')
  Future<dynamic> getTouristPlaces();

  @Query('value')
  Future<dynamic> clearTouristPlaces();
}