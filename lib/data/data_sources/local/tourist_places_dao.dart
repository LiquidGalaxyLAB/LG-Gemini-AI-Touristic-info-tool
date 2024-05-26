import 'package:floor/floor.dart';

import '../../../core/constants/constants.dart';
import '../../model/request/tourist_place_request.dart';

@dao
abstract class TouristPlacesDao {

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertFavourite(TouristPlaceRequest touristPlaceRequest);

  @delete
  Future<void> deleteFavourite(TouristPlaceRequest touristPlaceRequest);
  
  @Query('SELECT * FROM $touristPlacesTable')
  Future<List<TouristPlaceRequest>> getFavourites();

  @Query('DELETE FROM $touristPlacesTable')
  Future<void> clearFavourites();
}