// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, use_build_context_synchronously
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Screens/login_register/login.dart';
class RegisterService{
    final BuildContext context;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController apellidosController;
  final TextEditingController telefonoController;
  
  RegisterService({
    required this.apellidosController,
     required this.telefonoController,
    required  this.nameController,
    required this.context,
    required this.emailController,
    required this.passwordController,
  });
  Future<void> register() async {
    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:3000/register'),  
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'Nombre': nameController.text,
          'correo': emailController.text, 
          'password': passwordController.text,
          'Apellidos': apellidosController.text,
          'telefono': telefonoController.text
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
}