import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Education extends StatelessWidget{
  const Education({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.greenAccent.withOpacity(0.4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Carbon Footprint',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const Text(
                  'Expand your Knowledge of Carbon Footprint',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.blue,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () async {
                    final Uri url = Uri.parse('https://ccd.gujarat.gov.in/what-is-carbon-footprint.htm');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent.withOpacity(0.8),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    side: BorderSide(color: Colors.black, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Explore',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,

                    ),
                  ),
                )
              ],
            ),
          ),
          const Column(
            children: [
              Image(
                image: AssetImage('lib/assets/Home_screen/education.jpg'),
                height: 150,
                width: 130,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ],
      ),
    );
  }

}