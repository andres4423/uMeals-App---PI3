// lib/services/auth_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:umeals/domain/types/user_model.dart';
import 'package:umeals/storage/token_storage.dart';


class UserInfoService {
  final SecureStorageService _secureStorageService = SecureStorageService(); 

  Future<User?> fetchUserInfo() async {
    try {

      String? token = await _secureStorageService.readToken('jwt');

 
      if (token == null) {
        print('No se encontró token');
        return null;
      }

     
      final response = await http.get(
        Uri.parse('http://10.0.2.2:3000/userInfo'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', 
        },
      );


      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);
     
        User user = User.fromJson(data);

        print('Información del usuario obtenida con éxito: ${user.nombre}');
        return user;
      } else {
        print('Error al obtener información del usuario: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error de red: ${e.toString()}');
      return null;
    }
  }
}
