import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:umeals/Screens/mainPage_parts/customNavButton.dart';
import 'package:umeals/widgets/animatedPaymentCards.dart'; 

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  bool isDeliverySelected = false; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Tu orden',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/Arteysano.png'), 
              ),
              title: Text('ArteySano'),
              subtitle: Text('2 productos'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            // Método de entrega
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Método de entrega',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Container(
                              height: 50, 
                              child: ChoiceChip(
                                label: Text(
                                  'Voy yo',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                selected: !isDeliverySelected,
                                onSelected: (selected) {
                                  setState(() {
                                    isDeliverySelected = false;
                                  });
                                },
                                selectedColor: Colors.green,
                                backgroundColor: Color(0xFF656565),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                side: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Container(
                              height: 50, 
                              child: ChoiceChip(
                                label: Text(
                                  'A domicilio',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                selected: isDeliverySelected,
                                onSelected: (selected) {
                                  setState(() {
                                    isDeliverySelected = true;
                                  });
                                },
                                selectedColor: Colors.green,
                                backgroundColor: Color(0xFF656565),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                side: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('El vendedor se encuentra en'),
                  SizedBox(height: 10),
                  Container(
                    height: 200,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(4.7110, -74.0721),
                        zoom: 14,
                      ),
                      markers: {
                        Marker(
                          markerId: MarkerId('vendedor'),
                          position: LatLng(4.7110, -74.0721),
                        ),
                      },
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Método de pago',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  AnimatedPaymentCards(),
                ],
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Acción del botón
                        },
                        child: Text(
                          'Apartar',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 20.0), 
                          backgroundColor: Color(0xFF174411), 
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: ElevatedButton.icon(
                        onPressed: () {

                        },
                        icon: Icon(
                          Icons.chat,
                          color: Colors.white,
                        ),
                        label: Text(''),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 20.0), 
                          backgroundColor: Color(0xFF174411), 
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Customnavbutton(), 
    );
  }
}
