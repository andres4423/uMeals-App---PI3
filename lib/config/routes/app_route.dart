// ignore_for_file: non_constant_identifier_names

import 'package:go_router/go_router.dart';
import 'package:umeals/Screens/mi_cuenta/editar.dart';
import 'package:umeals/Screens/mi_cuenta/mi_cuenta.dart';
import 'package:umeals/Screens/pagina_principal.dart';

final AppRouter = GoRouter(
  
//* Para pasar id es así:
routes: [
  
GoRoute(
path: '/',
builder: (context, state) => const PaginaPrincipal(),
),

GoRoute(
  path: '/cuenta',
  builder: (context, state){
    return const MiCuenta();
  }
),
GoRoute(
  path: '/editar_cuenta',
  builder: (context, state){
    return const Editar_cuenta();
  }
  )
]
);
