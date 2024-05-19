import 'package:equatable/equatable.dart';

abstract class ActivitiesEvent extends Equatable {
  final Map<String, dynamic>? params;

  const ActivitiesEvent({this.params});

  @override
  List<Object> get props => [params!];
}

class GetActivities extends ActivitiesEvent {
  const GetActivities(Map<String, dynamic> params) : super(params: params);
}