// ignore_for_file: non_constant_identifier_names

import 'package:go_router/go_router.dart';
import 'package:umeals/Screens/login_register/login.dart';
import 'package:umeals/Screens/mi_cuenta/ayuda.dart';
import 'package:umeals/Screens/mi_cuenta/mi_cuenta.dart';
import 'package:umeals/Screens/mi_cuenta/settings.dart';

final AppRouter = GoRouter(
  
//* Para pasar id es así:
routes: [

GoRoute(
path: '/',
builder: (context, state) =>  LoginScreen(),
),

GoRoute(
  path: '/cuenta',
  builder: (context, state){
    return const MiCuenta();
  }
),
GoRoute(
  path: '/login',
  builder: (context, state){
    return  LoginScreen();
  }
),

  GoRoute(
  path: '/ayuda',
  builder: (context, state){
    return const AyudaView();
  }
  ),
   GoRoute(
  path: '/settings',
  builder: (context, state){
    return const Settings_View();
  }
  ),
]
);
