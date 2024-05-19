import 'package:equatable/equatable.dart';

abstract class RecommendationsEvent extends Equatable {
  final Map<String, dynamic>? params;

  const RecommendationsEvent({this.params});

  @override
  List<Object> get props => [params!];
}

class GetRecommendations extends RecommendationsEvent {
  const GetRecommendations(Map<String, dynamic> params) : super(params: params);
}
