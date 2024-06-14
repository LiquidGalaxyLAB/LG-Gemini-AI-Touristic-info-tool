import 'package:flutter/cupertino.dart';

import '../../domain/model/budget_plan.dart';

class BudgetPlanResultPanel extends StatelessWidget {
  final BudgetPlan budgetPlan;

  const BudgetPlanResultPanel({Key? key, required this.budgetPlan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              budgetPlan.name,
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'Starting Point: ${budgetPlan.startingPoint}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Travel Routes',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            ...budgetPlan.travelRoute.map((route) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                '- ${route.mode} from ${route.from} to ${route.to}, Cost: ${route.cost}, Duration: ${route.duration}',
                style: TextStyle(fontSize: 16.0),
              ),
            )),
            SizedBox(height: 16.0),
            Text(
              'Places',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            ...budgetPlan.places.map((place) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                '- ${place.name}, Entrance Fee: ${place.entranceFee}, Guided Tour Fee: ${place.guidedTourFee}, Average Meal Cost: ${place.averageMealCost}',
                style: TextStyle(fontSize: 16.0),
              ),
            )),
            SizedBox(height: 16.0),
            Text(
              'Accommodation',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            ...budgetPlan.accommodation.map((accommodation) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                '- ${accommodation.name}, Description: ${accommodation.description}, Cost Per Night: ${accommodation.costPerNight}, Duration: ${accommodation.duration}, Total Cost: ${accommodation.totalCost}',
                style: TextStyle(fontSize: 16.0),
              ),
            )),
            SizedBox(height: 16.0),
            Text(
              'Additional Expenses',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            ...budgetPlan.additionalExpenses.map((expense) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                '- ${expense.name}, Description: ${expense.description}, Estimated Cost: ${expense.estimatedCost}',
                style: TextStyle(fontSize: 16.0),
              ),
            )),
            SizedBox(height: 16.0),
            Text(
              'Total Cost: ${budgetPlan.totalCost}',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}