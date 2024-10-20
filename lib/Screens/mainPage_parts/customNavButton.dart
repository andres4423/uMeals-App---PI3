import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:umeals/Screens/mi_cuenta/mi_cuenta.dart';
import 'package:umeals/Screens/mi_cuenta/settings.dart';
import 'package:umeals/Screens/pagina_principal.dart';
import 'package:umeals/domain/types/user_model.dart';
import 'package:umeals/services/cuenta_service.dart';

class Customnavbutton extends StatefulWidget {
  const Customnavbutton({super.key});

  @override
  State<Customnavbutton> createState() => _CustomnavbuttonState();
}

class _CustomnavbuttonState extends State<Customnavbutton> {
    User? _user;  
      @override
  void initState() {
    super.initState();
    _fetchUserInfo(); 
  }

Future<void> _fetchUserInfo() async {
  UserInfoService userInfoService = UserInfoService();
  User? user = await userInfoService.fetchUserInfo();
 setState(() {
    _user = user;  
   
  });
}


  
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
        MaterialPageRoute(builder: (context) => const PaginaPrincipal()));  
        break;
        case 2:
         Navigator.push(context, 
        MaterialPageRoute(builder: (context) =>  Settings_View(user: _user!,)));  
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



        items: [
            BottomNavigationBarItem(icon: CircleAvatar(
            backgroundImage: _user?.imageURL != null
              ? MemoryImage(
                  base64Decode(_user!.imageURL!.replaceFirst('data:image/png;base64,', ''))
                )
              : const NetworkImage('https://cdn.icon-icons.com/icons2/1919/PNG/512/avatarinsideacircle_122011.png'), // Imagen por defecto
          ),
            label: 'Profile',
            

            ),
            // BottomNavigationBarItem(
            //   icon: Icon(
            //     Icons.message_outlined, 
            //     color: Colors.black45,)
            //     , label: '',),
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined, color: Colors.black45), label: 'home'),
            // BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined, color: Colors.black45), label: 'carrito_compras'),
            BottomNavigationBarItem(icon: Icon(Icons.settings, color: Colors.black45), label: 'settings'),



        ],
      ),
    );
  }
}