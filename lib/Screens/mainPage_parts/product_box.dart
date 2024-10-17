import 'package:flutter/material.dart';
import 'package:umeals/domain/types/product_model.dart';

class ProductBox extends StatefulWidget {
  final ProductModel product;

  const ProductBox({super.key, required this.product});

  @override
  _ProductBoxState createState() => _ProductBoxState();
}

class _ProductBoxState extends State<ProductBox> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
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
                    backgroundImage: NetworkImage(widget.product.imgURL),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.product.nombre,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '\$${widget.product.precio.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
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
                        onPressed: () {
                          setState(() {
                            if (quantity > 0) quantity--;
                          });
                        },
                        icon: const Icon(Icons.remove),
                      ),
                      Text(
                        '$quantity',
                        style: const TextStyle(fontSize: 18),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (quantity < int.parse(widget.product.cantidad)) {
                              quantity++;
                            }
                          });
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "¡Quedan ${widget.product.cantidad}! ",
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
