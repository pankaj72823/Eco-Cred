import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Project {
  final String name;
  final String description;
  final String organization;
  final List<String> projectType;
  final String impact;
  final String imagePath;

  Project({
    required this.name,
    required this.description,
    required this.organization,
    required this.projectType,
    required this.impact,
    required this.imagePath,

  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      name: json['name'],
      description: json['description'],
      organization: json['organization'],
      projectType: List<String>.from(json['project_type']),
      impact: json['impact'],
      imagePath: determineImagePath(json['name']),
    );
  }
}

String determineImagePath(String name) {
  switch (name) {
    case 'Terrapass':
      return 'lib/assets/Project/terrapass.jpg';
    case 'Atmosfair':
      return 'lib/assets/Project/atmosfair.jpg';
    case 'Myclimate':
      return 'lib/assets/Project/Myclimate.jpg';
    case 'Carbon Checkout':
      return 'lib/assets/Project/carboncheckout.png';
    case 'Project 5':
      return 'assets/images/project5.png';
    default:
      return 'assets/images/default.png';
  }
}


final projectProvider = FutureProvider<List<Project>>((ref) async {
  final response = await http.get(Uri.parse('http://localhost:5050/projects'));
  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    return data.map((item) => Project.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load projects');
  }
});


