import 'package:flutter/material.dart';

class ExclusiveDeal extends StatelessWidget{
  const ExclusiveDeal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      padding: EdgeInsets.all(16),
      // margin: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.greenAccent,
      ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Exclusive Deal',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            Text(
              'Discover exclusive offers on Eco friendly Products',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child:
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(vertical: 12,horizontal: 20),
                    side: BorderSide(color: Colors.black, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Visit now',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
            )
          ],
        ),

    );
  }

}