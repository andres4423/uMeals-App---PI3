
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:umeals/domain/types/user_model.dart';
import 'package:umeals/storage/token_storage.dart';

class UpdateUser{
Future<bool> updateUserInfo(User user) async {
  final SecureStorageService _secureStorageService = SecureStorageService(); 
    try {
      String? token = await _secureStorageService.readToken('jwt');
      if (token == null) {
        print('No se encontró token');
        return false;
      }

       final payload = {
        'Nombre': user.nombre,
        'Apellidos': user.apellidos,
        'telefono': user.telefono,
        'imageURL': user.imageURL,
        'password' : user.password
      };

      final response = await http.put(
        Uri.parse('http://10.0.2.2:3000/update'), 
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(payload),
      );

      if (response.statusCode == 200) {
        print('Usuario actualizado exitosamente');
        return true;
      } else {
        print('Error al actualizar usuario: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error de red: ${e.toString()}');
      return false;
    }
  }

}
 