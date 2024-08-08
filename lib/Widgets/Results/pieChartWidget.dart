import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:ecocred/Provider/result_provider.dart';
import 'dart:math' as math;

class PieChartWidget extends StatelessWidget {
  final CarbonFootprintResult result;

  const PieChartWidget({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "Transportation": result.transportationPercentage,
      "Home Energy Use": result.homeEnergyUsePercentage,
      "Diet": result.dietPercentage,
      "Waste Management": result.wasteManagementPercentage,
    };

    return PieChart(
      dataMap: dataMap,
      chartType: ChartType.disc,
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: 32,
      chartRadius: math.min(MediaQuery.of(context).size.width / 2.2, 300),
      colorList: [
        Colors.blue,
        Colors.green,
        Colors.orange,
        Colors.red,
      ],
      chartValuesOptions: const ChartValuesOptions(
        showChartValuesInPercentage: true,

      ),
      legendOptions: LegendOptions(
        showLegends: true,
        legendPosition: LegendPosition.right,
        showLegendsInRow: false,
        legendShape: BoxShape.circle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
