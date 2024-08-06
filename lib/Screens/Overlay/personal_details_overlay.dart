
import 'package:ecocred/Provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PersonalDetailsOverlay extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsyncValue = ref.watch(userProvider);

    return userAsyncValue.when(
      data: (user) => AlertDialog(
        title: Text('Personal Details'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Name: ${user.name}'),
            Text('Email: ${user.email}'),
            Text('Phone Number: ${user.phoneNumber}'),
            Text('Gender: ${user.gender}'),
            Text('Profession: ${user.profession}'),
            Text('Carbon Footprint: ${user.carbonFootprint['total']} kg CO2'),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Close'),
          ),
        ],
      ),
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, stack) => AlertDialog(
        title: Text('Error'),
        content: Text('Failed to load user data'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class PersonalDetailsOverlay extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final name = 'Avni';
//     final email = 'avni.smith@example.com';
//     final phoneNumber = 9123456789;
//     final gender = 'Male';
//     final profession = 'Graphic Designer';
//     final carbonFootprint = 8.0;
//
//     return AlertDialog(
//       title: const Text('Personal Details'),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children:[
//           Text('Name: $name'),
//           Text('Email: $email'),
//           Text('Phone Number: $phoneNumber'),
//           Text('Gender: $gender'),
//           Text('Profession: $profession'),
//           Text('Carbon Footprint: $carbonFootprint kg CO2'),
//       ],
//
//       ),
//       actions: <Widget>[
//         TextButton(
//           onPressed: () => Navigator.of(context).pop(),
//           child: Text('Close'),
//         ),
//       ],
//     );
//   }
// }
