
import 'package:flutter/material.dart';
import 'package:umeals/Screens/pagina_principal.dart';
import 'package:umeals/config/Theme/appTheme.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});


   @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      routerConfig: AppRouter,
    );
  }
}



