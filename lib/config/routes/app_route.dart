// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:umeals/Screens/login_register/login.dart';
import 'package:umeals/Screens/orden_pedido/checkout.dart';
import 'package:umeals/Screens/mi_cuenta/ayuda.dart';
import 'package:umeals/Screens/mi_cuenta/mi_cuenta.dart';
import 'package:umeals/Screens/mi_cuenta/settings.dart';
import 'package:umeals/widgets/splashScreen.dart'; 

final AppRouter = GoRouter(
  //* Para pasar id es así:
  routes: [
    // Ruta para el splash screen
    GoRoute(
      path: '/',
      builder: (context, state) => SplashScreen(), 
    ),

    GoRoute(
      path: '/orden',
      builder: (context, state) => OrderScreen(color: Colors.white),
    ),
    
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen(),
    ),

    GoRoute(
      path: '/cuenta',
      builder: (context, state) {
        return const MiCuenta();
      },
    ),

    GoRoute(
      path: '/ayuda',
      builder: (context, state) {
        return const AyudaView();
      },
    ),

    GoRoute(
      path: '/settings',
      builder: (context, state) {
        return const Settings_View();
      },
    ),
    
  ],
);
