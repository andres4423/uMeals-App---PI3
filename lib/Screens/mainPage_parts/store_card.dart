import 'package:flutter/material.dart';

class BusinessCard extends StatelessWidget {

  final double altura;
  const BusinessCard({super.key, required this.altura});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: altura,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(15),

      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Business Name',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow, size: 16),
                Text('3.5', style: TextStyle(color: Colors.white)),
              ],
            ),
            Text(
              'Business Description',
              style: TextStyle(
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}