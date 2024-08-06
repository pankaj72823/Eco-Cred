import 'package:ecocred/Provider/token_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final rewardsProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final token = ref.watch(userTokenProvider);
  final response = await http.post(
    Uri.parse('http://192.168.43.188:5050/reward'),
    headers: {'Content-Type' : 'application/json'},
    body: jsonEncode({
      'token' : token,
    }),
  );

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load rewards');
  }
});

