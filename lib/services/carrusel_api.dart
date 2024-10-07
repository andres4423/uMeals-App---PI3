import 'package:umeals/Screens/mainPage_parts/exports.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../domain/types/swiperInfo.dart';


class CarruselApi extends StatelessWidget {
  const CarruselApi({super.key});

  Future<List<InfoSwiper>> fetchCarruselImages() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:3000/getCarruselImages'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      print(data);
      return data.map((images) => InfoSwiper.fromMap(images)).toList();
    } else {
      throw Exception('Failed to load Images');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<InfoSwiper>>(
      future: fetchCarruselImages(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return const Center(child: Text('Error loading businesses'));
        } else {
          final imagesPath = snapshot.data!;
          return SwiperInfo(infoSwiper: imagesPath );
        }
      },
    );
  }
}