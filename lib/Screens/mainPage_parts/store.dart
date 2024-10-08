import 'package:flutter/material.dart';
import 'package:umeals/domain/types/business_model.dart';
import 'package:umeals/domain/types/product_model.dart';

class DetailedView extends StatefulWidget {
  const DetailedView(
      {super.key, required this.business, required this.products});
  final List<ProductModel> products;
  final BusinessModel business;

  @override
  State<DetailedView> createState() => _DetailedViewState();
}

class _DetailedViewState extends State<DetailedView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.blue, Colors.transparent],
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
                    top: 100,
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
                              const Icon(Icons.star, color: Colors.yellow),
                              const SizedBox(width: 5),
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
            const TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.green,
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
                  InformationTab(business: widget.business),
                  // Segunda pestaña: Productos
                  ProductTab(products: widget.products),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InformationTab extends StatelessWidget {
  const InformationTab({super.key, required this.business});
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
                color: Colors.green.shade800,
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
                      child: const Center(
                        child: Icon(Icons.map, size: 100, color: Colors.red),
                      ),
                    ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.phone, color: Colors.white),
                        ),
                        const SizedBox(width: 10),
                        Text(business.contacto.toString()),
                      ],
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
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:
                              const Icon(Icons.payments, color: Colors.black),
                        ),
                        const SizedBox(width: 10),
                        const Text('Efectivo, Transferencia'),
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
                  final dia = business.horarios.toJson().keys.elementAt(index);
                  final horarios =
                      business.horarios.toJson().values.elementAt(index);
                  return horarioBox(dia, horarios);
                }),
          ),
        ],
      ),
    );
  }

  Widget horarioBox(String dia, String horarios) {
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
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green,
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
                    Text(horarios, style: const TextStyle(fontSize: 14)),
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
  const ProductTab({super.key, required this.products});
  final List<ProductModel> products;

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
                height: 260,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return productBox(product);
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget productBox(ProductModel product) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5,
            child: Container(
              width: 180,
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.purple.shade200,
                    backgroundImage: NetworkImage(product.imgURL),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    product.nombre,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    product.precio.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.brown,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.remove),
                      ),
                      const Text(
                        '0',
                        style: TextStyle(fontSize: 18),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "¡Quedan ${product.cantidad}!",
                    style: const TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
