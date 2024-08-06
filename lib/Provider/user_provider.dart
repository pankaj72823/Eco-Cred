import 'package:ecocred/Provider/token_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';
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
  final List<Map<String, dynamic>> achievements;

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
    required this.achievements,
  });

  // Factory constructor to create a User instance from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['profile']['email'],
      phoneNumber: json['profile']['phone_number'],
      levels: Map<String, int>.from(json['profile']['levels']),
      gender: json['profile']['gender'],
      profession: json['profile']['profession'],
      carbonFootprint: Map<String, double>.from(json['carbon_footprint']..remove('suggestions')..remove('last_tracked')),
      suggestions: List<String>.from(json['carbon_footprint']['suggestions']),
      lastTracked: json['carbon_footprint']['last_tracked'],
      achievements: List<Map<String, dynamic>>.from(json['achievement']['easy']),
    );
  }
}


final userProvider = FutureProvider<User>((ref) async {
  final token = ref.watch(userTokenProvider);
  final response = await http.post(
      Uri.parse('https://192.168.43.188:5050/profile'),
      headers: {'Content-Type': 'application/json'},
     body: json.encode({
      'token': token
    }
    ),
  );
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    return User.fromJson(json);
  } else {
    throw Exception('Failed to load user data');
  }
});
