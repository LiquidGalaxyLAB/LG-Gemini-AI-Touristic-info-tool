import 'package:equatable/equatable.dart';

abstract class BudgetPlanEvent extends Equatable {
  final Map<String, dynamic>? params;

  const BudgetPlanEvent({this.params});

  @override
  List<Object> get props => [params!];
}

class GetBudgetPlan extends BudgetPlanEvent {
  const GetBudgetPlan(Map<String, dynamic> params) : super(params: params);
}
