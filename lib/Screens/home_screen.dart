import 'package:ecocred/Widgets/HomeScreen/current_challenge.dart';
import 'package:ecocred/Widgets/HomeScreen/education.dart';
import 'package:ecocred/Widgets/HomeScreen/exclusive_deal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends ConsumerState<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _educationController;
  late AnimationController _exclusiveDealController;
  late AnimationController _currentChallengeController;
  late Animation<Offset> _educationAnimation;
  late Animation<Offset> _exclusiveDealAnimation;
  late Animation<Offset> _currentChallengeAnimation;

  @override
  void initState() {
    super.initState();
    _educationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _exclusiveDealController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _currentChallengeController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _educationAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _educationController,
      curve: Curves.easeInOut,
    ));

    _exclusiveDealAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(
        CurvedAnimation(
      parent: _exclusiveDealController,
      curve: Curves.easeInOut,
    ));

    _currentChallengeAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _currentChallengeController,
      curve: Curves.easeInOut,
    ));

    _educationController.forward();
    _exclusiveDealController.forward();
    _currentChallengeController.forward();
  }

  @override
  void dispose() {
    _educationController.dispose();
    _exclusiveDealController.dispose();
    _currentChallengeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SlideTransition(
                position: _educationAnimation,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.school, color: Colors.green, size: 30),
                        const SizedBox(width: 10),
                        Text(
                          'Education Section',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Education(),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SlideTransition(
                position: _exclusiveDealAnimation,
                child: const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.local_offer, color: Colors.red, size: 30),
                         SizedBox(width: 10),
                        Text(
                          'Exclusive Deals',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ExclusiveDeal(),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SlideTransition(
                position: _currentChallengeAnimation,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.history, color: Colors.blue, size: 30),
                        const SizedBox(width: 10),
                        Text(
                          'Recent Activity',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    CurrentChallenge(),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SlideTransition(
                position: _currentChallengeAnimation,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 6,
                  color: Colors.redAccent.withOpacity(0.5),  // Background color of the card
                  child: const Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Current Carbon Footprint is 20Kg',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,  // Text color
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
