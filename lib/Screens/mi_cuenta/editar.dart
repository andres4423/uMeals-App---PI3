// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Editar_cuenta extends StatefulWidget {
  const Editar_cuenta({super.key});

  @override
  State<Editar_cuenta> createState() => _Editar_cuentaState();
}

class _Editar_cuentaState extends State<Editar_cuenta> {
    final TextEditingController nombreController = TextEditingController(text: 'David Santiago');
  final TextEditingController apellidosController = TextEditingController(text: 'Cárdenas Rivera');
  final TextEditingController telefonoController = TextEditingController(text: '3223450293');
  final TextEditingController correoController = TextEditingController(text: 'david.cardenas.2022@upb.edu.co');
  final TextEditingController passController = TextEditingController(text:'12345');
  InputDecoration _buildInputDecoration(String labelText) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(color: Colors.black, fontSize: 25),
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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 38,),
          onPressed: () {
            context.go('/cuenta');
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: Center(
                    child: Container(
                      width: 92,
                      height: 92,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const CircleAvatar(
                        radius: 45,
                        backgroundImage: AssetImage('assets/cachi.jpeg',),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: 56.0, 
                      maxHeight: 70.0, 
                    ),
                    child: ListTile(
                      title: const Text('Editar foto de perfil', style: TextStyle(fontSize: 25),),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40,),
            Text("Información Personal", style: TextStyle(fontSize: 25, ),),
            SizedBox(height: 50,),

            //*formularios 
             TextFormField(
              controller: nombreController,
              decoration: _buildInputDecoration('Nombre(s)'),
              style: TextStyle(
                fontSize: 18
              ),
            ),

             SizedBox(height: 40,),
             TextFormField(
              controller: nombreController,
              decoration: _buildInputDecoration('Apellidos'),
              style: TextStyle(
                fontSize: 18
              ),
            ),
             SizedBox(height: 40,),

            //*formularios 
             TextFormField(
                controller: telefonoController,
                keyboardType: TextInputType.phone,
                decoration: _buildInputDecoration('Teléfono').copyWith( 
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('🇨🇴 +57', style: TextStyle(fontSize: 16)),
                  ),
                  
                ),
                style: TextStyle(
                fontSize: 18
              ),
              ),
             SizedBox(height: 30,),
              Text("Seguridad y Cuenta", style: TextStyle(fontSize: 25, ),),
             SizedBox(height: 30,),

             TextFormField(
              controller: passController,
              decoration: _buildInputDecoration('Contraseña'),
              obscureText: true,
              style: TextStyle(
                fontSize: 18
              ),
            ),
          
            SizedBox(height: 40,),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
               child: Container(
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                   border: Border.all(
               color: Colors.red, 
                 width: 2.0, 
                   ),
                 
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.delete, size: 35, color: Colors.red,),
                    Text("Eliminar Cuenta", style: TextStyle(fontSize: 20),)
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
