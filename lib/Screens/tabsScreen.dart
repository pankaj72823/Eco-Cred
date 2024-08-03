import 'package:ecocred/Screens/challenges_screen.dart';
import 'package:ecocred/Screens/home_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget{
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreen();
  }

}
class _TabsScreen extends State<TabsScreen>{

  int currentIndex = 0;

  final List<Widget> screen = [
    HomeScreen(),
    ChallengesScreen(),
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Eco Cred',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(onPressed: () {},
            icon: Icon(Icons.person),
        ),
        actions: [
          IconButton(onPressed: () {},
              icon: Icon(Icons.notifications),
          ),
        ],
      ),
      body: screen[currentIndex],
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          currentIndex = 0;
        });
      },
        child: Icon(Icons.home),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 7.0,
         child: Row(
           mainAxisSize: MainAxisSize.max,
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             IconButton(onPressed: (){
               setState(() {
                 currentIndex = 1;
               });
             },
                 icon: Icon(Icons.redeem),
             ),
             IconButton(onPressed: (){
               setState(() {
                 currentIndex = 2;
               });
             },
               icon: Icon(Icons.flag),
             ),
             IconButton(onPressed: (){
               setState(() {
                 currentIndex = 2;
               });
             },
               icon: Icon(Icons.business),
             ),
             IconButton(onPressed: (){
               setState(() {
                 currentIndex = 3;
               });
             },
               icon: Icon(Icons.shopping_basket),
             ),
           ],
         ),
      //     child: BottomNavigationBar(
      //     items: [
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.redeem),
      //           label: 'Rewards',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.flag),
      //         label: 'Challenges',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.business),
      //         label: 'Projects',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.work),
      //         label: 'Shopping',
      //       ),
      //     ]
      // ),
      ),
    );
  }

}