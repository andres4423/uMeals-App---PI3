import 'package:flutter/material.dart';


class Customnavbutton extends StatelessWidget {
  const Customnavbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      items:const [
          
          BottomNavigationBarItem(icon: Icon(Icons.message_outlined, color: Colors.black45,), label: 'notifs'),
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined, color: Colors.black45), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined, color: Colors.black45), label: 'carrito_compras'),
          BottomNavigationBarItem(icon: Icon(Icons.settings, color: Colors.black45), label: 'settings'),


        
      ],
    );
  }
}