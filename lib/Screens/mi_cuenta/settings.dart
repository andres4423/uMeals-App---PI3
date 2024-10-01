// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Settings_View extends StatefulWidget {
  const Settings_View({super.key});

  @override
  State<Settings_View> createState() => _Settings_ViewState();
}

class _Settings_ViewState extends State<Settings_View> {
  final TextEditingController nombreController =
      TextEditingController(text: 'David Santiago');
  final TextEditingController apellidosController =
      TextEditingController(text: 'Cárdenas Rivera');
  final TextEditingController telefonoController =
      TextEditingController(text: '3223450293');
  final TextEditingController correoController =
      TextEditingController(text: 'david.cardenas.2022@upb.edu.co');
  final TextEditingController passController =
      TextEditingController(text: '12345');

    bool _isEmailsEnabled = false; 

    bool _isNotifEnabled = false; 

  InputDecoration _buildInputDecoration(String labelText, double fontSize) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(color: Colors.black, fontSize: fontSize),
      filled: true,
      fillColor: Colors.grey[300],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
  
    final size = MediaQuery.of(context).size;
    final double avatarSize2 = size.width * 0.23;
    final double textFieldFontSize = size.width * 0.042; 
    final double labelFontSize = size.width * 0.055; 
    final double iconSize = size.width * 0.08; 

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: iconSize,
          ),
          onPressed: () {
            context.pop();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: avatarSize2, 
                  height: avatarSize2, 
                  child: Center(
                    child: Container(
                      width: avatarSize2, 
                      height: avatarSize2, 
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
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    children: [
                      Text("Nombre del usuario", style: TextStyle(fontSize:size.width * 0.05 ),),
                      Text("Correo del usuario", style: TextStyle(fontSize:size.width * 0.045 ),)
                    ],
                  )
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              "Privacidad",
              style: TextStyle(fontSize: labelFontSize, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            
            ListTile(
              leading: const Icon(Icons.email, size: 25,),
              title:  Text('Emails', style: TextStyle(fontSize:size.width * 0.0399 ),),
              trailing: Switch(
              value: _isEmailsEnabled, 
              onChanged: (bool newValue) {
                setState(() {
                  _isEmailsEnabled = newValue; 
                });
              },
            ),
              onTap: () {
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.notifications, size: 25,),
              title:  Text('Notificaciones push',style: TextStyle(fontSize:size.width * 0.0399 ),),
              trailing: Switch(
              value: _isNotifEnabled, 
              onChanged: (bool newValue) {
                setState(() {
                  _isNotifEnabled = newValue; 
                });
              },
              
            ),
              onTap: () {},
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.policy, size: 25,),
              title:  Text('Políticas de privacidad',style: TextStyle(fontSize:size.width * 0.0399 ),),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            const SizedBox(height: 20),

            //! SEGURIDAD

            Text("Seguridad", style: TextStyle(fontSize:labelFontSize, fontWeight: FontWeight.bold ),),
            SizedBox(height: size.width * 0.06,),

            
            ListTile(
              leading: const Icon(Icons.verified, size: 25,),
              title:  Text('Verificación en dos pasos',style: TextStyle(fontSize:size.width * 0.0399 ),),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),

           
            SizedBox(height: 25,),

            //! CHATEA CON NOSOTROS

            
            Text("Información", style: TextStyle(fontSize:labelFontSize, fontWeight: FontWeight.bold ),),
            SizedBox(height: size.width * 0.03,),

             ListTile(
              leading: const Icon(Icons.help, size: 25,),
              title:  Text('Términos y condiciones de uso',style: TextStyle(fontSize:size.width * 0.0399),),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),


            SizedBox(height: size.height * 0.03), 
           ListTile(
              leading: const Icon(Icons.logout, size: 25,),
              title:  Text('Cerrar Sesión',style: TextStyle(fontSize:size.width * 0.0399 ),),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                context.go("/login");
              },
            ),
            SizedBox(height: 15,),
            
             Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.15),
              child: Container(
                width: 250,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color.fromARGB(255, 255, 27, 27),
                    width: 2.0,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.delete,
                      size: iconSize,
                      color: Colors.red,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Eliminar Cuenta",
                      style: TextStyle(fontSize: textFieldFontSize, color: Colors.red),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
