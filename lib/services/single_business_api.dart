import 'package:umeals/Screens/mainPage_parts/store.dart';
import 'package:umeals/domain/types/business_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:umeals/domain/types/product_model.dart';

class SingleBusinessPage extends StatelessWidget {
  const SingleBusinessPage({super.key, required this.business});
  final BusinessModel business;

  Future<List<ProductModel>> fetchProducts() async {
    final id = business.idEMPRENDIMIENTOS;
    final response =
        await http.get(Uri.parse('http://10.0.2.2:3002/productos/$id'));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      print(data);
      return data.map((product) => ProductModel.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: fetchProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return const Center(child: Text('Error loading business'));
        } else {
          return DetailedView(business: business, products: snapshot.data ?? []);
        }
      },
    );
  }
}
