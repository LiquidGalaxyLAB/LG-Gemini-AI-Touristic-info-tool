import 'package:equatable/equatable.dart';

import '../../../domain/model/tourist_place.dart';

abstract class FavouriteEvent extends Equatable {
  final TouristPlace? touristPlace;

  const FavouriteEvent({this.touristPlace});

  @override
  List<Object> get props => [touristPlace!];
}

class GetFavourites extends FavouriteEvent {
  const GetFavourites();
}

class ClearFavourites extends FavouriteEvent {
  const ClearFavourites();
}

class AddFavourite extends FavouriteEvent {
  const AddFavourite(
    TouristPlace touristPlace,
  ) : super(touristPlace: touristPlace);
}

class RemoveFavourite extends FavouriteEvent {
  const RemoveFavourite(
    TouristPlace touristPlace,
  ) : super(touristPlace: touristPlace);
}
