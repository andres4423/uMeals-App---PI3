// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, use_build_context_synchronously
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'login.dart';


class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> register() async {
    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:3000/register'),  
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'Nombre': nameController.text,
          'correo': emailController.text, 
          'password': passwordController.text,
        }),
      );

      if (response.statusCode == 201) {
        print('Usuario registrado exitosamente');

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registro exitoso')),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      } else {
        final error = jsonDecode(response.body)['message'] ?? 'Error desconocido';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $error')),
        );
      }
    } catch (e) {
      print('Error de red: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al conectar con el servidor')),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60),
              SizedBox(
                height: 100,
                child: Image.asset('assets/loo_rojo_Umeals.png'),
              ),
              SizedBox(height: 40),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Regístrate',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Por favor llene el formulario para crear su cuenta de uMeals',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 40),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Nombre Completo',
                  hintText: 'Ingrese sus nombres y apellidos',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Correo electrónico',
                  hintText: 'Ingrese su correo institucional',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16), 
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  hintText: 'Ingrese su contraseña',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: register,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                  backgroundColor: Colors.red,
                ),
                child: Text(
                  'REGISTRATE',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); 
                },
                child: Text(
                  '¿Ya tienes cuenta? Inicia Sesión',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
