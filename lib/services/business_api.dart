import 'package:umeals/Screens/mainPage_parts/store_grid.dart';
import 'package:umeals/domain/types/business_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class BusinessPage extends StatelessWidget {
  const BusinessPage({super.key});

  Future<List<BusinessModel>> fetchBusinesses() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:3002/emprendimientos'));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      print(data);
      return data.map((business) => BusinessModel.fromJson(business)).toList();
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