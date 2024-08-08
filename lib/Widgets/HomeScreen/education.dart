import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Education extends StatelessWidget {
  const Education({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [Colors.lightGreenAccent, Colors.green],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          ClipOval(
            child: Image.asset(
              'lib/assets/Home_screen/education2.jpg',
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Carbon Footprint',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Expand your knowledge of Footprint',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
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
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    'EXPLORE',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//
//
//
//
//
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class Education extends StatelessWidget{
//   const Education({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 190,
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         color: Colors.greenAccent.withOpacity(0.4),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Expanded(
//             flex: 2,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text(
//                   'Carbon Footprint',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 24,
//                   ),
//                 ),
//                 const Text(
//                   'Expand your Knowledge of Carbon Footprint',
//                   style: TextStyle(
//                     fontStyle: FontStyle.italic,
//                     color: Colors.blue,
//                     fontSize: 12,
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 ElevatedButton(
//                   onPressed: () async {
//                     final Uri url = Uri.parse('https://ccd.gujarat.gov.in/what-is-carbon-footprint.htm');
//                     if (await canLaunchUrl(url)) {
//                       await launchUrl(url);
//                     } else {
//                       throw 'Could not launch $url';
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.redAccent.withOpacity(0.8),
//                     padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
//                     side: BorderSide(color: Colors.black, width: 2),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   child: const Text(
//                     'Explore',
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.black,
//
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           const Column(
//             children: [
//               Image(
//                 image: AssetImage('lib/assets/Home_screen/education.jpg'),
//                 height: 150,
//                 width: 130,
//                 fit: BoxFit.cover,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

