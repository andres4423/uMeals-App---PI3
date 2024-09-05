import 'package:flutter/material.dart';
import 'package:umeals/Screens/profile/mi_cuenta.dart';

class Customnavbutton extends StatelessWidget {
  const Customnavbutton({super.key});

  @override
  Widget build(BuildContext context) {

     void onItemTapped(BuildContext context, int index){
    switch(index){
      case 0:
        Navigator.push(context, 
        MaterialPageRoute(builder: (context) => const MiCuenta()));  
        break;
        case 1:
         Navigator.push(context, 
        MaterialPageRoute(builder: (context) => const MiCuenta()));  
        break;
        case 2:
         Navigator.push(context, 
        MaterialPageRoute(builder: (context) => const MiCuenta()));  
        break;
    }
  }


     final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      ),
      child: BottomNavigationBar(
        elevation: 5,
        backgroundColor: Colors.white,
        selectedItemColor: colors.primary,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        iconSize: 40,
        selectedFontSize: 20,
        unselectedFontSize: 18,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) => onItemTapped(context, index),



        items:const [
            BottomNavigationBarItem(icon: CircleAvatar(
              radius: 14,
              backgroundImage: NetworkImage('https://cdn.icon-icons.com/icons2/1919/PNG/512/avatarinsideacircle_122011.png'),
              
            ),
            label: 'Profile',
            

            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.message_outlined, 
                color: Colors.black45,)
                , label: '',),
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined, color: Colors.black45), label: 'home'),
            // BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined, color: Colors.black45), label: 'carrito_compras'),
            BottomNavigationBarItem(icon: Icon(Icons.settings, color: Colors.black45), label: 'settings'),



        ],
      ),
    );
  }
}