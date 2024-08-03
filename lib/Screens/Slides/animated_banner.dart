import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

class AnimatedBanner extends StatefulWidget {
  const AnimatedBanner({Key? key}) : super(key: key);

  @override
  _AnimatedBannerState createState() => _AnimatedBannerState();
}

class _AnimatedBannerState extends State<AnimatedBanner> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      // Hide the banner after 2 seconds
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      top: 0,
      left: 0,
      right: 0,
      height: 60,
      child: Container(
        color: Colors.orange,
        child: Center(
          child: Text(
            'Answer to get your carbon footprint !',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}