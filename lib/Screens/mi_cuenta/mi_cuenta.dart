import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:umeals/Screens/mi_cuenta/ayuda.dart';
import 'package:umeals/Screens/mi_cuenta/editar.dart';
import 'package:umeals/Screens/mi_cuenta/settings.dart';

class MiCuenta extends StatelessWidget {
  const MiCuenta({super.key});

  @override
  Widget build(BuildContext context) {
   
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 30),
          onPressed: () {
            context.go('/');
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: screenSize.width * 0.24, 
                  height: screenSize.width * 0.25, 
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Colors.pink, Colors.purple],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      width: screenSize.width * 0.25, 
                      height: screenSize.width * 0.215,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const CircleAvatar(
                        backgroundImage: AssetImage('assets/cachi.jpeg'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Hola",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "David",
                        style: TextStyle(
                          fontSize: screenSize.width * 0.055, 
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Image.asset(
                  'assets/mano.jpeg',
                  width: screenSize.width * 0.4, 
                ),
              ],
            ),
            const SizedBox(height: 40),
            ListTile(
              leading: const Icon(Icons.edit, size: 25,),
              title:  Text('Editar perfil', style: TextStyle(fontSize:screenSize.width * 0.045 ),),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Editar_cuenta()),
                );
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.message, size: 25,),
              title:  Text('Enviar mensaje',style: TextStyle(fontSize:screenSize.width * 0.045 ),),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.settings, size: 25,),
              title:  Text('Configuración',style: TextStyle(fontSize:screenSize.width * 0.045 ),),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Settings_View()),
                );
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.help, size: 25,),
              title:  Text('Ayuda',style: TextStyle(fontSize:screenSize.width * 0.045 ),),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AyudaView()),
                );
              },
            ),
            SizedBox(height: screenSize.height * 0.15), 
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.logout, size: 25,),
              title:  Text('Cerrar Sesión',style: TextStyle(fontSize:screenSize.width * 0.045 ),),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                context.go("/login");
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.business, size: 25,),
              title:  Text('Ser Comerciante',style: TextStyle(fontSize:screenSize.width * 0.045 ),),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            const SizedBox(height: 40),
            Center(
              child: Image.asset(
                'assets/UMEALSXUPB.jpeg',
                width: screenSize.width * 0.7,
              ),
            ),
            const Center(
              child: Text(
                "v1.0 Developed by SGN",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
