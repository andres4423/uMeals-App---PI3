import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:umeals/Screens/mainPage_parts/customNavButton.dart';
import 'package:umeals/Screens/mi_cuenta/editar.dart';

class AyudaView extends StatelessWidget {
  const AyudaView({super.key});

  @override
  Widget build(BuildContext context) {
   
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 40),
          onPressed: () {
            context.go('/cuenta');
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            //! AYUDA

           Text("Ayuda", style: TextStyle(fontSize:screenSize.width * 0.06, fontWeight: FontWeight.bold ),),

           SizedBox(height: screenSize.width * 0.06,),

            ListTile(
              leading: const Icon(Icons.bug_report, size: 25,),
              title:  Text('Reportar un bug', style: TextStyle(fontSize:screenSize.width * 0.0399 ),),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.warning, size: 25,),
              title:  Text('Reportar comentario inadecuado',style: TextStyle(fontSize:screenSize.width * 0.0399 ),),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.priority_high, size: 25,),
              title:  Text('Reportar otro problema',style: TextStyle(fontSize:screenSize.width * 0.0399 ),),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            const SizedBox(height: 20),

            //! HISTORIAL

            Text("Historial", style: TextStyle(fontSize:screenSize.width * 0.06, fontWeight: FontWeight.bold ),),
            SizedBox(height: screenSize.width * 0.06,),

            
            ListTile(
              leading: const Icon(Icons.history, size: 25,),
              title:  Text('Ver historial de pedidos/compras',style: TextStyle(fontSize:screenSize.width * 0.0399 ),),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),

            ListTile(
              leading: const Icon(Icons.cancel_outlined, size: 25,),
              title:  Text('¿Problemas con tu último pedido?',style: TextStyle(fontSize:screenSize.width * 0.0399 ),),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            SizedBox(height: 25,),

            //! CHATEA CON NOSOTROS

            
            Text("Chatea con nosotros", style: TextStyle(fontSize:screenSize.width * 0.06, fontWeight: FontWeight.bold ),),
            SizedBox(height: screenSize.width * 0.03,),

             ListTile(
              leading: const Icon(Icons.chat, size: 25, color: Colors.red,),
              title:  Text('Chat en vivo',style: TextStyle(fontSize:screenSize.width * 0.0399, color: Colors.red ),),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),


            SizedBox(height: screenSize.height * 0.15), 
            const SizedBox(height: 10),
           
          ],
        ),
      ),
      bottomNavigationBar: Customnavbutton(),
    );
  }
}
