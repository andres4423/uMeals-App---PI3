import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:umeals/domain/types/user_model.dart';

class Editar_cuenta extends StatefulWidget {
  final User user;
  const Editar_cuenta({super.key, required this.user});

  @override
  State<Editar_cuenta> createState() => _Editar_cuentaState();
}

class _Editar_cuentaState extends State<Editar_cuenta> {

    late TextEditingController nombreController;
  late TextEditingController apellidosController;
  late TextEditingController telefonoController;
  late TextEditingController correoController;
  late TextEditingController passController;

  @override
  void initState() {
    super.initState();
    // Inicializa los controladores aquí
    nombreController = TextEditingController(text: widget.user.nombre);
    apellidosController = TextEditingController(text: widget.user.apellidos);
    telefonoController = TextEditingController(text: widget.user.telefono.toString());
    correoController = TextEditingController(text: widget.user.correo);
    passController = TextEditingController(text: ''); 
  }
  
  File? _imageFile; 
  final ImagePicker _picker = ImagePicker(); 

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


  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imageFile = File(image.path); 
      });
    }
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
                      child: CircleAvatar(
                        backgroundImage: _imageFile != null
                            ? FileImage(_imageFile!) 
                            : AssetImage('assets/cachi.jpeg') as ImageProvider, 
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
                      title: Text(
                        'Editar foto de perfil',
                        style: TextStyle(fontSize: textFieldFontSize),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, size: iconSize),
                      onTap: _pickImage, 
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              "Información Personal",
              style: TextStyle(fontSize: labelFontSize, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),

            //* Formularios
            TextFormField(
              controller: nombreController,
              decoration: _buildInputDecoration('Nombre(s)', textFieldFontSize),
              style: TextStyle(fontSize: textFieldFontSize),
            ),
            SizedBox(height: 40),

            TextFormField(
              controller: apellidosController,
              decoration: _buildInputDecoration('Apellidos', textFieldFontSize),
              style: TextStyle(fontSize: textFieldFontSize),
            ),
            SizedBox(height: 40),

            TextFormField(
              controller: telefonoController,
              keyboardType: TextInputType.phone,
              decoration: _buildInputDecoration('Teléfono', textFieldFontSize).copyWith(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text('🇨🇴 +57', style: TextStyle(fontSize: textFieldFontSize)),
                ),
              ),
              style: TextStyle(fontSize: textFieldFontSize),
            ),
            SizedBox(height: 30),

            Text(
              "Seguridad y Cuenta",
              style: TextStyle(fontSize: labelFontSize, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 25),

            TextFormField(
              controller: passController,
              decoration: _buildInputDecoration('Contraseña', textFieldFontSize),
              obscureText: true,
              style: TextStyle(fontSize: textFieldFontSize),
            ),
            SizedBox(height: 40),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.15),
              child: Container(
                width: size.width * 3,
                height: size.height * 0.058,
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
