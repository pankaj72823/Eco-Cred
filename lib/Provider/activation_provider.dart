import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final ActivationProvider = StateNotifierProvider<ActivationNotifier, Map<String, bool>>((ref) {
  return ActivationNotifier();
});

class ActivationNotifier extends StateNotifier<Map<String, bool>> {
  ActivationNotifier() : super({});

  String? _token;
  void setToken(String token){
    _token = token;
  }
  Future<void> activateChallenge(String challengeId) async {

    final response = await http.post(
      Uri.parse('http://localhost:5050/activate'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'token': _token,
        '_id': challengeId
      }
      ),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      state = {...state, challengeId: data['activate']?? false};
    } else {
      throw Exception('Failed to activate challenge');
    }
  }
}
