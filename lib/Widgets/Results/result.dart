import 'package:ecocred/Provider/result_provider.dart';
import 'package:ecocred/Widgets/Results/pieChartWidget.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';



class Result extends StatelessWidget {
  final CarbonFootprintResult result;

  const Result({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Your Carbon Footprint',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  PieChartWidget(result: result), // Assuming you have a PieChartWidget
                  SizedBox(height: 8.0),
                  Text(
                    'Your total Carbon footprint  is  ${result.total} !',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Suggestions for Improvement',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          ...result.suggestions.map((suggestion) => ListTile(
            leading: Icon(Icons.arrow_right),
            title: Text(suggestion),
          )),
        ],
      ),
    );
  }
}
