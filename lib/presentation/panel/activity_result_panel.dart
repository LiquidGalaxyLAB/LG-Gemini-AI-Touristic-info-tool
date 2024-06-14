import 'package:flutter/cupertino.dart';

import '../../domain/model/activitiy.dart';

class ActivityResultPanel extends StatelessWidget {
  final Activity activity;

  ActivityResultPanel({Key? key, required this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                activity.name,
                style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Text(
                'Description',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
              Text(
                activity.description,
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'Procedure',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
              ...activity.procedure.map((step) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  '- $step',
                  style: TextStyle(fontSize: 16.0),
                ),
              )),
              SizedBox(height: 16.0),
              Text(
                'Precautions',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
              ...activity.precautions.map((precaution) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  '- $precaution',
                  style: TextStyle(fontSize: 16.0),
                ),
              )),
              SizedBox(height: 16.0),
              Text(
                'Duration: ${activity.duration.toStringAsFixed(1)} hours',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 8.0),
              Text(
                'Cost: \$${activity.cost.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}