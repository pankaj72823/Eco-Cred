import 'dart:convert';

import 'package:ecocred/Provider/token_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
class User {
  final String name;
  final String email;
  final int phoneNumber;
  final Map<String, int> levels;
  final String gender;
  final String profession;
  final Map<String, double> carbonFootprint;
  final List<String> suggestions;
  final String lastTracked;
  final List<Map<String, dynamic>> achievementsEasy;
  final List<Map<String, dynamic>> achievementsMedium;
  final List<Map<String, dynamic>> achievementsHard;

  User({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.levels,
    required this.gender,
    required this.profession,
    required this.carbonFootprint,
    required this.suggestions,
    required this.lastTracked,
    required this.achievementsEasy,
    required this.achievementsMedium,
    required this.achievementsHard,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['profile']['email'],
      phoneNumber: json['profile']['phone_number'],
      levels: Map<String, int>.from(json['profile']['levels']),
      gender: json['profile']['gender'],
      profession: json['profile']['profession'],
      carbonFootprint: Map<String, double>.from({
        'transportation': json['carbon_footprint']['transportation'],
        'home_energy_use': json['carbon_footprint']['home_energy_use'],
        'diet': json['carbon_footprint']['diet'],
        'waste_management': json['carbon_footprint']['waste_management'],
        'total': json['carbon_footprint']['total'],
      }),
      suggestions: List<String>.from(json['carbon_footprint']['suggestions']),
      lastTracked: json['carbon_footprint']['last_tracked'],
      achievementsEasy: List<Map<String, dynamic>>.from(json['achievement']['easy']),
      achievementsMedium: List<Map<String, dynamic>>.from(json['achievement']['medium']),
      achievementsHard: List<Map<String, dynamic>>.from(json['achievement']['hard']),
    );
  }
}


final userProvider = FutureProvider<User>((ref) async {
  final token = ref.watch(userTokenProvider);
  final response = await http.post(
    Uri.parse('http://localhost:5050/profile'),
    headers: {'Content-Type': 'application/json'},
    body: json.encode({'token': token}),
  );

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
    // Logging the JSON response for debugging
    print(jsonData);
    return User.fromJson(jsonData);
  } else {
    throw Exception('Failed to load user data');
  }
});
