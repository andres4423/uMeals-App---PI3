import 'package:flutter/material.dart';
import 'package:umeals/Screens/mainPage_parts/store_card.dart';
import 'package:umeals/domain/types/business_model.dart';
import 'package:umeals/services/favorites_api.dart';

class BusinessGrid extends StatefulWidget {
  const BusinessGrid({super.key, required this.businesses});
  final List<BusinessModel> businesses;

  @override
  State<BusinessGrid> createState() => _BusinessGridState();
}

class _BusinessGridState extends State<BusinessGrid> {
  Set<int> favoritosIds = {};

  @override
  void initState() {
    super.initState();
    _cargarFavoritos();
  }

  Future<void> _cargarFavoritos() async {
    List<BusinessModel> favoritosBackend = await FavoritesApi().fetchFavoriteBusinesses();
    setState(() {
      favoritosIds =
          favoritosBackend.map((item) => item.idEMPRENDIMIENTOS).toSet();
    });
  }

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

    for (int i = 0; i < widget.businesses.length; i += 3) {
      print(i);
      if (i + 2 < widget.businesses.length) {
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
                    child: BusinessCard(
                      altura: 300,
                      business: widget.businesses[i],
                      isFavorite: favoritosIds
                          .contains(widget.businesses[i].idEMPRENDIMIENTOS),
                    ),
                  ),
                ),
                Expanded(
                  child: FractionallySizedBox(
                    widthFactor: 0.85,
                    child: BusinessCard(
                      altura: 300,
                      business: widget.businesses[i+1],
                      isFavorite: favoritosIds
                          .contains(widget.businesses[i+1].idEMPRENDIMIENTOS),
                    ),
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
            child: BusinessCard(
              altura: 180,
              business: widget.businesses[i+2],
              isFavorite:
                  favoritosIds.contains(widget.businesses[i+2].idEMPRENDIMIENTOS),
            ),
          ),
        );
      } else {
        if (i + 1 < widget.businesses.length) {
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
                      child: BusinessCard(
                        altura: 300,
                        business: widget.businesses[i],
                        isFavorite: favoritosIds
                            .contains(widget.businesses[i].idEMPRENDIMIENTOS),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FractionallySizedBox(
                      widthFactor: 0.85,
                      child: BusinessCard(
                        altura: 300,
                        business: widget.businesses[i+1],
                        isFavorite: favoritosIds
                            .contains(widget.businesses[i+1].idEMPRENDIMIENTOS),
                      ),
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
                      child: BusinessCard(
                        altura: 300,
                        business: widget.businesses[i],
                        isFavorite: favoritosIds
                            .contains(widget.businesses[i].idEMPRENDIMIENTOS),
                      ),
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
