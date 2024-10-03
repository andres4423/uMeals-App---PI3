import 'package:flutter/material.dart';
import 'package:umeals/widgets/review_item.dart';
import 'package:umeals/Screens/mainPage_parts/customNavButton.dart'; 

class BusinessReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
          },
        ),
        title: Text(
          'ArteySano',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/Arteysano.png'), 
              ),
              SizedBox(height: 10),
              Text(
                'ArteySano',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '4.9',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                ],
              ),
              Text('22 reseñas', style: TextStyle(color: Colors.grey)),
              SizedBox(height: 20),
            ],
          ),
          Divider(),
          // Lista de reseñas
          ReviewItem(
            userImage: 'assets/user1.png',
            userName: 'Natalia Mejía',
            rating: 4.5,
            comment:
                'Muy ricos, se nota que las salsas las hacen ellos mismos <3',
          ),
          ReviewItem(
            userImage: 'assets/user2.png',
            userName: 'Sofía Salas',
            rating: 4.8,
            comment:
                'Me encantaaaan mucho!!! Son mis favoritos de toda la universidad.',
          ),
          ReviewItem(
            userImage: 'assets/user3.png',
            userName: 'Alexandra Bernal',
            rating: 3.5,
            comment:
                'En lo personal el chipotle pica bastante, pero estaba aceptable.',
          ),
          ReviewItem(
            userImage: 'assets/user4.png',
            userName: 'Gabriel Reyes',
            rating: 5.0,
            comment:
                'De verdad amo estos sándwiches. Yo por mí, me casaba con ellos.',
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                onPressed: () {
                  print('Cargar más reseñas...');
                },
                child: Text(
                  'Cargar más...',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Customnavbutton(), 
    );
  }
}
