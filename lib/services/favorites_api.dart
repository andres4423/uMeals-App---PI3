import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:umeals/domain/types/business_model.dart';
import 'package:umeals/storage/token_storage.dart';

class FavoritesApi {
  FavoritesApi();

  final SecureStorageService _secureStorageService = SecureStorageService();

  Future<List<BusinessModel>> fetchFavoriteBusinesses() async {
    String? token = await _secureStorageService.readToken('jwt');

    if (token == null) {
      print('No se encontró token');
      return [];
    }

    final response = await http.get(
      Uri.parse('http://10.0.2.2:3000/empFavoritos'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      print(data);
      return data.map((business) => BusinessModel.fromJson(business)).toList();
    } else {
      return [];
    }
  }

  Future<void> addFavorite(String id) async {
    String? token = await _secureStorageService.readToken('jwt');

    if (token == null) {
      print('No se encontró token');
      return;
    }

    final response = await http.post(
      Uri.parse('http://10.0.2.2:3000/empFavoritos'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode({'id': id}),
    );

    if (response.statusCode == 201) {
      print('Business added to favorites');
    } else {
      print('Failed to add business to favorites');
    }
  }

  Future<void> deleteFavorite(String id) async {
    String? token = await _secureStorageService.readToken('jwt');

    if (token == null) {
      print('No se encontró token');
      return;
    }

    final response = await http.delete(
      Uri.parse('http://10.0.2.2:3000/empFavoritos/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      print('Business removed from favorites');
    } else {
      print('Failed to remove business from favorites');
    }
  }
}
