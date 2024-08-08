import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final questionsProvider = FutureProvider<List<dynamic>>((ref) async {
  final response = await http.get(Uri.parse('http://localhost:5050/question'));
  if (response.statusCode == 200) {
    return json.decode(response.body);
  }
  else {
    throw Exception('Failed to load questions');
  }
});

