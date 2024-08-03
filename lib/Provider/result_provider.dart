  import 'package:flutter_riverpod/flutter_riverpod.dart';
  import 'package:http/http.dart' as http;
  import 'dart:convert';

  class ResultsProvider extends StateNotifier< String> {
    ResultsProvider() : super('');

    void set(String token) {
      state = token;
    }
  }
  final resulttokenProvider =
  StateNotifierProvider<ResultsProvider, String>(
        (ref) => ResultsProvider(),
  );

  final carbonFootprintProvider = FutureProvider<CarbonFootprintResult>((ref) async {

    final token = ref.watch(resulttokenProvider);

    if(token== null){
      throw Exception('Token is not available');
    }

    final response = await http.post(
        Uri.parse('http://192.168.43.188:5050/answers/result'),
        headers: {'Content-Type' : 'application/json'},
        body: jsonEncode({
        'token' : token,
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {

      return CarbonFootprintResult.fromJson(jsonDecode(response.body));
    }
    else {
      throw Exception('Failed to load data');
    }
  },
  );


  class CarbonFootprintResult {
    final double transportation;
    final double transportationPercentage;
    final double homeEnergyUse;
    final double homeEnergyUsePercentage;
    final double diet;
    final double dietPercentage;
    final double wasteManagement;
    final double wasteManagementPercentage;
    final double total;
    final List<String> suggestions;

    CarbonFootprintResult({
      required this.transportation,
      required this.transportationPercentage,
      required this.homeEnergyUse,
      required this.homeEnergyUsePercentage,
      required this.diet,
      required this.dietPercentage,
      required this.wasteManagement,
      required this.wasteManagementPercentage,
      required this.total,
      required this.suggestions,
    });

    factory CarbonFootprintResult.fromJson(Map<String, dynamic> json) {
      return CarbonFootprintResult(
        transportation: double.parse(json['transportation']),
        transportationPercentage: double.parse(json['transportation_percentage']),
        homeEnergyUse: double.parse(json['home_energy_use']),
        homeEnergyUsePercentage: double.parse(json['home_energy_use_percentage']),
        diet: double.parse(json['diet']),
        dietPercentage: double.parse(json['diet_percentage']),
        wasteManagement: double.parse(json['waste_management']),
        wasteManagementPercentage: double.parse(json['waste_management_percentage']),
        total: double.parse(json['total']),
        suggestions: List<String>.from(json['suggestions']),
      );
    }
  }



