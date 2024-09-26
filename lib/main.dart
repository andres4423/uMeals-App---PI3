
import 'package:flutter/material.dart';
import 'package:umeals/Screens/login_register/login.dart';
import 'package:umeals/Screens/mi_cuenta/editar.dart';
import 'package:umeals/Screens/pagina_principal.dart';
import 'package:umeals/config/Theme/appTheme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
        home: Editar_cuenta(),    
    );
  }
}



