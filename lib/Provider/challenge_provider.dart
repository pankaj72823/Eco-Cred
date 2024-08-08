import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ecocred/Provider/token_provider.dart';

class Challenge {
  final String category;
  final String challenge;
  final int timetoComplete;
  final String difficulty;
  final String id;

  Challenge({
    required this.category,
    required this.challenge,
    required this.timetoComplete,
    required this.difficulty,
    required this.id,
  });

  factory Challenge.fromJson(Map<String, dynamic> json) {
    return Challenge(
      category: json['category'],
      challenge: json['challenge'],
      timetoComplete: json['time_to_complete'],
      difficulty: json['difficulty'],
      id: json['_id'], // Ensure this matches your API response
    );
  }

  static List<Challenge> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Challenge.fromJson(json)).toList();
  }
}

final ChallengeProvider = FutureProvider<Map<String, List<Challenge>>>((ref) async {
  final token = ref.watch(userTokenProvider);

  if (token == null) {
    throw Exception('Token not available');
  }

  final response = await http.post(
    Uri.parse('http://localhost:5050/challenges'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'token': token}),
  );

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);

    // Group challenges by difficulty
    final Map<String, List<Challenge>> groupedChallenges = {
      'easy': [],
      'medium': [],
      'hard': []
    };

    for (var challengeJson in data) {
      final challenge = Challenge.fromJson(challengeJson);
      groupedChallenges[challenge.difficulty]?.add(challenge);
    }

    return groupedChallenges;
  } else {
    throw Exception('Failed to fetch challenges');
  }
});
