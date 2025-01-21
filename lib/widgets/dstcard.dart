//

import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({super.key, required this.cardicon, required this.addtext});

  final String addtext;
  final IconData cardicon;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      color: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              cardicon,
              size: 40,
              color: Colors.white,
            ),
            const SizedBox(height: 10),
            Text(
              addtext,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
