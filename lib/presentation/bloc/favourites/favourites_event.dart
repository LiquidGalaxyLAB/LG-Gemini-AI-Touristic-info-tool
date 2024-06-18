import 'package:equatable/equatable.dart';

import '../../../domain/model/tourist_place.dart';

abstract class FavouritesEvent extends Equatable {
  final TouristPlace? touristPlace;

  const FavouritesEvent({this.touristPlace});

  @override
  List<Object> get props => [touristPlace!];
}

class GetFavourites extends FavouritesEvent {
  const GetFavourites();
}

class ClearFavourites extends FavouritesEvent {
  const ClearFavourites();
}

class AddFavourite extends FavouritesEvent {
  const AddFavourite(
    TouristPlace touristPlace,
  ) : super(touristPlace: touristPlace);
}

class RemoveFavourite extends FavouritesEvent {
  const RemoveFavourite(
    TouristPlace touristPlace,
  ) : super(touristPlace: touristPlace);
}
