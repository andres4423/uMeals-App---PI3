import 'package:flutter/material.dart';
import 'package:umeals/Screens/mainPage_parts/store_card.dart';

class BusinessGrid extends StatelessWidget {
  const BusinessGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Restaurantes y Negocios", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

        Padding(
          padding: EdgeInsets.all(8.5),
          child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: FractionallySizedBox(
                    widthFactor: 0.85,
                    child: BusinessCard(altura: 280),
                  ),
                ),
                Expanded(
                  child: FractionallySizedBox(
                    widthFactor: 0.85,
                    child: BusinessCard(altura: 280),
                  ),
                ),
              ],
            ),
        ),
        SizedBox(height: 16.0),
        FractionallySizedBox(
          widthFactor: 0.88,
          child: BusinessCard(altura: 150),
        ),
      ],
    );
  }
}
