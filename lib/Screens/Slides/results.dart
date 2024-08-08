import 'package:ecocred/Provider/result_provider.dart';
import 'package:ecocred/Screens/home_screen.dart';
import 'package:ecocred/Screens/tabsScreen.dart';
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
        data: (result) =>
            SingleChildScrollView(
              child: Padding(
                    padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset('lib/assets/Home_screen/gemini.png', width: 25, height: 25,),
                        Text('Generated with Gemini', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),

                      ],
                    ),
                    Result(result: result),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () => {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.tealAccent.withOpacity(0.8),
                            padding: EdgeInsets.all(15),
                            side: BorderSide(color: Colors.black, width: 2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),child: const Text('Profile', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        ),
                
                        ),
                        ElevatedButton(
                          onPressed: () => Navigator.push(
                            context, MaterialPageRoute(
                            builder: (ctx) => TabsScreen(),
                          ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.tealAccent.withOpacity(0.8),
                            padding: EdgeInsets.all(15),
                            side: BorderSide(color: Colors.black, width: 2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),child: const Text('Home Screen ', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        ),
                
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
        loading: () => Center(child: LinearProgressIndicator(color: Colors.blueAccent,)),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //     ),
      //   ],
      //   currentIndex: 0,
      //   selectedItemColor: Colors.orange,
      //   onTap: (index) {
      //
      //   },
      // ),
    );
  }
}


