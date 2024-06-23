import 'package:equatable/equatable.dart';

abstract class CuisinesEvent extends Equatable {
  final Map<String, dynamic>? params;

  const CuisinesEvent({this.params});

  @override
  List<Object> get props => [params!];
}

class GetCuisines extends CuisinesEvent {
  const GetCuisines(Map<String, dynamic> params) : super(params: params);
}
