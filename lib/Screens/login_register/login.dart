// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:umeals/services/login_service.dart';
import 'register.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
   bool response = false;
   

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
                  'Iniciar Sesión',
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
                  'Por favor inicie sesión en su cuenta de uMeals',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 40),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Correo electrónico',
                  hintText: 'Ingrese su correo institucional',
                  border: OutlineInputBorder(),
                  
                ),
                controller: emailController,
              ),
              SizedBox(height: 16),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  hintText: 'Ingrese su contraseña',
                  border: OutlineInputBorder(),
                ),
                controller:passwordController ,
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: ()
                {AuthService(
                     context: context,
                  emailController: emailController,
                  passwordController: passwordController,
                ).login();
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                  backgroundColor: Colors.red,
                ),
                child: Text(
                  'INICIAR SESIÓN',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                child: Text(
                  '¿Aún no tienes cuenta? Crea una cuenta',
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
