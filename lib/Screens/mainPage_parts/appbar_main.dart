import 'package:flutter/material.dart';


class AppBarMain extends StatelessWidget {
  const AppBarMain({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 5,),
            Image.asset(
              'assets/logoUmeals.png',
              height: 50,
            ), 
            const SizedBox(width: 10,),
            Container(
              height: 50, // Altura de la línea igual a la altura de las imágenes
              width: 0.5, // Grosor de la línea
              color: Colors.black87, // Color de la línea
            ),
          
  
             Image.asset(
              'assets/logoUPB.png', // Ruta de la segunda imagen
              height: 50,
            ),
          ]
        ),
      ),
    );
  }
}