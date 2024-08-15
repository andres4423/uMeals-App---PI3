import 'package:flutter/material.dart';


class Customnavbutton extends StatelessWidget {
  const Customnavbutton({super.key});

  @override
  Widget build(BuildContext context) {
     final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      ),
      child: BottomNavigationBar(
        elevation: 5,
        backgroundColor: Colors.pinkAccent,
        selectedItemColor: colors.primary,
        unselectedItemColor: Colors.black87,
        type: BottomNavigationBarType.fixed,
        iconSize: 40,
        selectedFontSize: 20,
        unselectedFontSize: 18,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items:const [
            BottomNavigationBarItem(icon: CircleAvatar(
              radius: 14,
              backgroundImage: NetworkImage('https://www.google.com/imgres?q=circle%20avatar&imgurl=https%3A%2F%2Fcdn.icon-icons.com%2Ficons2%2F1919%2FPNG%2F512%2Favatarinsideacircle_122011.png&imgrefurl=https%3A%2F%2Ficon-icons.com%2Fes%2Ficono%2Favatar-dentro-c%25C3%25ADrculo%2F122011&docid=ULyUz0SpFVaUjM&tbnid=F-2xWyhSusw1KM&vet=12ahUKEwj-oYisq_eHAxWdTDABHbOfNsgQM3oECBYQAA..i&w=512&h=512&hcb=2&ved=2ahUKEwj-oYisq_eHAxWdTDABHbOfNsgQM3oECBYQAA'),
            ),
            label: 'Profile'
            
            ),
            BottomNavigationBarItem(icon: Icon(Icons.message_outlined, color: Colors.black45,), label: '',),
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined, color: Colors.black45), label: 'home'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined, color: Colors.black45), label: 'carrito_compras'),
            BottomNavigationBarItem(icon: Icon(Icons.settings, color: Colors.black45), label: 'settings'),
      
      
          
        ],
      ),
    );
  }
}