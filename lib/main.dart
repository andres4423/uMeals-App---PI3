
import 'package:flutter/material.dart';
// import 'package:umeals/Screens/pagina_principal.dart';
import 'package:umeals/config/Theme/appTheme.dart';
import 'package:umeals/config/routes/app_route.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return  MaterialApp.router(
      routerConfig: AppRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}



