import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:umeals/Screens/mainPage_parts/customNavButton.dart';
import 'package:umeals/Screens/mi_cuenta/mi_cuenta.dart';
import 'package:umeals/domain/types/user_model.dart';
import 'package:umeals/services/update_service.dart';

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

  bool showEditButton = false;

  @override
  void initState() {
    super.initState();
    nombreController = TextEditingController(text: widget.user.nombre);
    apellidosController = TextEditingController(text: widget.user.apellidos);
    telefonoController =
        TextEditingController(text: widget.user.telefono.toString());
    correoController = TextEditingController(text: widget.user.correo);
    passController = TextEditingController(text: widget.user.password);
  }

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

//! parte de la imagen
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
        _checkForChanges();
      });
    }
  }

  void _checkForChanges() {
    setState(() {
      showEditButton = nombreController.text != widget.user.nombre ||
          apellidosController.text != widget.user.apellidos ||
          telefonoController.text != widget.user.telefono.toString() ||
          passController.text != widget.user.password ||
          _imageFile != null;
    });
  }

  Future<void> _editUserInformation() async {
    final updateUserService = UpdateUser();

    String? base64Image;
    if (_imageFile != null) {
      final bytes = await _imageFile!.readAsBytes();
      base64Image = base64Encode(bytes);
    }

    int? telefono;
    try {
      telefono = int.parse(telefonoController.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('El número de teléfono no es válido')),
      );
      return;
    }

    final updatedUser = User(
      nombre: nombreController.text,
      apellidos: apellidosController.text,
      telefono: telefono,
      correo: correoController.text,
      password: passController.text,
      imageURL: base64Image,
    );

    final success = await updateUserService.updateUserInfo(updatedUser);

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Información actualizada con éxito')),
      );
      setState(() {
        widget.user.nombre = updatedUser.nombre;
        widget.user.apellidos = updatedUser.apellidos;
        widget.user.telefono = updatedUser.telefono;
        widget.user.correo = updatedUser.correo;
        widget.user.password = updatedUser.password;
        if (_imageFile != null) {
          widget.user.imageURL = base64Image;
        }
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al actualizar información')),
      );
    }
  }

//! app
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MiCuenta()),
            );
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
          : (widget.user.imageURL != null && widget.user.imageURL!.isNotEmpty
              ? MemoryImage(
                  base64Decode(widget.user.imageURL!.replaceFirst('data:image/png;base64,', ''))
                )
              : NetworkImage(
                  'https://cdn.icon-icons.com/icons2/1919/PNG/512/avatarinsideacircle_122011.png',
                ) as ImageProvider),
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
              style: TextStyle(
                  fontSize: labelFontSize, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),

            TextFormField(
              controller: nombreController,
              decoration: _buildInputDecoration('Nombre(s)', textFieldFontSize),
              style: TextStyle(fontSize: textFieldFontSize),
              onChanged: (value) => _checkForChanges(),
            ),
            SizedBox(height: 40),

            TextFormField(
              controller: apellidosController,
              decoration: _buildInputDecoration('Apellidos', textFieldFontSize),
              style: TextStyle(fontSize: textFieldFontSize),
              onChanged: (value) => _checkForChanges(),
            ),
            SizedBox(height: 40),

            TextFormField(
              controller: telefonoController,
              keyboardType: TextInputType.phone,
              onChanged: (value) => _checkForChanges(),
              decoration:
                  _buildInputDecoration('Teléfono', textFieldFontSize).copyWith(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text('🇨🇴 +57',
                      style: TextStyle(fontSize: textFieldFontSize)),
                ),
              ),
              style: TextStyle(fontSize: textFieldFontSize),
            ),
            SizedBox(height: 10),

            Text(
              "Seguridad y Cuenta",
              style: TextStyle(
                  fontSize: labelFontSize, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 25),

            TextFormField(
              controller: passController,
              decoration:
                  _buildInputDecoration('Contraseña', textFieldFontSize),
              obscureText: true,
              style: TextStyle(fontSize: textFieldFontSize),
              onChanged: (value) => _checkForChanges(),
            ),
            SizedBox(height: 40),

            // Botón para editar información
            if (showEditButton)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.15),
                child: GestureDetector(
                  onTap: _editUserInformation,
                  child: Container(
                    width: size.width * 3,
                    height: size.height * 0.058,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.purple,
                        width: 2.0,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.edit,
                          size: iconSize,
                          color: Colors.purple,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Editar información",
                          style: TextStyle(
                              fontSize: textFieldFontSize,
                              color: Colors.purple),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            SizedBox(height: 20),

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
                      style: TextStyle(
                          fontSize: textFieldFontSize, color: Colors.red),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Customnavbutton(),
    );
  }
}
