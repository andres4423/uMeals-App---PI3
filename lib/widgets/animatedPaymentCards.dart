import 'package:flutter/material.dart';

class AnimatedPaymentCards extends StatefulWidget {
  @override
  _AnimatedPaymentCardsState createState() => _AnimatedPaymentCardsState();
}

class _AnimatedPaymentCardsState extends State<AnimatedPaymentCards> {
  int selectedCardIndex = 0; 

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260, 
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          buildPaymentCard(2, 'Bancolombia', const Color.fromARGB(255, 233, 210, 0), 100), 
          buildPaymentCard(1, 'Nequi', Color(0xFF160037), 50),  
          buildPaymentCard(0, 'Efectivo', Colors.green, 0),   
        ],
      ),
    );
  }

  Widget buildPaymentCard(int index, String label, Color color, double offset) {
    bool isSelected = selectedCardIndex == index;

    return AnimatedPositioned(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      bottom: offset, 
      left: 0,
      right: 0,
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedCardIndex = index; 
          });
        },
        child: Transform.scale(
          scale: isSelected ? 1.05 : 1.0, 
          child: Card(
            elevation: isSelected ? 10 : 5,
            color: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: SizedBox(
              height: 150, 
              width: double.infinity, 
              child: Stack(
                children: [
                  Positioned(
                    top: 15, 
                    left: 15, 
                    child: Opacity(
                      opacity: 1.0,
                      child: Text(
                        label,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold, 
                        ),
                      ),
                    ),
                  ),
                  if (index == 0)
                    Center(
                      child: Image.asset(
                        'assets/efectivo.png', 
                        height: 70, 
                        width: 70, 
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
