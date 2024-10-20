import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:umeals/Screens/mainPage_parts/customNavButton.dart';
import 'package:umeals/Screens/mainPage_parts/product_box.dart';
import 'package:umeals/Screens/orden_pedido/checkout.dart';
import 'package:umeals/Screens/review/bussinessReviewPage.dart';
import 'package:umeals/domain/types/business_model.dart';
import 'package:umeals/domain/types/product_model.dart';

class DetailedView extends StatefulWidget {
  const DetailedView(
      {super.key,
      required this.business,
      required this.products,
      required this.color});
  final List<ProductModel> products;
  final BusinessModel business;
  final Color color;

  @override
  State<DetailedView> createState() => _DetailedViewState();
}

class _DetailedViewState extends State<DetailedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Column(
            children: [
              Container(
                height: 310,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(widget.business.portadaImgURL),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5),
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [widget.color, Colors.transparent],
                          ),
                        ),
                      ),
                    ),
                    // Iconos y texto del banner
                    Positioned(
                      top: 30,
                      left: 16,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      right: 16,
                      child: Row(
                        children: [
                          const Icon(Icons.compass_calibration_rounded,
                              color: Colors.white),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite_border,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 80,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 45,
                              backgroundImage:
                                  NetworkImage(widget.business.logotipoImgUrl),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              widget.business.nombre,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                IconButton(
                                  icon: const Icon(Icons.star,
                                      color: Colors.yellow),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const BusinessReviewPage(),
                                      ),
                                    );
                                  },
                                ),
                                // const SizedBox(width: 5),
                                Text(
                                  widget.business.calificacion.toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                                const SizedBox(width: 10),
                                const Icon(Icons.motorcycle, color: Colors.white),
                                const SizedBox(width: 5),
                                const Text(
                                  'Gratis',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.location_on, color: Colors.white),
                                SizedBox(width: 5),
                                Text(
                                  'Mesas del G',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Barra de pestañas
              TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorColor: widget.color,
                tabs: [
                  Tab(text: 'Información'),
                  Tab(text: 'Productos'),
                ],
              ),
              // Vistas correspondientes a las pestañas
              Expanded(
                child: TabBarView(
                  children: [
                    // Primera pestaña: Información
                    InformationTab(
                        business: widget.business, color: widget.color),
                    // Segunda pestaña: Productos
                    ProductTab(products: widget.products, color: widget.color),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Customnavbutton(),
    );
  }
}

class InformationTab extends StatelessWidget {
  const InformationTab(
      {super.key, required this.business, required this.color});
  final Color color;
  final BusinessModel business;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Alineación a la izquierda
        children: [
          // Descripción
          const Text(
            'Descripción',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 10),
          Center(
            // Alineamos el contenedor al centro
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                business.descripcion,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ubicación',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:
                            // GoogleMap(
                            //   initialCameraPosition: CameraPosition(
                            //     target: LatLng(7.0375758,
                            //         -73.0705219),
                            //     zoom: 18,
                            //   ),
                            //   markers: {
                            //     Marker(
                            //       markerId: MarkerId('vendedor'),
                            //       position: LatLng(7.0375758,
                            //           -73.0705219),
                            //     ),
                            //   },
                            // ),
                            const Center(
                          child: Icon(Icons.map, size: 100, color: Colors.red),
                        )),
                  ],
                ),
              ),
              // Contacto y Métodos de Pago
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Contacto',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.only(right: 25),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color:
                            Color(0xFF1E252B), // Set background color to 1E252B
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.phone,
                                color: Colors.blue, size: 30),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            business.contacto.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Métodos de pago',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: color,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset(
                                'assets/nequi.png',
                                width: 35,
                                height: 35,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: color,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset(
                                'assets/bancolombia.png',
                                width: 35,
                                height: 35,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: color,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset(
                                'assets/cash.png',
                                width: 35,
                                height: 35,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        // Flexible(
                        //   child: Text(
                        //     'Efectivo, Transferencia',
                        //     style: TextStyle(fontSize: 14),
                        //     overflow: TextOverflow.ellipsis,
                        //   ),
                        // ),
                      ],
                    ),

                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Horarios
          const Text(
            'Horarios',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 120,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: business.horarios.toJson().length,
                itemBuilder: (context, index) {
                  final List<String> diasOrdenados = [
                    'lunes',
                    'martes',
                    'miércoles',
                    'jueves',
                    'viernes'
                  ];
                  final dia = diasOrdenados[index];
                  final horarios =
                      business.horarios.toJson().values.elementAt(index);
                  return horarioBox(dia, horarios);
                }),
          ),
        ],
      ),
    );
  }

  Widget horarioBox(String dia, String horarios, {Color? color}) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(8),
      width: 150,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            dia,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  children: [
                    const Icon(Icons.chevron_right, size: 16),
                    const SizedBox(width: 7),
                    Text(horarios, style: TextStyle(fontSize: 14, color: color)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProductTab extends StatelessWidget {
  const ProductTab({super.key, required this.products, required this.color});
  final List<ProductModel> products;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Productos de la casa',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              SizedBox(
                height: 270,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductBox(product: product);
                  },
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderScreen(color: color),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Realizar Orden',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
    
  }
}
