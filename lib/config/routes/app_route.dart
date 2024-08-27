import 'package:go_router/go_router.dart';
import 'package:umeals/Screens/mi_cuenta.dart';
import 'package:umeals/Screens/pagina_principal.dart';

final AppRouter = GoRouter(
  
//* Para pasar id es así:
routes: [
GoRoute(
path: '/',
builder: (context, state) => const PaginaPrincipal(),
),
//     esto para evitar q si recarga pierda flecha de refreso
GoRoute(
path: '/cuenta',
builder: (context, state){
//final movieId = state.pathParameters['id'] ?? 'no id';

return  const MiCuenta();
}
),



]
);

