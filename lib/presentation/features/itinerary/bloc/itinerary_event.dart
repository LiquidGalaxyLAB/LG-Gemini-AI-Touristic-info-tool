import 'package:equatable/equatable.dart';

abstract class ItineraryEvent extends Equatable {
  final Map<String, dynamic>? params;

  const ItineraryEvent({this.params});

  @override
  List<Object> get props => [params!];
}

class GetItinerary extends ItineraryEvent {
  const GetItinerary(Map<String, dynamic> params) : super(params: params);
}
