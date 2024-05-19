import 'package:equatable/equatable.dart';

abstract class TouristPlacesEvent extends Equatable {
  final Map<String, dynamic>? params;

  const TouristPlacesEvent({this.params});

  @override
  List<Object> get props => [params!];
}

class GetTouristPlaces extends TouristPlacesEvent {
  const GetTouristPlaces(Map<String, dynamic> params) : super(params: params);
}
