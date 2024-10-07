import 'package:umeals/Screens/mainPage_parts/store_grid.dart';
import 'package:umeals/domain/types/business_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class BusinessPage extends StatelessWidget {
  const BusinessPage({super.key});

  Future<List<BusinessModel>> fetchBusinesses() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');

    final response = await http.get(
      Uri.parse('http://10.0.2.2:3000/emprendimientos'),
      headers: {
        'Authorization': 'Bearer $token', 
      },
    );

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      print(data);
      return data.map((business) => BusinessModel.fromJson(business)).toList();
    } else if (response.statusCode == 401) {
      throw Exception('Token expired, please log in again');
    } else {
      throw Exception('Failed to load businesses');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BusinessModel>>(
      future: fetchBusinesses(),
      builder: (context, snapshot) {
        print(snapshot);
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return const Center(child: Text('Error loading businesses'));
        } else {
          return BusinessGrid(businesses: snapshot.data ?? []);
        }
      },
    );
  }
}
