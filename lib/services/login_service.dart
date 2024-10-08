// lib/services/auth_service.dart
// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:umeals/Screens/pagina_principal.dart';
import 'package:umeals/storage/token_storage.dart';


class AuthService {
  final BuildContext context;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final SecureStorageService _secureStorageService = SecureStorageService();

  AuthService({
    required this.context,
    required this.emailController,
    required this.passwordController,
  });

  Future<void> login() async {
    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:3000/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'correo': emailController.text,
          'password': passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token = data['token'];

       
        await _secureStorageService.deleteToken('jwt'); 

     
        await _secureStorageService.writeToken('jwt', token);

        print('Inicio de sesión exitoso: ${data['message']}');
        print(token);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PaginaPrincipal()),
        );
      
      } else {
        final error = jsonDecode(response.body)['message'] ?? 'Error desconocido';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $error')),
        );
      }
    } catch (e) {
      print('Error de red: ${e.toString()}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al conectar con el servidor: ${e.toString()}')),
      );
    }
  }
}