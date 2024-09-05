import 'package:flutter/material.dart';
import 'package:umeals/Screens/mainPage_parts/store_card.dart';
import 'package:umeals/domain/types/business_model.dart';

class BusinessGrid extends StatelessWidget {
  const BusinessGrid({super.key, required this.businesses});
  final List<BusinessModel> businesses;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text("Restaurantes y Negocios",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ..._buildBusinessCards(),
      ],
    );
  }

  List<Widget> _buildBusinessCards() {
    List<Widget> cards = [];

    for (int i = 0; i < businesses.length; i += 3) {
      print(i);
      if (i + 2 < businesses.length) {
        if (i != 0) {
          cards.add(const SizedBox(height: 16.0));
        }
        cards.add(
          Padding(
            padding: const EdgeInsets.all(8.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: FractionallySizedBox(
                    widthFactor: 0.85,
                    child: BusinessCard(altura: 300, business: businesses[i]),
                  ),
                ),
                Expanded(
                  child: FractionallySizedBox(
                    widthFactor: 0.85,
                    child: BusinessCard(altura: 300, business: businesses[i+1]),
                  ),
                ),
              ],
            ),
          ),
        );
        cards.add(const SizedBox(height: 16.0));
        cards.add(
          FractionallySizedBox(
            widthFactor: 0.88,
            child: BusinessCard(altura: 180, business: businesses[i+2]),
          ),
        );
      } else {
        if (i + 1 < businesses.length) {
          cards.add(const SizedBox(height: 16.0));
          cards.add(
            Padding(
              padding: const EdgeInsets.all(8.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: FractionallySizedBox(
                      widthFactor: 0.85,
                      child: BusinessCard(altura: 300, business: businesses[i]),
                    ),
                  ),
                  Expanded(
                    child: FractionallySizedBox(
                      widthFactor: 0.85,
                      child: BusinessCard(altura: 300, business: businesses[i+1]),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          cards.add(const SizedBox(height: 16.0));
          cards.add(
            Padding(
              padding: const EdgeInsets.all(8.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: FractionallySizedBox(
                      widthFactor: 0.85,
                      child: BusinessCard(altura: 300, business: businesses[i]),
                    ),
                  ),
                  const Expanded(
                    child: FractionallySizedBox(
                      widthFactor: 0.85,
                        child: SizedBox(height: 300),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      }
    }

    return cards;
  }
}
