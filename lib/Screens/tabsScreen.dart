
import 'package:ecocred/Screens/challenges_screen.dart';
import 'package:ecocred/Screens/home_screen.dart';
import 'package:ecocred/Screens/product.dart';
import 'package:ecocred/Screens/profile.dart';
import 'package:ecocred/Screens/project.dart';
import 'package:ecocred/Screens/reward.dart';
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
    RewardsScreen(),
    ProjectScreen(),
    Product(),
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.greenAccent.withOpacity(0.7),

        title: Text('Eco Cred',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),


        leading: IconButton(onPressed: () =>Navigator.push(
          context, MaterialPageRoute(
            builder: (ctx) => Profile(),
        ),
        ),
            icon: Icon(Icons.person, size: 35,),
        ),
        actions: [
          IconButton(onPressed: () {},
              icon: Icon(Icons.notifications, size: 35,),
          ),
        ],
      ),
      body: screen[currentIndex],
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          currentIndex = 0;
        });
      },
        child: Icon(Icons.home, ),
        backgroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.greenAccent.withOpacity(0.7),
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
                 icon: ImageIcon(AssetImage('lib/assets/Icons/target.png'),),
             ),
             IconButton(onPressed: (){
               setState(() {
                 currentIndex = 2;
               });
             },
               icon: ImageIcon(AssetImage('lib/assets/Icons/reward.png'),),
             ),
             IconButton(onPressed: (){
               setState(() {
                 currentIndex = 3;
               });
             },
               icon: ImageIcon(AssetImage('lib/assets/Icons/investment.png'),),
             ),
             IconButton(onPressed: (){
               setState(() {
                 currentIndex = 4;
               });
             },
               icon: ImageIcon(AssetImage('lib/assets/Icons/shopping.png'),),
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
  // BottomNavigationBarItem(
  // icon: GestureDetector(
  // onTap: () => Navigator.push(
  // context,MaterialPageRoute(
  // builder:(ctx) => MentorsScreen(mentors: mentorsList),
  // ),
  // ),
  // child: Image.asset('lib/icons/clarification.png', color: Colors.white , height: 35, width: 35,)),
  // label: 'Mentorship',
  // backgroundColor: Colors.teal,
  // ),

}