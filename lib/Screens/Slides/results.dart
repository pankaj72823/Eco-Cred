import 'package:ecocred/Provider/result_provider.dart';
import 'package:ecocred/Widgets/Results/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResultsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(carbonFootprintProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Carbon Footprint'),
      ),
      body: asyncValue.when(
        data: (result) =>  Result(result: result),
        loading: () => Center(child: LinearProgressIndicator(color: Colors.blueAccent,)),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.orange,
        onTap: (index) {

        },
      ),
    );
  }
}


